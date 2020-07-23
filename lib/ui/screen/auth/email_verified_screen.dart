import 'package:clutch/core/custom_route.dart';
import 'package:clutch/core/theme_custom.dart';
import 'package:clutch/presentation/bloc/email_verification_bloc.dart';
import 'package:clutch/presentation/event/email_verification_event.dart';
import 'package:clutch/presentation/state/email_verification_state.dart';
import 'package:clutch/ui/localization/keys.dart';
import 'package:clutch/ui/screen/base_screen.dart';
import 'package:clutch/ui/widget/atom/bloc_error_indicator.dart';
import 'package:clutch/ui/widget/atom/border_input_text_field.dart';
import 'package:clutch/ui/widget/atom/loader_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_translate/global.dart';

class EmailVerifiedScreen extends StatefulWidget {
  @override
  _EmailVerifiedScreenState createState() => _EmailVerifiedScreenState();
}

class _EmailVerifiedScreenState extends State<EmailVerifiedScreen> {
  FocusNode _emailNode = FocusNode();
  final TextEditingController _emailInputController = TextEditingController();

  @override
  Widget build(BuildContext context) => BaseScreen(
        child: WillPopScope(
          onWillPop: () => Future.value(false),
          child: Scaffold(
            body: Container(
              decoration: BoxDecoration(gradient: ThemeCustom.mainGradient),
              child:
                  BlocListener<EmailVerificationBloc, EmailVerificationState>(
                listener: (context, state) {
                  if (state is EmailVerificationBaseActionBox) {
                    if (state.message.isNotEmpty) {
                      final snackBar =
                          SnackBar(content: Text(translate(state.message)));
                      Scaffold.of(context).showSnackBar(snackBar);
                    } else if (state.successScreen) {
                      Navigator.pushNamed(
                          context, CustomRoute.EMAIL_VERIFIED_CODE_SCREEN);
                    }
                  }
                },
                child:
                    BlocBuilder<EmailVerificationBloc, EmailVerificationState>(
                  builder: (context, state) {
                    if (state is EmailVerificationInitial) {
                      return buildInitialState(state);
                    }
                    if (state is EmailVerificationLoading) {
                      return LoaderIndicator();
                    }
                    return BlocErrorIndicator("");
                  },
                ),
              ),
            ),
          ),
        ),
      );

  Widget buildInitialState(EmailVerificationState state) => Column(
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
                      translate(Keys.Type_Corporation_Email),
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
                      textInputType: TextInputType.emailAddress,
                      node: _emailNode,
                      autofocus: true,
                      textAlign: TextAlign.left,
                      padding: EdgeInsets.all(0.0),
                      controller: _emailInputController,
                      hint: translate(Keys.Email),
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
                                  BlocProvider.of<EmailVerificationBloc>(
                                          context)
                                      .add(SendEmailEvent(_emailInputController
                                          .text
                                          .toString()));
                                },
                                child: Text(
                                  translate(Keys.Send_Email),
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
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, CustomRoute.INVITE_CODE_SCREEN);
            },
            child: Container(
              color: Colors.black,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  translate(Keys.Type_Company_Code),
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          )
        ],
      );
}
