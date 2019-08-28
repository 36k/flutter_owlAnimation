import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:owl/widgets/card_login.dart';
import 'package:owl/widgets/owl.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  _LoginPageState createState() => _LoginPageState();
}
class _LoginPageState extends State<LoginPage> {
  FocusNode blankNode = FocusNode();
  final OwlAnimation owlAnimation = OwlAnimation();
  final CardLogin cardLogin = CardLogin();
  void initState() {
    final FocusNode passwordNode = cardLogin.passwordNode;
    passwordNode.addListener(() {
      if (passwordNode.hasFocus) {
        owlAnimation.closeEye();
      } else {
        owlAnimation.openEye();
      }
    });
    super.initState();
  }

  void _handleTapBank() {
    FocusScope.of(context).requestFocus(blankNode);
  }

  _handeLogin() async {}

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTapBank,
      child:  Container(
        decoration: BoxDecoration(color: Colors.blue),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            owlAnimation,
            cardLogin,
            Container(
              margin: EdgeInsets.only(top: 20, left: 10, right: 10),
              height: 40,
              child: RaisedButton(
                textColor: Colors.white,
                color: Colors.lightGreen,
                elevation: 30,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[Icon(Icons.near_me), Text("极速登录")],
                ),
                onPressed: () {
                  _handeLogin();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
