import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:icon_shadow/icon_shadow.dart';
import 'package:mvp_monaghese/AnimationHandler.dart';
import 'package:mvp_monaghese/Helpers.dart';

import 'Constants.dart';
import 'Product.dart';

class DetailView extends StatefulWidget {
  final Product product;

  const DetailView({Key key, this.product}) : super(key: key);
  @override
  _DetailViewState createState() => _DetailViewState();
}

class _DetailViewState extends State<DetailView> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Directionality(
      textDirection: TextDirection.ltr,
      child: SafeArea(
        child: Scaffold(
          body: Stack(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Hero(
                  tag: 'buuble3',
                  child: Container(
                    height: 150,
                    width: 75,
                    margin: EdgeInsets.only(
                        top: (width / 2.5) / 1.5 + 15, right: 30),
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
              Container(
                child: Stack(
                  children: [
                    Hero(
                      tag: "background${widget.product.id}",
                      child: Material(
                        color: Colors.transparent,
                        child: Container(
                          width: width / 2.5,
                          color: primaryColor,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Hero(
                        tag: 'bubble1',
                        child: Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.1),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(0.0),
                                bottomLeft: Radius.circular(0.0),
                                bottomRight: Radius.circular(1000.0),
                                topRight: Radius.circular(0.0)),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        padding: EdgeInsets.only(left: 30, top: 20),
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.only(right: 10),
                          width: width / 2.5,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              SizedBox(height: (width / 2.5) / 1.5),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(width: 20),
                                  Hero(
                                    tag: "isStared${widget.product.id}",
                                    child: Directionality(
                                      textDirection: TextDirection.ltr,
                                      child: Material(
                                        color: Colors.transparent,
                                        child: Column(
                                          children: [
                                            Container(
                                              child: IconShadowWidget(
                                                Icon(
                                                  widget.product.isStared
                                                      ? Icons.star_rate_rounded
                                                      : Icons
                                                          .star_border_rounded,
                                                  size: 50,
                                                  color: Colors.white,
                                                ),
                                                shadowColor: Colors.white,
                                              ),
                                            ),
                                            SizedBox(height: 5),
                                            widget.product.isStared
                                                ? Text(
                                                    'Top Supplier',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize:
                                                            fontSize3 - 3),
                                                  )
                                                : Container()
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: (width / 2.5)),
                              AnimationHandler().translateFromLeft(
                                  Container(
                                    width: (width * 1 / 3 - 10),
                                    padding: EdgeInsets.symmetric(
                                        vertical: 12, horizontal: 8),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(10),
                                          bottomRight: Radius.circular(10),
                                          topLeft: Radius.circular(50),
                                          bottomLeft: Radius.circular(50),
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.white70,
                                              blurRadius: 10,
                                              spreadRadius: 0.5)
                                        ]),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(
                                          Icons.phone,
                                          color: primaryColor,
                                          size: 20,
                                        ),
                                        SizedBox(width: 8),
                                        Expanded(child: Container()),
                                        Container(
                                          child: AutoSizeText(
                                            'Call Supplier',
                                            maxLines: 1,
                                            style: TextStyle(
                                                color: primaryColor,
                                                fontSize: fontSize2,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Expanded(child: Container()),
                                      ],
                                    ),
                                  ),
                                  Curves.easeOutExpo,
                                  300),
                              SizedBox(height: 20),
                              AnimationHandler().translateFromLeft(
                                  Container(
                                    width: (width * 1 / 3 - 10),
                                    padding: EdgeInsets.symmetric(
                                        vertical: 12, horizontal: 8),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(10),
                                          bottomRight: Radius.circular(10),
                                          topLeft: Radius.circular(50),
                                          bottomLeft: Radius.circular(50),
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.white70,
                                              blurRadius: 10,
                                              spreadRadius: 0.5)
                                        ]),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(
                                          Icons.attach_money,
                                          color: primaryColor,
                                          size: 20,
                                        ),
                                        SizedBox(width: 8),
                                        Expanded(child: Container()),
                                        Container(
                                          child: AutoSizeText(
                                            'Buy it',
                                            maxLines: 1,
                                            style: TextStyle(
                                                color: primaryColor,
                                                fontSize: fontSize2,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Expanded(child: Container()),
                                      ],
                                    ),
                                  ),
                                  Curves.easeOutExpo,
                                  600),
                            ],
                          ),
                        ),
                        SingleChildScrollView(
                          child: Container(
                            alignment: Alignment.topCenter,
                            padding: EdgeInsets.only(top: 68),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Hero(
                                  tag: "name${widget.product.id}",
                                  child: Directionality(
                                    textDirection: TextDirection.ltr,
                                    child: Material(
                                      color: Colors.transparent,
                                      child: Container(
                                        alignment: Alignment.centerLeft,
                                        padding: EdgeInsets.only(
                                            right: 10, top: 10, left: 20),
                                        // height: width / 2.5,
                                        width: ((width / 2.5) * 2) -
                                            ((width / 2.5) / 2) -
                                            4,
                                        child: Text(
                                          widget.product.name,
                                          style: TextStyle(
                                              fontSize: fontSize1,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 30),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.only(
                                        right: 20,
                                      ),
                                      child: VerticalDivider(
                                        thickness: 2,
                                      ),
                                      height: ((width / 2.5) * 2) / 100,
                                      width: width - (width / 2.5),
                                      alignment: Alignment.centerRight,
                                    ),
                                    SizedBox(height: 4),
                                    Container(
                                      padding: EdgeInsets.only(right: 20),
                                      child: VerticalDivider(
                                        thickness: 2,
                                      ),
                                      height: ((width / 2.5) * 2) / 100,
                                      width: width - (width / 2.5),
                                      alignment: Alignment.centerRight,
                                    ),
                                    SizedBox(height: 4),
                                    Container(
                                      padding: EdgeInsets.only(right: 20),
                                      child: VerticalDivider(
                                        thickness: 2,
                                      ),
                                      height: ((width / 2.5) * 6) / 100,
                                      width: width - (width / 2.5),
                                      alignment: Alignment.centerRight,
                                    ),
                                    SizedBox(height: 4),
                                    Container(
                                      padding: EdgeInsets.only(right: 20),
                                      child: VerticalDivider(
                                        thickness: 2,
                                      ),
                                      height: ((width / 2.5) * 20) / 100,
                                      width: width - (width / 2.5),
                                      alignment: Alignment.centerRight,
                                    ),
                                    SizedBox(height: 4),
                                    Container(
                                      padding: EdgeInsets.only(right: 20),
                                      child: VerticalDivider(
                                        thickness: 2,
                                      ),
                                      height: ((width / 2.5) * 50) / 100,
                                      width: width - (width / 2.5),
                                      alignment: Alignment.centerRight,
                                    ),
                                  ],
                                ),
                                SizedBox(height: 20),
                                AnimationHandler().translateFromRight(
                                  Container(
                                    padding: EdgeInsets.only(left: 20, top: 10),
                                    child: Text(
                                      'Supplier',
                                      style: TextStyle(
                                          color:
                                              primaryColorFont.withOpacity(0.5),
                                          fontSize: fontSize3),
                                    ),
                                  ),
                                  Curves.easeOutExpo,
                                  0,
                                ),
                                Row(
                                  children: [
                                    Hero(
                                      tag: "shopName${widget.product.id}",
                                      child: Directionality(
                                        textDirection: TextDirection.ltr,
                                        child: Material(
                                          color: Colors.transparent,
                                          child: Container(
                                            padding: EdgeInsets.only(
                                                left: 20, top: 10),
                                            child: Text(
                                              widget.product.shopName,
                                              style: TextStyle(
                                                  color: primaryColorFont,
                                                  fontSize: fontSize2,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 5),
                                    AnimationHandler().translateFromRight(
                                      Container(
                                        padding: EdgeInsets.only(top: 10),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            IconShadowWidget(
                                              Icon(Icons.star_rounded,
                                                  size: 20,
                                                  color: primaryColor),
                                              shadowColor: primaryColor,
                                              showShadow: false,
                                            ),
                                            IconShadowWidget(
                                              Icon(Icons.star_rounded,
                                                  size: 20,
                                                  color: primaryColor),
                                              shadowColor: primaryColor,
                                              showShadow: false,
                                            ),
                                            IconShadowWidget(
                                              Icon(Icons.star_rate_rounded,
                                                  size: 20,
                                                  color: primaryColor),
                                              shadowColor: primaryColor,
                                              showShadow: false,
                                            ),
                                            IconShadowWidget(
                                              Icon(Icons.star_half_rounded,
                                                  size: 20,
                                                  color: primaryColor),
                                              shadowColor: primaryColor,
                                              showShadow: false,
                                            ),
                                            IconShadowWidget(
                                              Icon(Icons.star_border_rounded,
                                                  size: 20,
                                                  color: primaryColor),
                                              shadowColor: primaryColor,
                                              showShadow: false,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Curves.easeOutExpo,
                                      0,
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10),
                                AnimationHandler().translateFromRight(
                                  Container(
                                    padding: EdgeInsets.only(left: 20, top: 10),
                                    child: Text(
                                      'Price',
                                      style: TextStyle(
                                          color:
                                              primaryColorFont.withOpacity(0.5),
                                          fontSize: fontSize3),
                                    ),
                                  ),
                                  Curves.easeOutExpo,
                                  0,
                                ),
                                Hero(
                                  tag: "cost${widget.product.id}",
                                  child: Directionality(
                                    textDirection: TextDirection.ltr,
                                    child: Material(
                                      color: Colors.transparent,
                                      child: Container(
                                        padding:
                                            EdgeInsets.only(left: 20, top: 10),
                                        child: Row(
                                          children: [
                                            Icon(Icons.attach_money_rounded,
                                                size: 17),
                                            Text(
                                              "${widget.product.cost}",
                                              style: TextStyle(
                                                  color: primaryColorFont,
                                                  fontSize: fontSize2,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10),
                                AnimationHandler().translateFromRight(
                                  Container(
                                    padding: EdgeInsets.only(left: 20, top: 10),
                                    child: Text(
                                      'City',
                                      style: TextStyle(
                                          color:
                                              primaryColorFont.withOpacity(0.5),
                                          fontSize: fontSize3),
                                    ),
                                  ),
                                  Curves.easeOutExpo,
                                  0,
                                ),
                                Hero(
                                  tag: "shopCity${widget.product.id}",
                                  child: Directionality(
                                    textDirection: TextDirection.ltr,
                                    child: Material(
                                      color: Colors.transparent,
                                      child: Container(
                                        padding:
                                            EdgeInsets.only(left: 20, top: 10),
                                        child: Row(
                                          children: [
                                            Text(
                                              "${widget.product.shopCity} - ${widget.product.distance}m ",
                                              style: TextStyle(
                                                  color: primaryColorFont,
                                                  fontSize: fontSize2,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Icon(
                                              Icons.directions_walk,
                                              size: 20,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 30),
                                AnimationHandler().translateFromRight(
                                    Container(
                                      padding:
                                          EdgeInsets.only(left: 20, top: 10),
                                      child: Text(
                                        'Description',
                                        style: TextStyle(
                                            color: primaryColorFont,
                                            fontSize: fontSize2,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Curves.easeOutExpo,
                                    100),
                                AnimationHandler().translateFromRight(
                                    Container(
                                      width: width - (width / 2.5) - 10,
                                      padding:
                                          EdgeInsets.only(left: 20, top: 10),
                                      child: Text(
                                        widget.product.description,
                                        style: TextStyle(
                                          color:
                                              primaryColorFont.withOpacity(0.5),
                                          fontSize: fontSize3,
                                        ),
                                      ),
                                    ),
                                    Curves.easeOutExpo,
                                    200),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Positioned(
                      top: (width / 2.5) / 1.5,
                      left: (width / 2.5) / 2,
                      child: Hero(
                        tag: "image${widget.product.id}",
                        child: Directionality(
                          textDirection: TextDirection.ltr,
                          child: Material(
                            color: Colors.transparent,
                            child: Container(
                              //padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(10),
                                  bottomRight: Radius.circular(10),
                                  topLeft: Radius.circular(10),
                                  bottomLeft: Radius.circular(10),
                                ),
                              ),
                              width: width / 2.5,
                              height: width / 2.5,
                              child: ClipRRect(
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(10),
                                    bottomRight: Radius.circular(10),
                                    topLeft: Radius.circular(10),
                                    bottomLeft: Radius.circular(10),
                                  ),
                                  child: Image(
                                    image: AssetImage(widget.product.image),
                                  )),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Hero(
                  tag: 'bubble2',
                  child: Container(
                    height: 150,
                    width: 150,
                    margin: EdgeInsets.only(top: 150),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.1),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(0.0),
                          bottomLeft: Radius.circular(0.0),
                          bottomRight: Radius.circular(0.0),
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
