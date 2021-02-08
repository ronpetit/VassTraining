import 'package:capacitacion_vass/models/json_placeholder.dart';
import 'package:capacitacion_vass/networking/api_client.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class HomeController {
  View view;
  String emailAdress = "ozkaruriel@hotmail.es";
  String password = "12345678";
  final APIClient _client = APIClient(httpClient: http.Client());

  void attachView(View view) {
    this.view = view;
  }

  void detachView() {
    this.view = null;
  }

  void futuresTest() async {
    view.setLoading();
    JsonPlaceholder placeholder = await _client.getPlaceholder();
    await Future.delayed(Duration(seconds: 2), null);
    view.hideLoading();
    print(placeholder.title);
    print(placeholder.userID);
    print(placeholder.completed);
  }

}

abstract class View {
  GlobalKey<FormState> formKey;
  void setLoading();
  void hideLoading();
}
