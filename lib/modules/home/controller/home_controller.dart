import 'dart:ffi';

import 'package:flutter/material.dart';

class HomeController {
  View view;
  String emailAdress = "ozkaruriel@hotmail.es";
  String password = "12345678";

  void attachView(View view) {
    this.view = view;
  }

  void detachView() {
    this.view = null;
  }
}

abstract class View {
  GlobalKey<FormState> formKey;
}

