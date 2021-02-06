import 'package:clutch/core/theme_custom.dart';
import 'package:clutch/presentation/bloc/invite_code_bloc.dart';
import 'package:clutch/presentation/event/invite_code_event.dart';
import 'package:clutch/presentation/state/invite_code_state.dart';
import 'package:clutch/ui/localization/keys.dart';
import 'package:clutch/ui/widget/atom/bloc_error_indicator.dart';
import 'package:clutch/ui/widget/atom/border_input_text_field.dart';
import 'package:clutch/ui/widget/atom/loader_indicator.dart';
import 'package:clutch/ui/widget/atom/red_material_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_translate/global.dart';

import '../base_screen.dart';

class InviteCodeScreen extends StatefulWidget {
  @override
  _InviteCodeScreenState createState() => _InviteCodeScreenState();
}

class _InviteCodeScreenState extends State<InviteCodeScreen> {
  final FocusNode _codeNode = FocusNode();
  final TextEditingController _codeController = TextEditingController();

  @override
  Widget build(BuildContext context) => BaseScreen(
          child: Scaffold(
              body: BlocListener<InviteCodeBloc, InviteCodeState>(
        listener: (context, state) {
          if (state is InviteCodeBaseActionBox) {
            Navigator.pushNamedAndRemoveUntil(
                context, state.route, (Route<dynamic> route) => false);
          }
        },
        child: Container(
            decoration: BoxDecoration(gradient: ThemeCustom.mainGradient),
            child: BlocBuilder<InviteCodeBloc, InviteCodeState>(
                builder: (context, state) {
              if (state is InviteCodeInitial) {
                return paidAccessForm();
              }
              if (state is LoadingState) {
                return LoaderIndicator(
                  showOnColor: true,
                );
              }
              return BlocErrorIndicator('');
            })),
      )));

  Widget paidAccessForm() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
                flex: 6,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Center(child: Image.asset('assets/images/logo.png')),
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
                        translate(Keys.Recieve_Code_By_Administration),
                        style: TextStyle(color: Colors.white, fontSize: 14.0),
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                )),
            Expanded(
                flex: 4,
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      BorderedInputTextField(
                        action: TextInputAction.next,
                        textInputType: TextInputType.number,
                        node: _codeNode,
                        autofocus: true,
                        textAlign: TextAlign.left,
                        padding: EdgeInsets.all(0.0),
                        controller: _codeController,
                        hint: translate(Keys.Company_Code),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 16.0),
                        child: RedMaterialButton(
                          title: translate(Keys.Connect_To_Company),
                          onPressed: () async {
                            BlocProvider.of<InviteCodeBloc>(context).add(
                                SendInviteCode(_codeController.value.text));
                          },
                        ),
                      )
                    ],
                  ),
                )),
          ],
        ),
      );
}
