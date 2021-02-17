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
  TextEditingController _passwordController = TextEditingController();
  bool _tamanoGrande = false;
  bool _checked = false;
  bool _loading = false;

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
      resizeToAvoidBottomInset: false,
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
            padding: EdgeInsets.symmetric(horizontal: _width * 0.05),
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
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
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
                                  hintText: "example@example.com",
                                  prefixIcon: Icon(Icons.email_outlined)),
                              validator: (value) {
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
                              decoration: InputDecoration(
                                  labelText: "Password",
                                  prefixIcon: Icon(Icons.lock_outlined)),
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Password is required';
                                } else {
                                  return null;
                                }
                              }),
                          SizedBox(
                            height: 20,
                          ),
                          CheckboxListTile(
                            title: Text("Remember me"),
                            controlAffinity: ListTileControlAffinity.leading,
                            value: _checked,
                            onChanged: (bool value) {
                              setState(() {
                                _checked = value;
                              });
                            },
                            activeColor: Colors.deepPurple,
                          ),
                          Spacer(),
                          Container(
                            height: 50,
                            alignment: FractionalOffset.bottomCenter,
                            child: RaisedButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(60)),
                                onPressed: !_loading
                                    ? () {
                                        if (formKey.currentState.validate()) {
                                          Scaffold.of(localContext)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text('Processing Data'),
                                            ),
                                          );
                                          widget._controller
                                              .futuresTest(localContext);
                                        }
                                      }
                                    : null,
                                padding: EdgeInsets.all(0.0),
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
                                      child: !_loading
                                          ? Text(
                                              'Login',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.white),
                                            )
                                          : CircularProgressIndicator(),
                                    ))),
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

  @override
  void setLoading() {
    setState(() {
      _loading = true;
    });
  }

  @override
  void hideLoading() {
    setState(() {
      _loading = false;
    });
  }
}
