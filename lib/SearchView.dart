import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:mvp_monaghese/AnimationHandler.dart';
import 'package:mvp_monaghese/Product.dart';

import 'Helpers.dart';
import 'ResultView.dart';
import 'Constants.dart';

class SearchView extends StatefulWidget {
  @override
  _SearchViewState createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: SafeArea(
        child: Scaffold(
          body: Stack(
            children: [
              Align(
                alignment: Alignment.bottomLeft,
                child: Hero(
                  tag: 'bubble1',
                  child: Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                      color: primaryColor.withOpacity(0.05),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(0.0),
                          bottomLeft: Radius.circular(0.0),
                          bottomRight: Radius.circular(0.0),
                          topRight: Radius.circular(1000.0)),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Hero(
                  tag: 'bubble2',
                  child: Container(
                    height: 150,
                    width: 75,
                    margin: EdgeInsets.only(top: 150),
                    decoration: BoxDecoration(
                      color: primaryColor.withOpacity(0.05),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(1000.0),
                          bottomLeft: Radius.circular(1000.0),
                          bottomRight: Radius.circular(0.0),
                          topRight: Radius.circular(0.0)),
                    ),
                  ),
                ),
              ),
              Directionality(
                textDirection: TextDirection.ltr,
                child: SingleChildScrollView(
                  child: Stack(
                    children: [
                      Positioned(
                        child: Hero(
                          tag: 'bg',
                          child: Container(
                            height: (h * 20 / 100) + 50 + 34,
                            decoration: BoxDecoration(
                                color: primaryColor,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 5,
                                      spreadRadius: 5)
                                ]),
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(height: h * 5 / 100),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Hero(
                                      tag: 'logo',
                                      child: Image(
                                        image: AssetImage('images/logo.png'),
                                        height: h * 15 / 100,
                                        color: Colors.white,
                                      )),
                                  SizedBox(width: 15),
                                  AnimationHandler().translateFromLeft(
                                      Text(
                                        'Supplier Finder',
                                        style: TextStyle(
                                            fontSize: fontSize1,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Curves.easeOutQuint,
                                      0)
                                ],
                              ),
                              SizedBox(height: 50),
                              AnimationHandler().translateFromRight(
                                  Hero(
                                    tag: "searchField",
                                    child: Directionality(
                                      textDirection: TextDirection.ltr,
                                      child: Material(
                                        color: Colors.transparent,
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 20),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              boxShadow: [
                                                BoxShadow(
                                                    color: Colors.black12,
                                                    blurRadius: 5,
                                                    spreadRadius: 1)
                                              ],
                                            ),
                                            child: TypeAheadField(
                                              animationDuration:
                                                  Duration(microseconds: 0),
                                              textFieldConfiguration:
                                                  TextFieldConfiguration(
                                                      decoration:
                                                          InputDecoration(
                                                        fillColor: Colors.white,
                                                        hintText:
                                                            'Enter Product ...',
                                                        hintStyle: TextStyle(
                                                            fontSize: fontSize3,
                                                            color:
                                                                Colors.black38),
                                                        //contentPadding: EdgeInsets.only(top: 35),
                                                        prefixIcon: Container(
                                                          margin:
                                                              EdgeInsets.only(
                                                                  left: 15,
                                                                  right: 10),
                                                          decoration:
                                                              BoxDecoration(
                                                            color: primaryColor,
                                                            boxShadow: [
                                                              BoxShadow(
                                                                  color: Colors
                                                                      .black12,
                                                                  blurRadius: 5,
                                                                  spreadRadius:
                                                                      1)
                                                            ],
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5),
                                                          ),
                                                          child: IconButton(
                                                            icon: Icon(
                                                                Icons.search),
                                                            iconSize: 30,
                                                            color: Colors.white,
                                                            onPressed: () {
                                                              Navigator.of(
                                                                      context)
                                                                  .push(MaterialPageRoute(
                                                                      builder: (context) =>
                                                                          ResultView(
                                                                              searchString: _searchController.text)));
                                                            },
                                                          ),
                                                        ),
                                                        suffixIcon: IconButton(
                                                          icon: Icon(Icons
                                                              .arrow_right_rounded),
                                                          iconSize: 40,
                                                          color:
                                                              primaryColorIcon,
                                                          onPressed: () {
                                                            Navigator.of(
                                                                    context)
                                                                .push(MaterialPageRoute(
                                                                    builder: (context) =>
                                                                        ResultView(
                                                                            searchString:
                                                                                _searchController.text)));
                                                          },
                                                        ),
                                                        filled: true,
                                                        border:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide.none,
                                                          borderRadius:
                                                              BorderRadius.only(
                                                            topLeft:
                                                                Radius.circular(
                                                                    10),
                                                            topRight:
                                                                Radius.circular(
                                                                    10),
                                                          ),
                                                        ),
                                                      ),
                                                      controller:
                                                          _searchController,
                                                      textDirection:
                                                          TextDirection.ltr),
                                              suggestionsCallback:
                                                  (pattern) async {
                                                if (pattern.length < 3) {
                                                  return null;
                                                }
                                                List<Product> products = List();
                                                print('pattern = $pattern');
                                                products = populateSuggestions(
                                                    pattern);
                                                return products;
                                              },
                                              itemBuilder:
                                                  (context, Product product) {
                                                return Directionality(
                                                  textDirection:
                                                      TextDirection.ltr,
                                                  child: Container(
                                                    margin: EdgeInsets.all(5),
                                                    child: Container(
                                                      //padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),

                                                      child: Row(
                                                        children: [
                                                          ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(8.0),
                                                              child: Image(
                                                                image: AssetImage(
                                                                    product
                                                                        .image),
                                                                height: 52,
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                          ),
                                                          SizedBox(width: 10),
                                                          Container(
                                                              child:
                                                                  VerticalDivider(
                                                                      thickness:
                                                                          1),
                                                              height: 40),
                                                          SizedBox(width: 10),
                                                          Hero(
                                                            tag:
                                                                "productName${product.name}",
                                                            child:
                                                                Directionality(
                                                              textDirection:
                                                                  TextDirection
                                                                      .ltr,
                                                              child: Material(
                                                                color: Colors
                                                                    .transparent,
                                                                child: Text(
                                                                  product.name,
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .black38,
                                                                      fontSize:
                                                                          fontSize2),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Expanded(
                                                              child:
                                                                  Container()),
                                                          IconButton(
                                                            icon: Icon(Icons
                                                                .arrow_right_rounded),
                                                            color:
                                                                primaryColorIcon,
                                                            iconSize: 40,
                                                            onPressed: () {
                                                              Navigator.of(
                                                                      context)
                                                                  .push(
                                                                MaterialPageRoute(
                                                                  builder: (context) =>
                                                                      ResultView(
                                                                          searchString:
                                                                              product.name),
                                                                ),
                                                              );
                                                            },
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                              suggestionsBoxDecoration:
                                                  SuggestionsBoxDecoration(
                                                borderRadius: BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(10),
                                                  bottomRight:
                                                      Radius.circular(10),
                                                ),
                                                color: Colors.white,
                                                offsetX: 0,
                                                elevation: 4,
                                                shadowColor: Colors.black12,
                                              ),
                                              onSuggestionSelected: (product) {
                                                _searchController.text =
                                                    product.name;
                                                Navigator.of(context).push(
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            ResultView(
                                                                searchString:
                                                                    product
                                                                        .name)));
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Curves.easeOutQuint,
                                  300),
                              SizedBox(height: 25),
                              Divider(indent: 50, endIndent: 50),
                              SizedBox(height: 10),
                              AnimationHandler().translateFromRight(
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20, right: 20, bottom: 15),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.account_tree,
                                          color: Colors.black54,
                                        ),
                                        SizedBox(width: 10),
                                        Text(
                                          'Suggested Products',
                                          style: TextStyle(
                                              color: Colors.black54,
                                              fontSize: fontSize2),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Curves.easeOutQuint,
                                  600),
                              getSuggestedList(context) ?? Container,
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Hero(
                  tag: 'bubble3',
                  child: Container(
                    height: 150,
                    width: 75,
                    margin: EdgeInsets.only(top: 20),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.1),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(0.0),
                          bottomLeft: Radius.circular(0.0),
                          bottomRight: Radius.circular(1000.0),
                          topRight: Radius.circular(1000.0)),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
