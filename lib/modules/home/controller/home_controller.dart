import 'package:capacitacion_vass/models/json_placeholder.dart';
import 'package:capacitacion_vass/networking/api_client.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeController {
  View view;
  final APIClient _client = APIClient(httpClient: http.Client());

  void attachView(View view) {
    this.view = view;
  }

  void detachView() {
    this.view = null;
  }

  void loginVerification(BuildContext context) async {
    if (view.formKey.currentState.validate()) {
      view.setLoading();
      JsonPlaceholder placeholder = await _client.getPlaceHolder();
      print(placeholder.userID);
      print(placeholder.title);
      Future.delayed(Duration(seconds: 2), () {
        view.hideLoading();
      });
    }
  }
}

abstract class View {
  GlobalKey<FormState> formKey;
  void setLoading();
  void hideLoading();
}