import 'package:rayo_taxi/features/driver/domain/entities/driver.dart';

class DriverModel extends Driver {
  DriverModel({
    int? id,
    String? name,
    String? email,
    String? password,
    int? years_old,
    int? id_company,
    String? path_photo,
  }) : super(
            id: id,
            name: name,
            email: email,
            password: password,
            years_old: years_old,
            id_company: id_company,
            path_photo: path_photo,
          );

  factory DriverModel.fromJson(Map<String, dynamic> json) {
    return DriverModel(
      id: json['id'] is int ? json['id'] : int.tryParse(json['id'].toString()) ?? 0,
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      password: json['password'] ?? '',
      years_old: json['years_old'] is int ? json['years_old'] : int.tryParse(json['years_old'].toString()) ?? 0,
      id_company: json['id_company'] is int ? json['id_company'] : int.tryParse(json['id_company'].toString()) ?? 0,
      path_photo: json['path_photo'] ?? '',
    );
  }

  factory DriverModel.fromEntity(Driver client) {
    return DriverModel(
      id: client.id,
      name: client.name,
      email: client.email,
      password: client.password,
      years_old: client.years_old,
      id_company: client.id_company,
      path_photo: client.path_photo,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'password': password,
      'years_old': years_old,
      'id_company': id_company,
      'path_photo': path_photo,
    };
  }
}