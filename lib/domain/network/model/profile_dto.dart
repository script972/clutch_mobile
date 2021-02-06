import 'dart:convert';

class ProfileDto {
  final int id;
  final String firstName;
  final String lastName;
  final String email;
  final int birthday;
  final String facePhoto;
  final String sex;

  ProfileDto({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.birthday,
    this.facePhoto,
    this.sex,
  });

  factory ProfileDto.fromJson(String str) =>
      ProfileDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ProfileDto.fromMap(Map<String, dynamic> json) => ProfileDto(
      id: json['id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      email: json['email'],
      birthday: json['birthday'],
      facePhoto: json['facePhoto'],
      sex: json['sex']);

  Map<String, dynamic> toMap() => {
        'id': id,
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
        'birthday': birthday,
        'facePhoto': facePhoto,
        'sex': sex,
      };
}
