import 'package:comiendoportriana/models/user.dart';
import 'package:flutter/material.dart';

class BarResponse {
  String? id;
  String? nombre;
  String? descripcion;
  User? owner;
  String? address;
  String? image;

  BarResponse(
      {this.id, this.nombre, this.descripcion, this.owner, this.address, this.image});

  BarResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nombre = json['nombre'];
    descripcion = json['descripcion'];
    owner = json['owner'];
    address = json['address'];
    image = json['image-'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nombre'] = this.nombre;
    data['descripcion'] = this.descripcion;
    data['owner'] = this.owner;
    data['address'] = this.address;
    data['image'] = this.image;
    return data;
  }
}
