import 'package:flutter/material.dart';

class CardLogin extends StatelessWidget {
  final FocusNode _passwordNode = FocusNode();
  FocusNode get passwordNode=>_passwordNode;
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  Map<String,String> get userNameAndPassword=>{
    "userName":_usernameController.text,
    "password":_passwordController.text
  };
  String _userNameValidator(String val){
    RegExp allNum=RegExp(r"[^0-9]");
    if(allNum.hasMatch(val)){
      return "请输入数字";
    }
    else if(val.length<11||val.length>12){
      return "账号为11-12位";
    }else{
      return null;
    }
  }
  String _passwordValidator(String val){
    return val.length<6?'密码最少六位':null;
  }
  CardLogin({key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
        child: Card(
            elevation: 27,
            margin: EdgeInsets.only(top: 0, left: 10, right: 10),
            child: Form(
              child: Padding(
                  padding: EdgeInsets.all(8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text("登录",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          )),
                      TextFormField(
                        validator: (val)=>_userNameValidator(val),
                        autovalidate: true,
                        controller: _usernameController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            icon: Icon(
                              Icons.school,
                              size: 47,
                            ),
                            hintText: "请输入学号",
                            hintStyle: TextStyle(fontWeight: FontWeight.w500)),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      TextFormField(
                        validator:(val)=>_passwordValidator(val),
                        controller: _passwordController,
                        obscureText: true,
                        autovalidate: true,
                        decoration: InputDecoration(
                            icon: Icon(
                              Icons.lock,
                              size: 47,
                            ),
                            hintText: "请输入密码，默认为身份证后六位",
                            hintStyle: TextStyle(fontWeight: FontWeight.w500)),
                        focusNode: _passwordNode,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                    ],
                  )),
            )));
  }
}
