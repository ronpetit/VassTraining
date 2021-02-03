import 'package:capacitacion_vass/modules/home/controller/home_controller.dart';
import 'package:flutter/material.dart';

class MyNewApp extends StatefulWidget {
  final HomeController _controller = HomeController();

  @override
  State<StatefulWidget> createState() {
    return MyNewAppState();
  }
}

class MyNewAppState extends State<MyNewApp> implements View {
  double _width, _height;
  TextEditingController _emailController = TextEditingController();
  bool _tamanoGrande = false;

  @override
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    widget._controller.attachView(this);
  }

  @override
  void dispose() {
    widget._controller.detachView();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width;
    _height = MediaQuery.of(context).size.height;
    _tamanoGrande = true;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "LOGIN",
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        elevation: 0,
      ),
      body: Builder(
        builder: (BuildContext localContext) {
          return Container(
            width: _width,
            height: _height,
            padding: EdgeInsets.symmetric(horizontal: _width * 0.1),
            color: Colors.deepPurple,
            child: Align(
              alignment: Alignment.topCenter,
              child: SizedBox(
                width: _width,
                child: Card(
                  child: Padding(
                    padding: EdgeInsets.all(_width * 0.05),
                    child: Form(
                      key: formKey,
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Email",
                              textAlign: TextAlign.left,
                            ),
                          ),
                          TextFormField(
                            controller: _emailController,
                            keyboardType: TextInputType.emailAddress,
                            style: TextStyle(color: Colors.grey[700], fontSize: _tamanoGrande ? 20 : 14),
                            decoration: InputDecoration(labelText: "Email"),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
