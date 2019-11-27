import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:coffetoffe/db/users.dart';
import 'package:coffetoffe/pages/home.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  UserServices _userServices = UserServices();
  
  TextEditingController _nameTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();

  String gender;
  String groupValue = "Male";

  bool loading = false;
  bool hidePass = true;
  bool hideCPass = true;

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
            color: Colors.black.withOpacity(0.4),
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
                            controller: _nameTextController,
                            decoration: InputDecoration(
                              hintText: "Name",
                              icon: Icon(Icons.person_outline),
                              border: InputBorder.none,
                            ),
                            validator: (value) {
                              if(value.isEmpty) {
                                return "Name cannot be empty.";
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                    ),
                    
                    // Padding(
                    //   padding: const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                    //   child: Container(
                    //     color: Colors.white.withOpacity(0.4),
                    //     child: Row(
                    //       children: <Widget>[
                    //         Expanded(
                    //           child: ListTile(
                    //             title: Text(
                    //               "Male", 
                    //               textAlign: TextAlign.end,
                    //               style: TextStyle(
                    //                 color: Colors.white
                    //               ),
                    //             ),
                    //             trailing: Radio(
                    //               value: "Male", 
                    //               groupValue: groupValue, 
                    //               onChanged: (e) => valueChange(e),
                    //             ),
                    //           ),
                    //         ),

                    //         Expanded(
                    //           child: ListTile(
                    //             title: Text(
                    //               "Female", 
                    //               textAlign: TextAlign.end,
                    //               style: TextStyle(
                    //                 color: Colors.white
                    //               ),
                    //             ),
                    //             trailing: Radio(
                    //               value: "Female", 
                    //               groupValue: groupValue, 
                    //               onChanged: (e) => valueChange(e),
                    //             ),
                    //           ),
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // ),

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
                              border: InputBorder.none,
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
                          child: ListTile(
                            title: TextFormField(
                              controller: _passwordTextController,
                              obscureText: hidePass,
                              decoration: InputDecoration(
                                hintText: "Password",
                                icon: Icon(Icons.lock_outline),
                                border: InputBorder.none,
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
                            trailing: IconButton(
                              icon: Icon(Icons.remove_red_eye, ),
                              onPressed: (){
                                setState(() {
                                  if(hidePass) {
                                    hidePass = false;
                                  }
                                  else {
                                    hidePass = true;
                                  }
                                });
                              },
                            ),
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
                          child: ListTile(
                            title: TextFormField(
                              controller: _confirmPasswordController,
                              obscureText: hideCPass,
                              decoration: InputDecoration(
                                hintText: "Confirm Password",
                                icon: Icon(Icons.lock_outline),
                                border: InputBorder.none,
                              ),
                              validator: (value) {
                                if(value.isEmpty) {
                                  return "The password field cannot be empty.";
                                }
                                else if(_passwordTextController.text != value) {
                                  return "The passwords did not match.";
                                }
                                return null;
                              },
                            ),
                            trailing: IconButton(
                              icon: Icon(Icons.remove_red_eye,),
                              onPressed: (){
                                setState(() {
                                  if(hideCPass) {
                                    hideCPass = false;
                                  }
                                  else {
                                    hideCPass = true;
                                  }
                                });
                              },
                            ),
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
                            "Register", 
                            textAlign: TextAlign.center, 
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                            ),
                          ),
                          onPressed: () {
                            validateForm();
                          },
                          minWidth: MediaQuery.of(context).size.width,
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: Text(
                          "Login",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
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

  valueChange(e) {
    setState(() {
      if(e == "Male") {
        groupValue = e;
        gender = e;
      }
      else if(e == "Female") {
        groupValue = e;
        gender = e;
      }
    });
  }

  void validateForm() async{
    FormState formState = _formKey.currentState;
    if(formState.validate()) {
      FirebaseUser user = await firebaseAuth.currentUser();
      if(user == null) {
        firebaseAuth.createUserWithEmailAndPassword(
          email: _emailTextController.text,
          password: _passwordTextController.text,
        ).then((user) => {
          
          _userServices.createUser(
            {
              "username": _nameTextController.text,
              "email": _emailTextController.text,
              "userid": user.user.uid,
            },
          )
        }).catchError((err) => { print(err.toString()) });

        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => new HomePage()));
      }
    }
  }
}