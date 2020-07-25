import 'package:clutch/core/custom_route.dart';
import 'package:clutch/core/theme_custom.dart';
import 'package:clutch/presentation/bloc/email_verified_code_bloc.dart';
import 'package:clutch/ui/localization/keys.dart';
import 'package:clutch/ui/screen/base_screen.dart';
import 'package:clutch/ui/widget/atom/bloc_error_indicator.dart';
import 'package:clutch/ui/widget/atom/border_input_text_field.dart';
import 'package:clutch/ui/widget/atom/loader_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_translate/global.dart';

class EmailVerifiedCodeScreen extends StatefulWidget {
  @override
  _EmailVerifiedCodeScreenState createState() =>
      _EmailVerifiedCodeScreenState();
}

class _EmailVerifiedCodeScreenState extends State<EmailVerifiedCodeScreen> {
  FocusNode _emailCodeNode = FocusNode();
  final TextEditingController _emailCodeInputController =
      TextEditingController();

  @override
  Widget build(BuildContext context) => BaseScreen(
        child: WillPopScope(
          onWillPop: () => Future.value(false),
          child: Scaffold(
            body: Container(
              decoration: BoxDecoration(gradient: ThemeCustom.mainGradient),
              child:
                  BlocListener<EmailVerifiedCodeBloc, EmailVerifiedCodeState>(
                listener: (context, state) {
                  if (state is EmailVerifiedCodeBaseActionBox) {
                    if (state.message.isNotEmpty) {
                      final snackBar =
                          SnackBar(content: Text(translate(state.message)));
                      Scaffold.of(context).showSnackBar(snackBar);
                    } else if (state.successScreen) {
                      Navigator.pushNamedAndRemoveUntil(
                          context,
                          CustomRoute.MAIN_SCREEN,
                          (Route<dynamic> route) => false);
                    }
                  }
                },
                child:
                    BlocBuilder<EmailVerifiedCodeBloc, EmailVerifiedCodeState>(
                  builder: (context, state) {
                    if (state is EmailVerifiedCodeInitial) {
                      return buildInitialState(state);
                    }
                    if (state is EmailVerifiedCodeLoading) {
                      return LoaderIndicator(showOnColor: true,);
                    }
                    return BlocErrorIndicator("");
                  },
                ),
              ),
            ),
          ),
        ),
      );

  Widget buildInitialState(EmailVerifiedCodeInitial state) => Column(
        children: <Widget>[
          Expanded(
              flex: 6,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Center(child: Image.asset("assets/images/logo.png")),
                  Padding(
                    padding: const EdgeInsets.only(top: 36.0),
                    child: Text(
                      translate(Keys.Service_The_Best_Offers),
                      style: TextStyle(color: Colors.white, fontSize: 24.0),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      translate(Keys.Input_Code_From_Email),
                      style: TextStyle(color: Colors.white, fontSize: 14.0),
                      textAlign: TextAlign.center,
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
                      textInputType: TextInputType.phone,
                      node: _emailCodeNode,
                      autofocus: true,
                      textAlign: TextAlign.left,
                      padding: EdgeInsets.all(0.0),
                      controller: _emailCodeInputController,
                      hint: translate(Keys.Code_From_Email),
                    ),
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
                                  BlocProvider.of<EmailVerifiedCodeBloc>(
                                          context)
                                      .add(SendCodeFromEmailEvent(
                                          _emailCodeInputController.text
                                              .toString()));
                                },
                                child: Text(
                                  translate(Keys.Connect_To_Company),
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
      );
}
