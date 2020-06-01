import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_food_ordering/constants/values.dart';
import 'package:flutter_food_ordering/model/cart_model.dart';
import 'package:flutter_food_ordering/model/food_model.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class CheckOutPage extends StatefulWidget {
  _CheckOutPageState createState() => _CheckOutPageState();
}

class _CheckOutPageState extends State<CheckOutPage> {
  var now = DateTime.now();
  get weekDay => DateFormat('EEEE').format(now);
  get day => DateFormat('dd').format(now);
  get month => DateFormat('MMMM').format(now);

  ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    var cart = Provider.of<MyCart>(context);
    return Scaffold(
      body: SingleChildScrollView(
        controller: scrollController,
        physics: BouncingScrollPhysics(),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ...buildHeader(),
              //cart items list
              ListView.builder(
                itemCount: cart.cartItems.length,
                shrinkWrap: true,
                controller: scrollController,
                itemBuilder: (BuildContext context, int index) {
                  return buildCartItemList(cart, cart.cartItems[index]);
                },
              ),
              SizedBox(height: 16),
              Divider(),
              buildPriceInfo(cart),
              checkoutButton(cart, context),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> buildHeader() {
    return [
      SafeArea(
        child: InkWell(
          customBorder: StadiumBorder(),
          onTap: () => Navigator.of(context).pop(),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Icon(Icons.arrow_back_ios),
                SizedBox(width: 8),
                Text('Back', style: TextStyle(fontSize: 16)),
              ],
            ),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 24.0),
        child: Text('Cart', style: headerStyle),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 32.0, horizontal: 0),
        child: Text('$weekDay, ${day}th of $month ', style: headerStyle),
      ),
      FlatButton(
        child: Text('+ Add to order'),
        onPressed: () => Navigator.of(context).pop(),
      ),
    ];
  }

  Widget buildPriceInfo(MyCart cart) {
    double total = 0;
    for (CartItem cart in cart.cartItems) {
      total += cart.food.price * cart.quantity;
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text('Total:', style: headerStyle),
        Text('\$ ${total.toStringAsFixed(2)}', style: headerStyle),
      ],
    );
  }

  Widget checkoutButton(MyCart cart, context) {
    return Container(
      margin: EdgeInsets.only(top: 24, bottom: 64),
      width: double.infinity,
      child: RaisedButton(
        child: Text('Checkout', style: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.bold
        )),
        onPressed: () {
          cart.clearCart();
          Navigator.of(context).pop();
        },
        padding: EdgeInsets.symmetric(horizontal: 64, vertical: 12),
        color: Color(0xff528078),
        shape: StadiumBorder(),
      ),
    );
  }

  Widget buildCartItemList(MyCart cart, CartItem cartModel) {
    return Card(
      margin: EdgeInsets.only(bottom: 16),
      child: Container(
        padding: EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Flexible(
              flex: 3,
              fit: FlexFit.tight,
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(16)),
                child: Image.network(cartModel.food.image),
              ),
            ),
            Flexible(
              flex: 5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    height: 45,
                    child: Text(
                      cartModel.food.name,
                      style: subtitleStyle,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      InkWell(
                        customBorder: roundedRectangle4,
                        onTap: () => cart.decreaseItem(cartModel),
                        child: Icon(Icons.remove_circle),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 2),
                        child: Text('${cartModel.quantity}', style: titleStyle),
                      ),
                      InkWell(
                        customBorder: roundedRectangle4,
                        onTap: () => cart.increaseItem(cartModel),
                        child: Icon(Icons.add_circle),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Flexible(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    height: 45,
                    width: 70,
                    child: Text(
                      '\$ ${cartModel.food.price}',
                      style: titleStyle,
                      textAlign: TextAlign.end,
                    ),
                  ),
                  InkWell(
                    onTap: () => cart.removeAllInCart(cartModel.food),
                    customBorder: roundedRectangle12,
                    child: Icon(Icons.delete_sweep, color: Colors.red),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
