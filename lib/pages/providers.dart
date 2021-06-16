import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lab_3/cart_model.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartModel(),
      child: Consumer<CartModel>(
        builder: (context, state, _) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Scaffold(
              appBar: AppBar(
                title: Text(
                  'Change Notifier Provider',
                  style: TextStyle(color: Colors.blue),
                ),
                backgroundColor: Colors.white,
                actions: [
                  ShoppingCart(counter: state.getVal,),
                ],
              ),
              body: Container(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 5,
                      child: Padding(
                        padding: EdgeInsets.all(5),
                        child: Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10, top: 5),
                              child: Column(
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      cryptoIcon(),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      cryptoNameSymbol(),
                                      Spacer(),
                                      cryptoChange(),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      changeIcon(),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Align(
                                        child: Padding(
                                          padding: EdgeInsets.all(5),
                                          child: Row(
                                            children: [
                                              actionButtons(context),
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: <Widget>[cryptoAmount()],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  itemCount: 8,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget cryptoIcon() {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Image.network(
        'https://img.icons8.com/cotton/2x/bitcoin.png',
        width: 40,
        height: 40,
      ),
    );
  }

  Widget cryptoNameSymbol() {
    return Align(
      alignment: Alignment.centerLeft,
      child: RichText(
        text: TextSpan(
          text: 'Bitcoin',
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.black, fontSize: 20),
          children: <TextSpan>[
            TextSpan(
                text: '\nBTC',
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                    fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }

  Widget cryptoChange() {
    return Align(
      alignment: Alignment.topRight,
      child: RichText(
        text: TextSpan(
          text: '+3.67%',
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.green, fontSize: 20),
          children: <TextSpan>[
            TextSpan(
                text: '\n+202.835',
                style: TextStyle(
                    color: Colors.green,
                    fontSize: 15,
                    fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }

  Widget changeIcon() {
    return Align(
        alignment: Alignment.topRight,
        child: Icon(
          Icons.arrow_drop_up,
          color: Colors.green,
          size: 30,
        ));
  }

  Widget cryptoAmount() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0),
        child: Row(
          children: <Widget>[
            RichText(
              textAlign: TextAlign.left,
              text: TextSpan(
                text: '\n\$12.279',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 35,
                ),
                children: <TextSpan>[
                  TextSpan(
                      text: '\n0.1349',
                      style: TextStyle(
                          color: Colors.grey,
                          fontStyle: FontStyle.italic,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget actionButtons(context) {
    return TextButton(
      onPressed: () => Provider.of<CartModel>(context, listen: false).increment(),
      child: Container(
        child: Row(
          children: [
            Text('Add'),
            Icon(Icons.shopping_cart_outlined),
          ],
        ),
      ),
    );
  }
}

class ShoppingCart extends StatelessWidget {
  final counter;

  ShoppingCart({this.counter});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(7),
      child: Stack(
        clipBehavior: Clip.antiAlias,
        alignment: AlignmentDirectional.topStart,
        children: [
          Align(
            alignment: Alignment.bottomLeft,
            child: Icon(
              Icons.shopping_cart_outlined,
              color: Colors.grey,
              size: 30,
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: CircleAvatar(
              radius: 10,
              child: Text('${counter ?? 0}'),
              backgroundColor: Colors.pink,
            ),
          ),
        ],
      ),
    );
  }
}
