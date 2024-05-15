import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  static const String screenName = "login";

  @override
  State<StatefulWidget> createState() {
    return _LoginWidget();
  }
}

class _LoginWidget extends State<LoginPage> with RouteAware {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        TextField(
                          controller: usernameController,
                          cursorColor: Theme.of(context).colorScheme.primary,
                          obscureText: false,
                          autocorrect: false,
                          autofillHints: const <String>[AutofillHints.password],
                          decoration: InputDecoration(
                            hintText: 'EamilId',
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Theme.of(context).colorScheme.primary,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        TextField(
                          controller: passwordController,
                          cursorColor: Theme.of(context).colorScheme.primary,
                          obscureText: true,
                          autocorrect: false,
                          autofillHints: const <String>[AutofillHints.password],
                          decoration: InputDecoration(
                            hintText: 'Password',
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Theme.of(context).colorScheme.primary,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        TextButton(
                            onPressed: () {
                              FirebaseAuth.instance
                                  .createUserWithEmailAndPassword(
                                      email: usernameController.text,
                                      password: passwordController.text)
                                  .then((value) {
                                print("Created New Account");
                                Navigator.of(context).pushNamed("/home");
                              }).onError((error, stackTrace) {
                                print("Error ${error.toString()}");
                              });
                              Navigator.of(context).pushNamed("/home");
                            },
                            child: Text("login")),

                        InkWell(
                          onTap: (){

                          }, child: Text("if you don't have account yet SignIn", style: TextStyle(fontSize:16, fontWeight: FontWeight.w600),))
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
