import 'package:flutter/material.dart';
import 'package:weather_checker_master/screens/dashboard.dart';
import 'package:weather_checker_master/services/auths_services.dart';
import 'package:weather_checker_master/widgets/auths_form.dart';

class AuthsScreen extends StatelessWidget {
  AuthsScreen({Key? key}) : super(key: key);
  final email = TextEditingController();
  final password = TextEditingController();
  final formKey = GlobalKey<FormState>();
  AuthService authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        AuthsForm(
          formKey: formKey,
          email: email,
          password: password,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
                onTap: () async {
                  if (email.text.length > 1 && password.text.length > 5) {
                    var value =
                        await authService.signInUser(email.text, password.text);
                    if (value != null) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => DashBaord()));
                    }
                  }
                },
                child: Container(
                  height: 50,
                  width: 100,
                  color: Colors.blue,
                  alignment: Alignment.center,
                  child: Text("login"),
                )),
            GestureDetector(
                // onTap: () => null,
                child: Container(
              height: 50,
              width: 100,
              color: Colors.blue,
              alignment: Alignment.center,
              child: Text("signup"),
            ))
          ],
        )
      ])),
    );
  }
}
