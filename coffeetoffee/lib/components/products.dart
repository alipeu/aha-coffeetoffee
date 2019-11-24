import 'package:coffeetoffee/pages/productDetails.dart';
import 'package:flutter/material.dart';

class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  var productList = [
    {
      "name": "Coffee", 
      "picture": "images/prod_cup.png",
      "old_price": 120,
      "price": 85,
    },
    {
      "name": "Hot Coffee", 
      "picture": "images/prod_cup.png",
      "old_price": 120,
      "price": 85,
    },
    {
      "name": "Cold Coffee", 
      "picture": "images/prod_cup.png",
      "old_price": 120,
      "price": 85,
    },
    {
      "name": "Birthday Cake", 
      "picture": "images/prod_cake.png",
      "old_price": 120,
      "price": 85,
    },
    {
      "name": "Sandwich", 
      "picture": "images/prod_sandwich.png",
      "old_price": 120,
      "price": 85,
    },
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: productList.length,
      gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2), 
      itemBuilder: (BuildContext context, int index){
        return SingleProduct(
          productName: productList[index]['name'],
          productPicture: productList[index]['picture'],
          productOldPrice: productList[index]['old_price'],
          productPrice: productList[index]['price'],
        );
      },
    );
  }
}

class SingleProduct extends StatelessWidget {
  final productName;
  final productPicture;
  final productOldPrice;
  final productPrice;
  
  SingleProduct({
    this.productName,
    this.productPicture,
    this.productOldPrice,
    this.productPrice
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(
        tag: productName,
        child: Material(
          child: InkWell(
            onTap: () => Navigator.of(context).push(
              new MaterialPageRoute(
                // passing product parameters to product details page
                builder: (context) => new ProductDetails(
                  productDetailName: productName,
                  productDetailPicture: productPicture,
                  productDetailOldPrice: productOldPrice,
                  productDetailPrice: productPrice,
                )
              )
            ),
            child: GridTile(
              footer: Container(
                color: Colors.white70,
                child: ListTile(
                  leading: Text(
                    productName,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  title: Text(
                    "Rp$productPrice",
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.w800
                    ),
                  ),
                  subtitle: Text(
                    "Rp$productOldPrice",
                    style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.w800,
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                ),
              ),
              child: Image.asset(
                productPicture,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}