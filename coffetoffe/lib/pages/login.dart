import 'package:coffetoffe/pages/register.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffetoffe/pages/home.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GoogleSignIn googleSignIn = new GoogleSignIn();
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();
  
  SharedPreferences preferences;
  bool loading = false;
  bool isLoggedIn = false;
  
  @override
  void initState() {
    super.initState();
    isSignedIn();
  }

  void isSignedIn() async{
    setState(() {
      loading = true;
    });

    preferences = await SharedPreferences.getInstance();
    isLoggedIn = await googleSignIn.isSignedIn();

    if(isLoggedIn) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => new HomePage()));
    }
    
    setState(() {
      loading = false;
    });
  }

  Future handleSignIn() async{
    preferences = await SharedPreferences.getInstance();

    setState(() {
      loading = true;
    });

    GoogleSignInAccount googleUser = await googleSignIn.signIn();
    GoogleSignInAuthentication googleSignInAuthentication = await googleUser.authentication;
    AuthCredential credential = GoogleAuthProvider.getCredential(
        idToken: googleSignInAuthentication.idToken, 
        accessToken: googleSignInAuthentication.accessToken);
    FirebaseUser firebaseUser = (await firebaseAuth.signInWithCredential(credential)).user;

    if(firebaseUser != null) {
      final QuerySnapshot result = await Firestore.instance
        .collection("users")
        .where("id", isEqualTo: firebaseUser.uid)
        .getDocuments();
      final List<DocumentSnapshot> documents = result.documents;
      if(documents.length == 0) {
        Firestore.instance.
          collection("users").
          document(firebaseUser.uid).
          setData({
            "id": firebaseUser.uid,
            "username": firebaseUser.displayName,
            "profilePicture": firebaseUser.photoUrl,
          });
        
        await preferences.setString("id", firebaseUser.uid);
        await preferences.setString("username", firebaseUser.displayName);
        await preferences.setString("profilePicture", firebaseUser.photoUrl);
      }
      else {
        await preferences.setString("id", documents[0]['id']);
        await preferences.setString("username", documents[0]['username']);
        await preferences.setString("profilePicture", documents[0]['profilePicture']);
      }

      Fluttertoast.showToast(msg: "Successfully logged in");
      setState(() {
        loading = false;
      });
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
    }
    else {
      Fluttertoast.showToast(msg: "Login failed :(");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Image.asset(
            'images/login.jpg', 
            fit: BoxFit.fill, 
            width: double.infinity,
            height: double.infinity,
          ),
          
          Container(
            color: Colors.black.withOpacity(0.6),
            width: double.infinity,
            height: double.infinity,
          ),

          Container(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.only(top: 100.0),
              child: Image.asset(
                "images/welcome.png", 
                height: 100.0,
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 250.0),
            child: Center(
              child: Form(
                key: _formKey,
                child: ListView(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                      child: Material(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.white.withOpacity(0.5),
                        elevation: 0.0,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 12.0),
                          child: TextFormField(
                            controller: _emailTextController,
                            decoration: InputDecoration(
                              hintText: "Email",
                              icon: Icon(Icons.alternate_email),
                            ),
                            validator: (value) {
                              if (value.isEmpty) {
                                Pattern pattern =
                                    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                                RegExp regex = new RegExp(pattern);
                                if (!regex.hasMatch(value))
                                  return 'Please make sure your email address is valid';
                                else
                                  return null;
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                      child: Material(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.white.withOpacity(0.5),
                        elevation: 0.0,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 12.0),
                          child: TextFormField(
                            controller: _passwordTextController,
                            decoration: InputDecoration(
                              hintText: "Password",
                              icon: Icon(Icons.lock_outline),
                            ),
                            validator: (value) {
                              if(value.isEmpty) {
                                return "The password field cannot be empty.";
                              }
                              else if(value.length < 6) {
                                return "The password must be at least 6 characters or longer.";
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                      child: Material(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.blue,
                        elevation: 0.0,
                        child: MaterialButton(
                          child: Text(
                            "Login", 
                            textAlign: TextAlign.center, 
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                            ),
                          ),
                          onPressed: (){},
                          minWidth: MediaQuery.of(context).size.width,
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Forgot password",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Register()));
                        },
                        child: Text(
                          "Register",
                          textAlign: TextAlign.center, 
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),

                    // Expanded(
                    //   child: Container(),
                    // ),

                    // Divider(
                    //   color: Colors.white,
                    // ),

                    // Text(
                    //   "OTHER LOGIN OPTION",
                    //   textAlign: TextAlign.center,
                    //   style: TextStyle(
                    //     color: Colors.white,
                    //     fontWeight: FontWeight.bold,
                    //     fontSize: 15.0,
                    //   ),
                    // ),

                    // Padding(
                    //   padding: const EdgeInsets.all(8.0),
                    //   child: Material(
                    //     borderRadius: BorderRadius.circular(20.0),
                    //     color: Colors.red.shade900,
                    //     elevation: 0.0,
                    //     child: MaterialButton(
                    //       child: Text(
                    //         "Google", 
                    //         textAlign: TextAlign.center, 
                    //         style: TextStyle(
                    //           color: Colors.white,
                    //           fontWeight: FontWeight.bold,
                    //           fontSize: 20.0,
                    //         ),
                    //       ),
                    //       onPressed: (){
                    //         handleSignIn();
                    //       },
                    //       minWidth: MediaQuery.of(context).size.width,
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
          ),
          Visibility(
            visible: loading ?? true,
            child: Center(
              child: Container(
                alignment: Alignment.center,
                color: Colors.white.withOpacity(0.9),
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}