import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clutch_mobile/core/custom_route.dart';
import 'package:flutter_clutch_mobile/core/theme_custom.dart';
import 'package:flutter_clutch_mobile/helpers/input_helper.dart';
import 'package:flutter_clutch_mobile/ui/widget/atom/border_input_text_field.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final FocusNode _emailNode = FocusNode();
  final FocusNode _passwordNode = FocusNode();

  TextEditingController emailInputController = TextEditingController();
  TextEditingController passwordInputController = TextEditingController();

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
                          onFieldSubmitted: (v) =>
                              changeFocus(context, _passwordNode),
                          action: TextInputAction.next,
                          labelText: "Email",
                          textInputType: TextInputType.emailAddress,
                          node: _emailNode,
                          controller: emailInputController,
                          /*changeCallback: (value) =>
                            userProfileViewModel.validateEmail(value),*/
                        ),
                        BorderedInputTextField(
                            obscure: true,
                            /* error: showPasswordValidationError
                              ? errorDescription(context, errorNewPassword)
                              : "",*/
                            changeCallback: (value) {
                              /*newPassword = value;
                            errorNewPassword =
                                getNewPasswordValidationError(newPassword);
                            errorNewPasswordAgain =
                                getNewPasswordAgainValidationError(
                                    newPasswordAgain, newPassword);*/
                            },
                            action: TextInputAction.next,
                            /*onFieldSubmitted: (v) =>
                              changeFocus(_newPasswordAgainNode),*/
                            labelText: "Password",
                            textInputType: TextInputType.multiline,
                            node: _passwordNode,
                            controller: passwordInputController),
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
                                        debugPrint("Ошибка");
                                        return;
                                      }
                                      handleSignInEmail(
                                          context,
                                          emailInputController.value.text
                                              .toString(),
                                          passwordInputController.value.text
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

  Future<FirebaseUser> handleSignInEmail(
      BuildContext context, String email, String password) async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    AuthResult result =
        await auth.signInWithEmailAndPassword(email: email, password: password);
    final FirebaseUser user = result.user;
    assert(user != null);
    assert(await user.getIdToken() != null);
    final FirebaseUser currentUser = await auth.currentUser();
    assert(user.uid == currentUser.uid);
    print('signin user succeeded: $user');
    Navigator.pushReplacementNamed(context, CustomRoute.MAIN_SCREEN);
    return user;
  }
}
