import 'dart:async';

import 'package:flutter/material.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:in_app_review/in_app_review.dart';

const Set<String> _kIds = {'1000_rub_donation', '100_rub_donation'};

class DonationScreen extends StatefulWidget {
  @override
  _DonationScreenState createState() => _DonationScreenState();
}

class _DonationScreenState extends State<DonationScreen> {
  final InAppReview inAppReview = InAppReview.instance;
  final InAppPurchaseConnection _connection = InAppPurchaseConnection.instance;
  StreamSubscription<List<PurchaseDetails>> _subscription;
  List<ProductDetails> _products;
  String id = '';

  String val = '';

  void _buyProduct(ProductDetails prod) {
    final PurchaseParam purchaseParam = PurchaseParam(productDetails: prod);
    _connection.buyConsumable(purchaseParam: purchaseParam, autoConsume: true);
  }

  Future<void> _getProducts() async {
    final ProductDetailsResponse response =
        await InAppPurchaseConnection.instance.queryProductDetails(_kIds);
    print(_products);
    _products = response.productDetails;
  }

  @override
  void initState() {
    Stream purchaseUpdated =
        InAppPurchaseConnection.instance.purchaseUpdatedStream;
    _subscription =
        purchaseUpdated.listen((purchaseDetailsList) {}, onDone: () {
      _subscription.cancel();
    }, onError: (error) {
      // handle error here.
    });
    _getProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [
          FlatButton.icon(
            icon: Icon(
              Icons.star_rate_rounded,
              color: Colors.blueAccent,
            ),
            onPressed: () async {
              if (await inAppReview.isAvailable()) {
                print('avaliable');
                inAppReview.requestReview();
              }
            },
            label: Text(
              'Оценить',
              style: TextStyle().copyWith(color: Colors.blueAccent),
            ),
          )
        ],
        title: Text(
          'Пожертвовать',
          style: TextStyle(color: Colors.blueAccent),
        ),
        iconTheme: IconThemeData(color: Colors.blueAccent),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  OutlineButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    onPressed: () {
                      setState(() {
                        id = _kIds.elementAt(0);
                        val = '100 руб';
                      });
                    },
                    child: Text('100 руб'),
                  ),
                  SizedBox(width: 15),
                  OutlineButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    onPressed: () {
                      setState(() {
                        id = _kIds.elementAt(0);
                        val = '1000 руб';
                      });
                    },
                    child: Text('1000 руб'),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              val,
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: InkWell(
              onTap: id.isEmpty
                  ? null
                  : () => _buyProduct(
                      _products.where((element) => element.id == id).first),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xffFFC01D).withOpacity(0.5),
                          offset: Offset(0, 2),
                          blurRadius: 10,
                          spreadRadius: 0.5,
                        )
                      ],
                      borderRadius: BorderRadius.circular(46),
                      color: Color(0xffFFC01D),
                    ),
                    margin: EdgeInsets.symmetric(vertical: 35, horizontal: 25),
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 25),
                    width: MediaQuery.of(context).size.width / 1.2,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Пожертвовать',
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
