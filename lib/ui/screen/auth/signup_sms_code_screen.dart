import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:clutch/core/theme_custom.dart';
import 'package:clutch/helpers/input_helper.dart';
import 'package:clutch/ui/widget/atom/border_input_text_field.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class SignUpSmsCodeScreen extends StatefulWidget {
  @override
  _SignUpSmsCodeScreenState createState() => _SignUpSmsCodeScreenState();
}

class _SignUpSmsCodeScreenState extends State<SignUpSmsCodeScreen> {
  final FocusNode _emailNode = FocusNode();
  final FocusNode _passwordNode = FocusNode();
  final FocusNode _passwordAgainNode = FocusNode();

  TextEditingController _emailInputController = TextEditingController();
  TextEditingController passwordInputController = TextEditingController();
  TextEditingController passwordAgainInputController = TextEditingController();

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Container(
          decoration: BoxDecoration(gradient: ThemeCustom.mainGradient),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 36.0, left: 16.0),
                child: Align(alignment: Alignment.centerLeft,child: Image.asset("assets/images/ic_arrow_back.png")),
              ),
              Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 78.0, vertical: 32.0),
                    child: Text("Подтверждение номера телефона", textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 24.0),),
                  )),
              Padding(
                padding: const EdgeInsets.all(32.0),
                child: Container(
                  padding: EdgeInsets.only(left: 32.0, top: 16.0, bottom: 16.0),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white.withOpacity(0.5), ),
                    borderRadius: BorderRadius.all(Radius.circular(8.0))
                  ),
                  child: Row(
                  children: <Widget>[
                    Expanded(child: Text("+380936629627", style: TextStyle(color: Colors.white, fontSize: 16.0),)),
                    Padding(
                      padding: const EdgeInsets.only(right: 16.0),
                      child: Image.asset("assets/images/ic_pencil.png"),
                    )
                  ],
                ),),
              ),
              Text("Мы отправили вам на телефон код варификации"),
              Text("Введите код из SMS"),
              PinCodeTextField(
                length: 6,
                obsecureText: false,
                animationType: AnimationType.fade,
               /* pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(5),
                  fieldHeight: 50,
                  fieldWidth: 40,
                  activeFillColor: Colors.white,
                ),*/
                animationDuration: Duration(milliseconds: 300),
                backgroundColor: Colors.blue.shade50,
                enableActiveFill: true,
                //errorAnimationController: errorController,
                //controller: textEditingController,
                onCompleted: (v) {
                  print("Completed");
                },
                onChanged: (value) {
                  print(value);
                  /*setState(() {
                    currentText = value;
                  });*/
                },
                beforeTextPaste: (text) {
                  print("Allowing to paste $text");
                  //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                  //but you can show anything you want here, like your pop up saying wrong paste format or etc
                  return true;
                },
              ),
              Expanded(
                flex: 4,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      children: <Widget>[
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );

  Future handleSignUp(String email, String password) async {
    /*final FirebaseAuth auth = FirebaseAuth.instance;
    AuthResult result = await auth.createUserWithEmailAndPassword(
        email: email, password: password);
    final FirebaseUser user = result.user;
    assert(user != null);
    assert(await user.getIdToken() != null);
    return user;*/
  }
}
