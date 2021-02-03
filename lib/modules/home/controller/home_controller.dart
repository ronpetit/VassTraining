import 'package:flutter/material.dart';

class HomeController {
  View view;

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