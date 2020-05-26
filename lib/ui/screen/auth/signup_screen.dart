import 'package:flutter/material.dart';
import 'package:clutch/core/theme_custom.dart';
import 'package:clutch/helpers/input_helper.dart';
import 'package:clutch/ui/widget/atom/border_input_text_field.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final FocusNode _emailNode = FocusNode();
  final FocusNode _passwordNode = FocusNode();
  final FocusNode _passwordAgainNode = FocusNode();

  TextEditingController emailInputController = TextEditingController();
  TextEditingController passwordInputController = TextEditingController();
  TextEditingController passwordAgainInputController = TextEditingController();

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Container(
          decoration: BoxDecoration(gradient: ThemeCustom.mainGradient),
          child: Column(
            children: <Widget>[
              Expanded(
                  flex: 3,
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
                            onFieldSubmitted: (v) =>
                                changeFocus(context, _passwordAgainNode),
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
                            labelText: "Password Again",
                            textInputType: TextInputType.multiline,
                            node: _passwordAgainNode,
                            controller: passwordAgainInputController),
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
                                      if (passwordInputController.value.text
                                              .toString() !=
                                          passwordAgainInputController
                                              .value.text
                                              .toString()) {
                                        debugPrint("Ошибка паролей");
                                        return;
                                      }
                                      handleSignUp(
                                          emailInputController.value.text
                                              .toString(),
                                          passwordInputController.value.text
                                              .toString());
                                    },
                                    child: Text("Регистрация")),
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
