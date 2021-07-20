import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:icon_shadow/icon_shadow.dart';
import 'package:mvp_monaghese/Product.dart';

import 'AnimationHandler.dart';
import 'DetailView.dart';
import 'Helpers.dart';
import 'Constants.dart';

class ResultItem extends StatelessWidget {
  final Product product;
  final int index;

  const ResultItem({Key key, this.product, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width * 2 / 3;
    var costButton = Container(
      padding: EdgeInsets.only(
        top: 15,
        left: 10,
        right: 0,
        bottom: 10,
      ),
      child: Row(
        children: [
          Icon(
            Icons.attach_money_rounded,
            color: primaryColorFont,
            size: 18,
          ),
          Text(
            "${product.cost}",
            style: TextStyle(
              color: primaryColorFont,
              fontSize: fontSize1 + 2,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(width: 5),
        ],
      ),
    );
    var buildImage = Hero(
      tag: "image${product.id}",
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: Material(
          color: Colors.transparent,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image(
                image: AssetImage(product.image),
                width: w / 3,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
    var buildName = Hero(
      tag: "name${product.id}",
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: Material(
          color: Colors.transparent,
          child: Text(
            product.name,
            style: TextStyle(
                color: primaryColorFont,
                fontSize: fontSize1,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
    var shopName = Hero(
      tag: "shopName${product.id}",
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: Material(
          color: Colors.transparent,
          child: Container(
            constraints: BoxConstraints(
              maxWidth: (w * 2 / 3) - 40,
            ),
            child: AutoSizeText(
              product.shopName,
              maxLines: 1,
              style: TextStyle(
                  color: primaryColorFont.withOpacity(0.6),
                  fontSize: fontSize2,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
    var star = Hero(
      tag: "isStared${product.id}",
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: Material(
          color: Colors.transparent,
          child: IconShadowWidget(
            Icon(
              product.isStared ? Icons.star_rounded : Icons.star_border_rounded,
              color: Colors.white,
              size: 25,
            ),
            shadowColor: Colors.white,
          ),
        ),
      ),
    );
    var cityDistance = Hero(
      tag: "shopCity${product.id}",
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: Material(
          color: Colors.transparent,
          child: Row(
            children: [
              Text(
                '${product.shopCity} - ',
                style: TextStyle(
                  color: Colors.black38,
                  fontSize: fontSize2,
                ),
              ),
              SizedBox(width: 5),
              Text(
                '${product.distance}m',
                style: TextStyle(
                    color: primaryColorFont.withOpacity(0.7),
                    fontSize: fontSize2,
                    fontWeight: FontWeight.bold),
              ),
              Icon(Icons.directions_walk)
            ],
          ),
        ),
      ),
    );
    return AnimationHandler().translateFromRight(
        InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => DetailView(product: product),
              ),
            );
          },
          child: Container(
            margin: EdgeInsets.only(top: 0, left: 10, right: 10, bottom: 15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
              boxShadow: [
                BoxShadow(
                    color: primaryColor.withOpacity(0.1),
                    blurRadius: 5,
                    spreadRadius: 0.5)
              ],
            ),
            child: Stack(
              children: [
                Positioned(
                  left: 0,
                  //bottom: 0,
                  child: Hero(
                    tag: "background${product.id}",
                    child: Material(
                      color: Colors.transparent,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(5),
                            topLeft: Radius.circular(5),
                          ),
                          color: primaryColor,
                        ),
                        padding:
                            EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                        width: (w / 3 / 2) + 8,
                        height: (w / 3) + 10 + 10 + 8 + 8 + 29,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 2,
                  //bottom: 0,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    child: star,
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(child: buildImage),
                      Container(
                        height: w / 3 + 30,
                        child: VerticalDivider(thickness: 1),
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            buildName,
                            SizedBox(height: 5),
                            Row(
                              children: [
                                shopName,
                                SizedBox(width: 5),
                                Container(
                                  child: Divider(),
                                  width: 10,
                                ),
                                Container(
                                  // padding: EdgeInsets.only(top: 10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      IconShadowWidget(
                                        Icon(Icons.star_rounded,
                                            size: 20, color: primaryColor),
                                        shadowColor: primaryColor,
                                        showShadow: false,
                                      ),
                                      IconShadowWidget(
                                        Icon(Icons.star_rounded,
                                            size: 20, color: primaryColor),
                                        shadowColor: primaryColor,
                                        showShadow: false,
                                      ),
                                      IconShadowWidget(
                                        Icon(Icons.star_rate_rounded,
                                            size: 20, color: primaryColor),
                                        shadowColor: primaryColor,
                                        showShadow: false,
                                      ),
                                      IconShadowWidget(
                                        Icon(Icons.star_half_rounded,
                                            size: 20, color: primaryColor),
                                        shadowColor: primaryColor,
                                        showShadow: false,
                                      ),
                                      IconShadowWidget(
                                        Icon(Icons.star_border_rounded,
                                            size: 20, color: primaryColor),
                                        shadowColor: primaryColor,
                                        showShadow: false,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 5),
                            cityDistance,
                            Row(
                              children: [
                                costButton,
                                SizedBox(width: 20),
                                Text('Tap On Card To Buy ...',
                                    style: TextStyle(
                                        color:
                                            primaryColorFont.withOpacity(0.5),
                                        fontSize: fontSize3 - 2)),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Curves.easeOutQuint,
        (index * 200.0));
  }
}
