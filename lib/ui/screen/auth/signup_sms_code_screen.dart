import 'package:clutch/presentation/bloc/auth_bloc.dart';
import 'package:clutch/presentation/event/auth_event.dart';
import 'package:clutch/presentation/state/auth_state.dart';
import 'package:clutch/ui/localization/keys.dart';
import 'package:clutch/ui/widget/atom/bloc_error_indicator.dart';
import 'package:clutch/ui/widget/atom/loader_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:clutch/core/theme_custom.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_translate/global.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class SignUpSmsCodeScreen extends StatefulWidget {
  @override
  _SignUpSmsCodeScreenState createState() => _SignUpSmsCodeScreenState();
}

class _SignUpSmsCodeScreenState extends State<SignUpSmsCodeScreen> {
  TextEditingController smsCodeController = TextEditingController();

  @override
  Widget build(BuildContext context) => Scaffold(
          body: BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
        if (state is AuthLoading) {
          return LoaderIndicator();
        }
        if (state is AuthLoading) {
          return mainContent(context, state);
        }
        return BlocErrorIndicator("");
      }));

  Widget mainContent(BuildContext context, AuthLoading state) => Container(
        decoration: BoxDecoration(gradient: ThemeCustom.mainGradient),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 36.0, left: 16.0),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Image.asset("assets/images/ic_arrow_back.png")),
            ),
            Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 78.0, vertical: 16.0),
                  child: Text(
                    "Подтверждение номера телефона",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 24.0),
                  ),
                )),
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: Container(
                padding: EdgeInsets.only(left: 32.0, top: 16.0, bottom: 16.0),
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white.withOpacity(0.5),
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(8.0))),
                child: Row(
                  children: <Widget>[
                    Expanded(
                        child: Text(
                      "+380936629627",
                      style: TextStyle(color: Colors.white, fontSize: 16.0),
                    )),
                    Padding(
                      padding: const EdgeInsets.only(right: 16.0),
                      child: Image.asset("assets/images/ic_pencil.png"),
                    )
                  ],
                ),
              ),
            ),
            Text("Мы отправили вам на телефон код варификации"),
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: Text("Введите код из SMS"),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 42.0),
              child: PinCodeTextField(
                length: 6,
                obsecureText: false,
                animationType: AnimationType.fade,
                pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(5),
                    borderWidth: 0,
                    fieldHeight: 50,
                    fieldWidth: 40,
                    activeFillColor: Colors.white,
                    selectedFillColor: Colors.white,
                    inactiveFillColor: Colors.grey),
                animationDuration: Duration(milliseconds: 300),
                backgroundColor: Colors.transparent,
                enableActiveFill: true,
                controller: smsCodeController,
                onCompleted: (v) {},
                onChanged: (value) {},
              ),
            ),
            Expanded(
              flex: 4,
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 16.0),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: RaisedButton(
                                  padding: EdgeInsets.symmetric(vertical: 16.0),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0)),
                                  color: Color(0xFFFF473D),
                                  onPressed: () {
                                    /*Navigator.pushNamed(
                                          context, CustomRoute.SIGNUP_SCREEN);*/
                                    BlocProvider.of<AuthBloc>(context).add(
                                        PhoneCodeAuth(
                                            "0", smsCodeController.text));
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
      );
}
