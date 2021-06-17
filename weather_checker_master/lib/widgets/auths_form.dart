import 'package:flutter/material.dart';

class AuthsForm extends StatelessWidget {
  const AuthsForm(
      {Key? key,
      required this.email,
      required this.password,
      required this.formKey})
      : super(key: key);
  final TextEditingController email;
  final TextEditingController password;
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Form(
          key: formKey,
          child: Column(
            children: [
              Text("email"),
              TextField(
                controller: email,
              ),
              SizedBox(
                height: 20,
              ),
              Text("password"),
              TextField(
                controller: password,
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        )
      ],
    );
  }
}
