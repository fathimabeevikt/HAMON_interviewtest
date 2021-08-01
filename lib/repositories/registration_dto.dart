import 'dart:convert';

import 'package:interview_test/model/registration.dart';

RegisterationDto registerationDtoFromJson(String str) =>
    RegisterationDto.fromJson(json.decode(str));

String registerationDtoToJson(RegisterationDto data) =>
    json.encode(data.toJson());

class RegisterationDto {
  RegisterationDto({
    required this.registrations,
  });

  List<Registration> registrations;

  factory RegisterationDto.fromJson(Map<String, dynamic> json) =>
      RegisterationDto(
        registrations: List<Registration>.from(
            json["registrations"].map((x) => Registration.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "registrations":
            List<dynamic>.from(registrations.map((x) => x.toJson())),
      };
}
