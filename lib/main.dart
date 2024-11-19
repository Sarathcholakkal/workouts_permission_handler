import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Permission Handler Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PermissionHandlerExample(),
    );
  }
}

class PermissionHandlerExample extends StatefulWidget {
  @override
  _PermissionHandlerExampleState createState() =>
      _PermissionHandlerExampleState();
}

class _PermissionHandlerExampleState extends State<PermissionHandlerExample> {
  PermissionStatus _cameraStatus = PermissionStatus.denied;
  PermissionStatus _microphoneStatus = PermissionStatus.denied;
  PermissionStatus _locationStatus = PermissionStatus.denied;
  PermissionStatus _speechStatus = PermissionStatus.denied;

  // Function to handle permission requests
  Future<void> _requestPermissions() async {
    // Request camera permission
  
    // Request location permission
    PermissionStatus locationStatus = await Permission.location.request();
    // Request speech permission
   

    // If speech permission is permanently denied, guide user to system settings
    if (await Permission.speech.isPermanentlyDenied) {
      _showSettingsDialog(context);
    }

    // Update the permission statuses
    setState(() {
   
    });
  }

  // Show dialog to ask user to open system settings
  void _showSettingsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Permission Required"),
        content: Text(
            "The speech permission has been permanently denied. Please enable it from the system settings."),
        actions: <Widget>[
          TextButton(
            child: Text("Cancel"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: Text("Open Settings"),
            onPressed: () {
              openAppSettings(); // Open system settings for app
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Permission Handler Example"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            // Display camera permission status
            ListTile(
              title: Text("Camera Permission"),
              subtitle: Text(_cameraStatus.toString()),
              trailing: IconButton(
                icon: Icon(Icons.camera),
                onPressed: _requestPermissions,
              ),
            ),
            // Display microphone permission status
            ListTile(
              title: Text("Microphone Permission"),
              subtitle: Text(_microphoneStatus.toString()),
              trailing: IconButton(
                icon: Icon(Icons.mic),
                onPressed: _requestPermissions,
              ),
            ),
            // Display location permission status
            ListTile(
              title: Text("Location Permission"),
              subtitle: Text(_locationStatus.toString()),
              trailing: IconButton(
                icon: Icon(Icons.location_on),
                onPressed: _requestPermissions,
              ),
            ),
            // Display speech permission status
            ListTile(
              title: Text("Speech Permission"),
              subtitle: Text(_speechStatus.toString()),
              trailing: IconButton(
                icon: Icon(Icons.speaker),
                onPressed: _requestPermissions,
              ),
            ),
            // Button to request permissions
            ElevatedButton(
              onPressed: _requestPermissions,
              child: Text("Request Permissions"),
            ),
          ],
        ),
      ),
    );
  }
}
