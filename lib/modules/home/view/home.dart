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
  TextEditingController _passController = TextEditingController();
  bool _tamanoGrande = false;
  bool _value = false;

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
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.deepPurple, Colors.purple],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight)),
        ),
        elevation: 0,
      ),
      body: Builder(
        builder: (BuildContext localContext) {
          return Container(
            width: _width,
            height: _height,
            padding: EdgeInsets.symmetric(horizontal: _width * 0.1),
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.deepPurple, Colors.purple],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight)),
            child: Align(
              alignment: Alignment.topCenter,
              child: SizedBox(
                width: _width,
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                  child: Padding(
                    padding: EdgeInsets.all(_width * 0.05),
                    child: Form(
                      key: formKey,
                      child: Column(
                        children: [
                          SizedBox(height: 30),
                          TextFormField(
                            controller: _emailController,
                            keyboardType: TextInputType.emailAddress,
                            style: TextStyle(
                                color: Colors.grey[700],
                                fontSize: _tamanoGrande ? 20 : 14),
                            decoration: InputDecoration(
                                labelText: "Email",
                                hintText: 'example@email.com',
                                prefixIcon: Icon(Icons.email_outlined)),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Required field!';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 20),
                          TextFormField(
                            controller: _passController,
                            obscureText: true,
                            style: TextStyle(
                                color: Colors.grey[700],
                                fontSize: _tamanoGrande ? 20 : 14),
                            decoration: InputDecoration(
                                labelText: "Password",
                                prefixIcon: Icon(Icons.lock_outlined)),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Required field!';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 25),
                          CheckboxListTile(
                            title: Text('Remember me'),
                            activeColor: Colors.deepPurple,
                            checkColor: Colors.white,
                            value: _value,
                            onChanged: (bool value) {
                              setState(() {
                                _value = value;
                              });
                            },
                            controlAffinity: ListTileControlAffinity.leading,
                          ),
                          Spacer(),
                          Container(
                              height: 50,
                              alignment: FractionalOffset.bottomCenter,
                              child: RaisedButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(60)),
                                onPressed: () {
                                  if (formKey.currentState.validate()) {
                                    Scaffold.of(context).showSnackBar(SnackBar(
                                        content: Text('Processing data')));
                                  }
                                },
                                child: Ink(
                                    decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                            colors: [
                                              Colors.deepPurple,
                                              Colors.purple
                                            ],
                                            begin: Alignment.centerLeft,
                                            end: Alignment.centerRight),
                                        borderRadius:
                                            BorderRadius.circular(30.0)),
                                    child: Container(
                                        constraints:
                                            BoxConstraints(minHeight: 50),
                                        alignment: Alignment.center,
                                        child: Text(
                                          'Login',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.white),
                                        ))),
                                padding: EdgeInsets.all(0.0),
                              )),
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
