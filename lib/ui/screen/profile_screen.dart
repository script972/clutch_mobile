import 'package:clutch/presentation/bloc/profile_bloc.dart';
import 'package:clutch/presentation/state/main_state.dart';
import 'package:clutch/presentation/state/profile_state.dart';
import 'package:clutch/ui/screen/base_screen.dart';
import 'package:clutch/ui/widget/atom/red_material_button.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:clutch/ui/localization/keys.dart';
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
                return bodyContent(state);
              }
            },
          ),
        ),
  );

  Widget bodyContent(ProfileLoaded state) => Center(
    child: Form(
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
                        backgroundImage:
                            /*userAvatar == null
                                ?  userData.userAvatarURL == null
                                ?*/
                            AssetImage('assets/images/avatar.png')
                        /* : NetworkImage(
                                userData.userAvatarURL)
                                : FileImage(userAvatar)*/
                        ,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 35.0),
                      child: IconButton(
                        onPressed: () async {
                          /*var image =
                              await ImagePicker.pickImage(
                                  source: ImageSource.gallery);

                              setState(() {
                                userAvatar = image;
                              });*/
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
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: TextFormField(
                        initialValue: "",
                        validator: (val) => val.isEmpty ? 'Введите имя' : null,
                        onChanged: (value) {
                          /* setState(() => firstName = value);*/
                        },
                        onFieldSubmitted: (v) => changeFocus(
                                context, _secondNameNode),
                            focusNode: _firstNameNode,
                            decoration: _inputDecoration.copyWith(
                                labelText: 'Имя'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: TextFormField(
                          /* initialValue: userData.secondName,
                            onChanged: (value) {
                              setState(() => secondName = value);
                            },*/
                            onFieldSubmitted: (v) => changeFocus(
                                context, _dateOfBirthNode),
                            focusNode: _secondNameNode,
                            decoration: _inputDecoration.copyWith(
                                labelText: 'Фамилия'),
                          ),
                    ),
                    Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12.0),
                          child: DateTimeField(
                            initialValue: DateTime(1997),
                            onChanged: (value) {
                             /* setState(() => dateOfBirth =
                                  DateFormat.yMMMMd('ru')
                                      .format(value) ??
                                      '');*/
                            },
                            decoration: _inputDecoration.copyWith(
                                labelText: 'Дата рождения'),
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
                            }, format: null,
                          ),
                        ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(26.0, 12.0, 0.0, 0.0),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text('Пол',
                            style: TextStyle(
                                color: Color(0xFFFF473D), fontSize: 14)),
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
                                value: 'Мужской',
                                activeColor: Color(0xFFFF473D),
                                groupValue: true,
                                /* onChanged: (val) => setState(
                                            () => gender = val),*/
                              ),
                              Text(
                                'Мужской',
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 60.0),
                            child: Row(
                              children: <Widget>[
                                Radio(
                                  value: 'Женский',
                                  activeColor: Color(0xFFFF473D),
                                  groupValue: false,
                                  /*onChanged: (val) => setState(
                                              () => gender = val),*/
                                ),
                                Text('Женский', style: TextStyle(fontSize: 16)),
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
          Expanded(child: SizedBox(),),
          Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0,
               bottom: 16.0),
            child: RedMaterialButton(
              title: 'Сохранить',
              onPressed: () async {
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    ),
  );

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
