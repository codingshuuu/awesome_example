import 'package:example/api/api.dart';
import 'package:flutter/material.dart';
import 'package:awesome_base/awesome_base.dart';

class DebugPage extends StatefulWidget {
  const DebugPage({super.key});

  @override
  State<DebugPage> createState() => _DebugPageState();
}

class _DebugPageState extends BaseDebugState<DebugPage> {
  @override
  Future<void> confirmPress() {
    return API.switchHost(currentHost);
  }

  @override
  String get host => API.host;

  @override
  String get hostRc => API.hostRc;

  @override
  String get hostTest => API.hostTest;

  @override
  Future<void> switchIsEncrypt(bool encrypt) {
    return API.switchIsEncrypt(encrypt);
  }
}
