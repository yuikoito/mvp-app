import 'package:flutter/material.dart';

import 'AnimationHandler.dart';
import 'Product.dart';
import 'ResultView.dart';
import 'Constants.dart';

Widget getSuggestedList(BuildContext context) {
  List<Product> products = List();
  products = populateSuggestedProducts();
  return ListView.builder(
    primary: false,
    shrinkWrap: true,
    itemCount: products.length,
    itemBuilder: (context, index) {
      Product product = products[index];
      return AnimationHandler().translateFromRight(
          InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ResultView(searchString: product.name),
                ),
              );
            },
            child: Container(
              margin: EdgeInsets.only(top: 0, left: 20, right: 20, bottom: 15),
              //padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black12, blurRadius: 5, spreadRadius: 1)
                  ]),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image(
                        image: AssetImage(product.image),
                        height: 52,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Container(child: VerticalDivider(thickness: 1), height: 40),
                  SizedBox(width: 10),
                  Hero(
                    tag: "productName${product.name}",
                    child: Directionality(
                      textDirection: TextDirection.ltr,
                      child: Material(
                        color: Colors.transparent,
                        child: Text(
                          product.name,
                          style: TextStyle(
                              color: primaryColorFont, fontSize: fontSize2),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  Text(
                    '10 Suppliers',
                    style:
                        TextStyle(color: Colors.black38, fontSize: fontSize2),
                  ),
                  Expanded(child: Container()),
                  IconButton(
                    icon: Icon(Icons.arrow_right_rounded),
                    color: primaryColorIcon,
                    iconSize: 40,
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) =>
                              ResultView(searchString: product.name),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          Curves.easeOutQuint,
          900 + (index * 200.0));
    },
  );
}

List<Product> populateSuggestedProducts() {
  List<Product> products = [
    Product(
      id: 1,
      name: 'Stepper Tiba',
      image: "images/stepper-tiba.png",
    ),
    Product(
      id: 2,
      name: 'Stepper Pride',
      image: "images/stepper-tiba.png",
    ),
  ];
  return products;
}

List<Product> populateSuggestions(String search) {
  List<Product> products = populateProductsSugg();
  return products.where((item) {
    String str = search;
    String itemName = item.name;
    print('search = $str');
    print('itemName = $itemName');
    print("contains? ${itemName.contains(str)}");
    return itemName.contains(str);
  }).toList();
}

List<Product> populateProductsSugg() {
  return [
    ////////// suggestions ///////////
    Product(
      id: 1,
      name: 'Stepper',
      image: "images/stepper-tiba.png",
    ),
    Product(
      id: 1,
      name: 'Stepper Tiba',
      image: "images/stepper-tiba.png",
    ),
    Product(
      id: 2,
      name: 'Stepper Pride',
      image: "images/stepper-tiba.png",
    ),
    //////////// products ////////////
    Product(
      id: 1,
      name: 'Stebber Tiba G.A.T',
      cost: 95,
      image: "images/stepper-tiba.png",
      isStared: true,
      distance: 512,
      shopName: 'Joe Store',
      shopCity: 'New York',
      shopLat: 36.678607,
      shopLong: 48.490472,
      description:
          'A stepper motor, also known as step motor or stepping motor, is a brushless DC electric motor that divides a full rotation into a number of equal steps.',
    ),
    Product(
      id: 2,
      name: 'Stepper Tiba Zimens',
      cost: 115,
      image: "images/stepper-tiba.png",
      isStared: true,
      distance: 423,
      shopName: 'Vilage Car Shop',
      shopCity: 'New York',
      shopLat: 36.678883,
      shopLong: 48.499748,
      description:
          'A stepper motor, also known as step motor or stepping motor, is a brushless DC electric motor that divides a full rotation into a number of equal steps.',
    ),
    Product(
      id: 3,
      name: 'Stepper Tiba Zimens',
      cost: 95,
      image: "images/stepper-tiba.png",
      isStared: false,
      distance: 112,
      shopName: 'Grannys Store',
      shopCity: 'New York',
      shopLat: 36.681636,
      shopLong: 48.523785,
      description:
          'A stepper motor, also known as step motor or stepping motor, is a brushless DC electric motor that divides a full rotation into a number of equal steps.',
    ),
    Product(
      id: 4,
      name: 'Stepper Tiba G.A.T',
      cost: 100,
      image: "images/stepper-tiba.png",
      isStared: false,
      distance: 768,
      shopName: 'My Workshop',
      shopCity: 'New York',
      shopLat: 36.700907,
      shopLong: 48.513135,
      description:
          'A stepper motor, also known as step motor or stepping motor, is a brushless DC electric motor that divides a full rotation into a number of equal steps.',
    ),
    Product(
      id: 5,
      name: 'Stepper Tiba Zimens',
      cost: 105,
      image: "images/stepper-tiba.png",
      isStared: false,
      distance: 4365,
      shopName: 'Grannys Store 2',
      shopCity: 'New York',
      shopLat: 36.689070,
      shopLong: 48.476387,
      description:
          'A stepper motor, also known as step motor or stepping motor, is a brushless DC electric motor that divides a full rotation into a number of equal steps.',
    ),
    Product(
      id: 6,
      name: 'Stepper Pride Zimens',
      cost: 101,
      image: "images/stepper-tiba.png",
      isStared: false,
      distance: 4365,
      shopName: 'Grannys Store 2',
      shopCity: 'New York',
      shopLat: 36.689070,
      shopLong: 48.476387,
      description:
          'A stepper motor, also known as step motor or stepping motor, is a brushless DC electric motor that divides a full rotation into a number of equal steps.',
    ),
  ];
}

List<Product> populateProducts() {
  return [
    Product(
      id: 1,
      name: 'Stepper Tiba G.A.T',
      cost: 95,
      image: "images/stepper-tiba.png",
      isStared: true,
      distance: 512,
      shopName: 'Joe Store',
      shopCity: 'New York',
      shopLat: 36.678607,
      shopLong: 48.490472,
      description:
          'A stepper motor, also known as step motor or stepping motor, is a brushless DC electric motor that divides a full rotation into a number of equal steps.',
    ),
    Product(
      id: 2,
      name: 'Stepper Tiba Zimens',
      cost: 115,
      image: "images/stepper-tiba.png",
      isStared: true,
      distance: 423,
      shopName: 'Vilage Car Shop',
      shopCity: 'New York',
      shopLat: 36.678883,
      shopLong: 48.499748,
      description:
          'A stepper motor, also known as step motor or stepping motor, is a brushless DC electric motor that divides a full rotation into a number of equal steps.',
    ),
    Product(
      id: 3,
      name: 'Stepper Tiba Zimens',
      cost: 95,
      image: "images/stepper-tiba.png",
      isStared: false,
      distance: 112,
      shopName: 'Grannys Store',
      shopCity: 'New York',
      shopLat: 36.681636,
      shopLong: 48.523785,
      description:
          'A stepper motor, also known as step motor or stepping motor, is a brushless DC electric motor that divides a full rotation into a number of equal steps.',
    ),
    Product(
      id: 4,
      name: 'Stepper Tiba G.A.T',
      cost: 100,
      image: "images/stepper-tiba.png",
      isStared: false,
      distance: 768,
      shopName: 'My Workshop',
      shopCity: 'New York',
      shopLat: 36.700907,
      shopLong: 48.513135,
      description:
          'A stepper motor, also known as step motor or stepping motor, is a brushless DC electric motor that divides a full rotation into a number of equal steps.',
    ),
    Product(
      id: 5,
      name: 'Stepper Tiba Zimens',
      cost: 105,
      image: "images/stepper-tiba.png",
      isStared: false,
      distance: 4365,
      shopName: 'Grannys Store 2',
      shopCity: 'New York',
      shopLat: 36.689070,
      shopLong: 48.476387,
      description:
          'A stepper motor, also known as step motor or stepping motor, is a brushless DC electric motor that divides a full rotation into a number of equal steps.',
    ),
    Product(
      id: 6,
      name: 'Stepper Pride Zimens',
      cost: 101,
      image: "images/stepper-tiba.png",
      isStared: false,
      distance: 4365,
      shopName: 'Grannys Store 2',
      shopCity: 'New York',
      shopLat: 36.689070,
      shopLong: 48.476387,
      description:
          'A stepper motor, also known as step motor or stepping motor, is a brushless DC electric motor that divides a full rotation into a number of equal steps.',
    ),
  ];
}
