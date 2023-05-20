import 'package:flutter/material.dart';
import 'package:smart/core/app.dart';
import 'package:smart/core/injections/auth_injection.dart' as di;

void main()  async {
  await di.init();
  runApp(const Smart());
}
