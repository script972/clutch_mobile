import 'package:clutch/core/custom_route.dart';
import 'package:clutch/core/theme_custom.dart';
import 'package:clutch/ui/localization/keys.dart';
import 'package:clutch/ui/widget/atom/border_input_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';

class SignInPhoneScreen extends StatefulWidget {
  @override
  _SignInPhoneScreenState createState() => _SignInPhoneScreenState();
}

class _SignInPhoneScreenState extends State<SignInPhoneScreen> {
  final FocusNode _phoneNode = FocusNode();

  TextEditingController _phoneInputController = TextEditingController();

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Container(
          decoration: BoxDecoration(gradient: ThemeCustom.mainGradient),
          child: Column(
            children: <Widget>[
              Expanded(
                  flex: 6,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Center(child: Image.asset("assets/images/logo.png")),
                      Padding(
                        padding: const EdgeInsets.only(top: 36.0),
                        //TODO: text
                        child: Text(
                          "Сервис лучших условий",
                          style: TextStyle(color: Colors.white, fontSize: 24.0),
                        ),
                      )
                    ],
                  )),
              Expanded(
                flex: 4,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      children: <Widget>[
                        BorderedInputTextField(
                          action: TextInputAction.next,
                          labelText: translate(Keys.Phone_Number),
                          textInputType: TextInputType.phone,
                          node: _phoneNode,
                          autofocus: true,
                          textAlign: TextAlign.center,
                          padding: EdgeInsets.all(0.0),
                          controller: _phoneInputController,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 16.0),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: RaisedButton(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 16.0),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(8.0)),
                                    color: Color(0xFFFF473D),
                                    onPressed: () {
                                      //_phoneInputController.value.text
                                      //                                              .toString()
                                      Navigator.pushNamed(context, CustomRoute.SIGNUP_SCREEN);
                                    },
                                    child: Text(
                                      translate(Keys.Send_Code),
                                      style: TextStyle(color: Colors.white),
                                    )),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
