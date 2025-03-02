import 'package:flutter/material.dart';
import 'vehicle.dart';

class AddVehicleScreen extends StatefulWidget {
  final Function(Vehicle) onAdd;
  AddVehicleScreen({required this.onAdd});

  @override
  _AddVehicleScreenState createState() => _AddVehicleScreenState();
}

class _AddVehicleScreenState extends State<AddVehicleScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController mileageController = TextEditingController();
  final TextEditingController ageController = TextEditingController();

  void addVehicle() {
    final String name = nameController.text;
    final double mileage = double.tryParse(mileageController.text) ?? 0;
    final int age = int.tryParse(ageController.text) ?? 0;

    if (name.isNotEmpty && mileage > 0 && age >= 0) {
      // Add the vehicle by calling the onAdd function
      widget.onAdd(Vehicle(name: name, mileage: mileage, age: age));

      // Go back to the VehicleListScreen
      Navigator.pop(context);
    } else {
      // Optionally show a message if the input is invalid
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please fill in all fields correctly!")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Vehicle')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.asset('assets/logo.png', height: 100),
            SizedBox(height: 20),
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Vehicle Name'),
            ),
            TextField(
              controller: mileageController,
              decoration: InputDecoration(labelText: 'Mileage'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: ageController,
              decoration: InputDecoration(labelText: 'Age'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: addVehicle,
              child: Text('Add Vehicle'),
            ),
          ],
        ),
      ),
    );
  }
}
