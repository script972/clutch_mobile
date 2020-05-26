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
  final FocusNode _emailNode = FocusNode();

  TextEditingController emailInputController = TextEditingController();

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
                          /*onFieldSubmitted: (v) =>
                              changeFocus(context, _passwordNode),*/
                          action: TextInputAction.next,
                          labelText: translate(Keys.Phone_Number),
                          textInputType: TextInputType.emailAddress,
                          node: _emailNode,
                          padding: EdgeInsets.all(0.0),
                          controller: emailInputController,
                          /*changeCallback: (value) =>
                            userProfileViewModel.validateEmail(value),*/
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
                                      if (!(emailInputController.value !=
                                              null &&
                                          emailInputController.value
                                              .toString()
                                              .isNotEmpty &&
                                          emailInputController.value
                                              .toString()
                                              .contains("@"))) {
                                        return;
                                      }
                                      handleSignInEmail(
                                          context,
                                          emailInputController.value.text
                                              .toString());
                                    },
                                    child: Text("Войти")),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, CustomRoute.SIGNUP_SCREEN);
                    },
                    child: Text("Регистрация")),
              )
            ],
          ),
        ),
      );

  Future handleSignInEmail(BuildContext context, String email) async {
    /*final FirebaseAuth auth = FirebaseAuth.instance;
    AuthResult result =
        await auth.signInWithEmailAndPassword(email: email);
    final FirebaseUser user = result.user;
    assert(user != null);
    assert(await user.getIdToken() != null);
    final FirebaseUser currentUser = await auth.currentUser();*/
    /*assert(user.uid == currentUser.uid);
    print('signin user succeeded: $user');
    Navigator.pushReplacementNamed(context, CustomRoute.MAIN_SCREEN);
    return user;*/
  }
}
