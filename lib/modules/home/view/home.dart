import 'package:capacitacion_vass/modules/home/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/material/scaffold.dart';

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
  TextEditingController _passwordController = TextEditingController();
  bool _tamanoGrande = false;
  bool _checked = false;

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
            padding: EdgeInsets.symmetric(horizontal: _width * 0.05),
            color: Colors.deepPurple,
            child: Align(
              alignment: Alignment.topCenter,
              child: SizedBox(
                width: _width,
                child: Card(
                  child: Padding(
                    padding: EdgeInsets.all(_width * 0.04),
                    child: Form(
                      key: formKey,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                              controller: _emailController,
                              keyboardType: TextInputType.emailAddress,
                              style: TextStyle(
                                  color: Colors.grey[700],
                                  fontSize: _tamanoGrande ? 18 : 14),
                              decoration: InputDecoration(
                                  labelText: "Email",
                                  hintText: "example@example.com"),
                              validator: (value){
                                if (value.isEmpty) {
                                  return 'Email is required';
                                }
                                return null;
                              }),
                          SizedBox(
                            height: 40,
                          ),
                          TextFormField(
                              controller: _passwordController,
                              obscureText: true,
                              keyboardType: TextInputType.visiblePassword,
                              style: TextStyle(
                                  color: Colors.grey[700],
                                  fontSize: _tamanoGrande ? 18 : 14),
                              decoration:
                                  InputDecoration(labelText: "Password"),
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Password is required';
                                } else{
                                  return null;
                                }
                              }),
                          SizedBox(
                            height: 20,
                          ),
                          CheckboxListTile(
                            title: Text("Remember me"),
                            controlAffinity: ListTileControlAffinity.platform,
                            value: _checked,
                            onChanged: (bool value) {
                              setState(() {
                                _checked = value;
                              });
                            },
                            activeColor: Colors.deepPurple,
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.deepPurple),
                            ),
                            onPressed: () {
                              if (formKey.currentState.validate()) {
                                Scaffold.of(context).showSnackBar(
                                    SnackBar(content: Text('Processing Data')));
                              }
                            },
                            child:
                                Text('Login', style: TextStyle(fontSize: 20)),
                          ),
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
