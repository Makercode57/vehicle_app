import 'package:flutter/material.dart';
import 'vehicle.dart';

Color getVehicleColor(Vehicle vehicle) {
  if (vehicle.mileage >= 15) {
    return vehicle.age <= 5 ? Colors.green : Colors.amber;
  }
  return Colors.red;
}