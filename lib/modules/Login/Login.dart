import 'package:flutter/material.dart';
import 'package:prog1/shared/components/components.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var email = new TextEditingController();

  var password = new TextEditingController();

  var formKey = GlobalKey<FormState>();

  bool isPassworde = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Training"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Login",
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  ////// Email/////////////////
                  defaultTextFormField(
                    changed: (String value)
                      {
                        print(value);
                      },
                    type:TextInputType.emailAddress ,
                      control: email,
                      label: "Email address",
                      icon: Icons.email,
                      function: (String value){
                        if(value.isEmpty)
                          return 'E-mail must not be empty';
                        return null;
                      }
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  ////// password
                  defaultTextFormField(
                      isPassword: isPassworde ,
                      suffixed: isPassworde?Icons.visibility:Icons.visibility_off,
                      changed: (String value)
                      {
                        print(value);
                      },
                      type:TextInputType.visiblePassword ,
                      control: password,
                      label: "password",
                      icon: Icons.lock,
                      function: (String value){
                        if(value.isEmpty)
                          return 'password must not be empty';
                        return null;
                      },
                    suffixPressed: (){
                        setState(() {
                          isPassworde = ! isPassworde;
                        });
                    }
                  ),
                  SizedBox(
                    height: 15,
                  ),
                 defaultButton(

                     color: Colors.blue,
                     width: double.infinity,
                     fun: (){
                       if(formKey.currentState!.validate())
                         {
                           print(email.text);
                           print(password.text);
                         }
                     },
                     text: 'login'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't have an account? "),
                      TextButton(
                       onPressed: ()
                          {

                          },
                          child: Text("Register now"))
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
