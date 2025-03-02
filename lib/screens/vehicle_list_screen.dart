import 'package:flutter/material.dart';
import 'vehicle.dart';
import 'vehicle_utils.dart';
import 'add_vehicle_screen.dart'; // Import Add Vehicle Screen
import 'user_profile_screen.dart'; // Import User Profile Screen

class VehicleListScreen extends StatefulWidget {
  @override
  _VehicleListScreenState createState() => _VehicleListScreenState();
}

class _VehicleListScreenState extends State<VehicleListScreen> {
  List<Vehicle> vehicles = [
    Vehicle(name: 'Car A', mileage: 16, age: 3),
    Vehicle(name: 'Car B', mileage: 18, age: 6),
  ];

  // Function to add a new vehicle to the list
  void addVehicle(Vehicle vehicle) {
    setState(() {
      vehicles.add(vehicle);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vehicle List'),
        actions: [
          IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => UserProfileScreen()), // Navigate to User Profile Screen
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: vehicles.length,
        itemBuilder: (context, index) {
          final vehicle = vehicles[index];
          return Card(
            color: getVehicleColor(vehicle),
            child: ListTile(
              title: Text(vehicle.name),
              subtitle: Text('Mileage: ${vehicle.mileage} km/L | Age: ${vehicle.age} years'),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AddVehicleScreen(onAdd: addVehicle), // Pass the addVehicle function to AddVehicleScreen
          ),
        ),
      ),
    );
  }
}
