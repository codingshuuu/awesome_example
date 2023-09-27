
import 'package:flutter/cupertino.dart';

class AppProvider extends ChangeNotifier{
  String nickname = '';

  void updateUserInfo(String nickname, String ipArea){
    this.nickname = nickname;
    notifyListeners();
  }

}