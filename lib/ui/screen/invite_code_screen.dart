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

import 'base_screen.dart';

class InviteCodeScreen extends StatefulWidget {
  @override
  _InviteCodeScreenState createState() => _InviteCodeScreenState();
}

class _InviteCodeScreenState extends State<InviteCodeScreen> {
  final FocusNode _codeNode = FocusNode();
  final TextEditingController _codeController = TextEditingController();

  @override
  Widget build(BuildContext context) => BaseScreen(
      child: WillPopScope(
          onWillPop: () => Future.value(false),
          child: Scaffold(
              body: BlocListener<InviteCodeBloc, InviteCodeState>(
            listener: (context, state) {
              if (state is NavigationPath) {
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
                    return LoaderIndicator();
                  }
                  return BlocErrorIndicator("");
                })),
          ))));

  Widget paidAccessForm() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(translate(Keys.Code_For_Activate_Account)),
            BorderedInputTextField(
              action: TextInputAction.next,
              textInputType: TextInputType.number,
              node: _codeNode,
              autofocus: true,
              textAlign: TextAlign.left,
              padding: EdgeInsets.all(0.0),
              controller: _codeController,
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
              child: RedMaterialButton(
                title: translate(Keys.Save),
                onPressed: () async {
                  BlocProvider.of<InviteCodeBloc>(context)
                      .add(SendInviteCode(_codeController.value.text));
                },
              ),
            )
          ],
        ),
      );
}
