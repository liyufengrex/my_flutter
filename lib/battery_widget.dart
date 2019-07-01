import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BatteryWidget extends StatefulWidget {
  @override
  _BatteryWidgetState createState() => _BatteryWidgetState();
}

class _BatteryWidgetState extends State<BatteryWidget>
    with WidgetsBindingObserver {
  static const MethodChannel methodChannel =
      MethodChannel('samples.flutter.io/battery');
  static const EventChannel eventChannel =
      EventChannel('samples.flutter.io/event');
  String _batteryLevel = 'Battery level: unknown.';
  String _chargingStatus = 'Battery status: unknown.';

  Future<void> _getBatteryLevel() async {
    String batteryLevel;
    try {
      final int result = await methodChannel.invokeMethod('getBatteryLevel');
      batteryLevel = 'Battery level: $result%.';
      print('enter here');
    } on PlatformException {
      batteryLevel = 'Failed to get battery level.';
      print('enter exception');
    }
    setState(() {
      _batteryLevel = batteryLevel;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
//          Text(_batteryLevel),
          Text(_chargingStatus),
          RaisedButton(
            child: const Text('Refresh'),
//            onPressed: _getBatteryLevel,
            onPressed: _getBatteryLevel,
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    eventChannel.receiveBroadcastStream().listen(_onEvent, onError: _onError);
  }

  void _onEvent(Object event) {
    setState(() {
      _chargingStatus =
      "Battery status: ${event}charging.";
    });
  }

  void _onError(Object error) {
    setState(() {
      PlatformException exception = error;
      _chargingStatus = exception?.message ?? 'Battery status: unknown.';
    });
  }
}
