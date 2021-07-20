import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:mvp_monaghese/NoResultsFoundView.dart';
import 'package:mvp_monaghese/ResultItem.dart';

import 'Helpers.dart';
import 'LoadingView.dart';
import 'Product.dart';
import 'Constants.dart';

class ResultView extends StatefulWidget {
  final String searchString;

  ResultView({
    Key key,
    this.searchString,
  }) : super(key: key);
  @override
  _ResultViewState createState() => _ResultViewState();
}

class _ResultViewState extends State<ResultView> {
  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    searchProducts(widget.searchString);
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width * 2 / 3;
    double h = MediaQuery.of(context).size.height;
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        body: Stack(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Hero(
                tag: 'bubble1',
                child: Container(
                  height: 150,
                  width: 75,
                  decoration: BoxDecoration(
                    color: primaryColor.withOpacity(0.05),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(0.0),
                        bottomLeft: Radius.circular(0.0),
                        bottomRight: Radius.circular(1000.0),
                        topRight: Radius.circular(1000.0)),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Hero(
                tag: 'bubble2',
                child: Container(
                  height: 150,
                  width: 150,
                  margin: EdgeInsets.only(top: 150),
                  decoration: BoxDecoration(
                    color: primaryColor.withOpacity(0.05),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(1000.0),
                        bottomLeft: Radius.circular(0.0),
                        bottomRight: Radius.circular(0.0),
                        topRight: Radius.circular(0.0)),
                  ),
                ),
              ),
            ),
            NestedScrollView(
                headerSliverBuilder:
                    (BuildContext context, bool innerBoxIsScrolled) {
                  return <Widget>[
                    SliverAppBar(
                      expandedHeight: 130.0,
                      floating: false,
                      pinned: true,
                      centerTitle: false,
                      stretch: true,
                      actions: <Widget>[],
                      title: Hero(
                        tag: "productName${widget.searchString}",
                        child: Directionality(
                          textDirection: TextDirection.ltr,
                          child: Material(
                            color: Colors.transparent,
                            child: Text(
                              widget.searchString,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: fontSize3,
                              ),
                            ),
                          ),
                        ),
                      ),
                      backgroundColor: primaryColor,
                      flexibleSpace: FlexibleSpaceBar(
                        centerTitle: false,
                        background: Hero(
                          tag: "searchField",
                          child: Directionality(
                            textDirection: TextDirection.ltr,
                            child: Material(
                              color: Colors.transparent,
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: primaryColor,
                                  ),
                                  alignment: Alignment.bottomCenter,
                                  child: TypeAheadField(
                                    animationDuration:
                                        Duration(microseconds: 0),
                                    textFieldConfiguration:
                                        TextFieldConfiguration(
                                            decoration: InputDecoration(
                                              fillColor: Colors.white,
                                              hintText: 'Enter Product ...',
                                              hintStyle: TextStyle(
                                                  fontSize: fontSize3,
                                                  color: Colors.black38),
                                              //contentPadding: EdgeInsets.only(top: 35),
                                              prefixIcon: IconButton(
                                                icon: Icon(Icons.search),
                                                onPressed: () {
                                                  searchProducts(
                                                      _searchController.text);
                                                },
                                              ),
                                              suffixIcon: IconButton(
                                                icon: Icon(
                                                  Icons.arrow_right_rounded,
                                                  size: 40,
                                                ),
                                                color: primaryColorFont,
                                                onPressed: () {
                                                  searchProducts(
                                                      _searchController.text);
                                                },
                                              ),
                                              filled: true,
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide.none,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                            ),
                                            controller: _searchController,
                                            textDirection: TextDirection.ltr),
                                    suggestionsCallback: (pattern) async {
                                      if (pattern.length < 3) {
                                        return null;
                                      }
                                      List<Product> products = List();
                                      print('pattern = $pattern');
                                      products = populateSuggestions(pattern);
                                      return products;
                                    },
                                    itemBuilder: (context, Product product) {
                                      return Directionality(
                                        textDirection: TextDirection.ltr,
                                        child: ListTile(
                                          leading: Icon(Icons.shopping_cart),
                                          title: Text(product.name),
                                          //subtitle: Text('${product.cost}'),
                                        ),
                                      );
                                    },
                                    onSuggestionSelected: (product) {
                                      _searchController.text = product.name;
                                      searchProducts(_searchController.text);
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ];
                },
                body: _isLoaded
                    ? (products != null && products.length > 0)
                        ? Container(
                            child: ListView.builder(
                              itemCount: products.length,
                              itemBuilder: (context, index) {
                                Product product = products[index];
                                return ResultItem(
                                    product: product, index: index);
                              },
                            ),
                          )
                        : NoResultsFoundView()
                    : LoadingView()),
            Align(
              alignment: Alignment.topCenter,
              child: Hero(
                tag: 'buuble3',
                child: Container(
                  height: 50,
                  width: 100,
                  margin: EdgeInsets.only(top: 20),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.1),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(0.0),
                        bottomLeft: Radius.circular(1000.0),
                        bottomRight: Radius.circular(1000.0),
                        topRight: Radius.circular(0.0)),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Product> products = List();
  bool _isLoaded = false;

  Future searchProducts(String search) async {
    setState(() {
      _isLoaded = false;
    });
    await delay(Duration(milliseconds: 500));

    List<Product> searchProducts = populateProducts()
        .where((element) => element.name.contains(search))
        .toList();
    setState(() {
      _isLoaded = true;
      products = searchProducts;
    });
  }

  Future<void> delay(Duration duration) async {
    await Future<void>.delayed(duration);
  }
}
