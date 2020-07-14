import 'dart:io';

import 'package:clutch/helpers/utils/date_utils.dart';
import 'package:clutch/presentation/bloc/profile_bloc.dart';
import 'package:clutch/presentation/event/profile_event.dart';
import 'package:clutch/presentation/state/profile_state.dart';
import 'package:clutch/ui/localization/keys.dart';
import 'package:clutch/ui/screen/base_screen.dart';
import 'package:clutch/ui/widget/atom/bloc_error_indicator.dart';
import 'package:clutch/ui/widget/atom/red_material_button.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_translate/global.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final FocusNode _firstNameNode = FocusNode();
  final FocusNode _secondNameNode = FocusNode();
  final FocusNode _dateOfBirthNode = FocusNode();

  TextEditingController _firstNameController;
  TextEditingController _lastNameController;
  TextEditingController _birthdayController;


  @override
  Widget build(BuildContext context) => BaseScreen(
        child: Scaffold(
          backgroundColor: Color(0xFFF6F6F6),
          appBar: AppBar(
            title: Text(translate(Keys.Profile)),
          ),
          body: BlocBuilder<ProfileBloc, ProfileState>(
            builder: (context, state) {
              if (state is ProfileLoading) {
                return Center(child: CircularProgressIndicator());
              }
              if (state is ProfileLoaded) {
                _firstNameController = TextEditingController.fromValue(
                    TextEditingValue(
                        text: state.name,
                        selection: TextSelection.collapsed(
                            offset: state.name.length)));

                _lastNameController = TextEditingController.fromValue(
                    TextEditingValue(
                        text: state.lastName,
                        selection: TextSelection.collapsed(
                            offset: state.lastName.length)));

                _birthdayController =
                    TextEditingController.fromValue(TextEditingValue(
                  text:  DateUtils.timestampToString(state.birthday),
                ));

                return bodyContent(state);
              }
              return Center(
                child: BlocErrorIndicator("Error"),
              );
            },
          ),
        ),
      );

  Widget bodyContent(ProfileLoaded state) => Center(
        child: Form(
          child: CustomScrollView(
            slivers: <Widget>[
              SliverFillRemaining(
                hasScrollBody: false,
                child: Column(
                  children: <Widget>[
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 35.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(left: 80.0),
                                child: CircleAvatar(
                                  radius: 45.0,
                                  backgroundImage: detectImage(
                                      state.photo, state.photoExternal),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 35.0),
                                child: IconButton(
                                  onPressed: () async {
                                    BlocProvider.of<ProfileBloc>(context)
                                        .add(ChangePhoto());
                                  },
                                  icon: Icon(Icons.camera_enhance),
                                  color: Colors.black.withOpacity(0.30),
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          color: Colors.white,
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12.0),
                                child: TextFormField(
                                  validator: (val) => val.isEmpty
                                      ? translate(Keys.Type_Name)
                                      : null,
                                  onChanged: (value) {
                                    BlocProvider.of<ProfileBloc>(context)
                                        .add(ChangeName(value));
                                  },
                                  onFieldSubmitted: (v) =>
                                      changeFocus(context, _secondNameNode),
                                  focusNode: _firstNameNode,
                                  controller: _firstNameController,
                                  decoration: _inputDecoration.copyWith(
                                      labelText: translate(Keys.Name)),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12.0),
                                child: TextFormField(
                                  onFieldSubmitted: (v) =>
                                      changeFocus(context, _dateOfBirthNode),
                                  focusNode: _secondNameNode,
                                  controller: _lastNameController,
                                  onChanged: (value) {
                                    BlocProvider.of<ProfileBloc>(context)
                                        .add(ChangeLastName(value));
                                  },
                                  decoration: _inputDecoration.copyWith(
                                      labelText: translate(Keys.Last_Name)),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12.0),
                                child: DateTimeField(
                                  controller: _birthdayController,
                                  onChanged: (value) {
                                    /* setState(() => dateOfBirth =
                                  DateFormat.yMMMMd('ru')
                                      .format(value) ??
                                      '');*/
                                  },
                                  decoration: _inputDecoration.copyWith(
                                      labelText: translate(Keys.Birhday)),
                                  onShowPicker: (context, currentValue) {
                                    return showDatePicker(
                                      context: context,
                                      firstDate: DateTime(1900),
                                      initialDate:
                                          currentValue ?? DateTime.now(),
                                      lastDate: DateTime.now()
                                          .add(Duration(days: 31)),
                                      locale: const Locale("ru", "RU"),
                                    );
                                  },
                                  format: null,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    26.0, 12.0, 0.0, 0.0),
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(translate(Keys.Sex),
                                      style: TextStyle(
                                          color: Color(0xFFFF473D),
                                          fontSize: 14)),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        Radio(
                                          value: "MALE",
                                          activeColor: Color(0xFFFF473D),
                                          groupValue: state.sex,
                                          onChanged: (val) =>
                                              setState(() => BlocProvider.of<ProfileBloc>(context)
                                                  .add(ChangeSex(val))),
                                        ),
                                        Text(
                                          translate(Keys.Man),
                                          style: TextStyle(fontSize: 16),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 60.0),
                                      child: Row(
                                        children: <Widget>[
                                          Radio(
                                            value: "FEMALE",
                                            activeColor: Color(0xFFFF473D),
                                            groupValue: state.sex,
                                            onChanged: (val) => setState(
                                              () => BlocProvider.of<ProfileBloc>(context)
                                                  .add(ChangeSex(val))),
                                          ),
                                          Text(translate(Keys.Women),
                                              style: TextStyle(fontSize: 16)),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: SizedBox(),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 16.0, right: 16.0, bottom: 16.0),
                      child: RedMaterialButton(
                        title: translate(Keys.Save),
                        onPressed: () async {
                          BlocProvider.of<ProfileBloc>(context)
                              .add(SaveProfile());
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      );

  ImageProvider detectImage(String photo, bool photoExternal) {
    if (photo == null || photo.isEmpty) {
      return AssetImage('assets/images/avatar.png');
    } else if (photoExternal) {
      return NetworkImage(photo);
    } else if (!photoExternal)
      return FileImage(File(photo));
    else {
      return AssetImage('assets/images/avatar.png');
    }
  }

  changeFocus(BuildContext context, FocusNode node) =>
      FocusScope.of(context).requestFocus(node);

  InputDecoration get _inputDecoration => InputDecoration(
        fillColor: Color(0xFFFFFFFF),
        filled: true,
        labelStyle: TextStyle(color: Color(0xFFFF473D), fontSize: 14),
        contentPadding: EdgeInsets.all(12.0),
        disabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xFFFFFFFF),
            width: 2.0,
          ),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black.withOpacity(0.14),
            width: 1.0,
            style: BorderStyle.solid,
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide:
              BorderSide(color: Colors.black.withOpacity(0.14), width: 1.0),
        ),
      );
}
