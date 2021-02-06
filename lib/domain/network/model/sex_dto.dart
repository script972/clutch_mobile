import 'package:clutch/helpers/utils/enum_invertor.dart';

enum Sex { MALE, FEMALE }

final sexValues = EnumInvertor({
  'MALE': Sex.MALE,
  'FEMALE': Sex.FEMALE,
});
