import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myapp/ForgotPassword.dart';
import 'package:myapp/UiHelper.dart';
import 'package:myapp/main.dart';
import 'package:myapp/signupScreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();

login (String email , String password) async {
  if (email == "" && password == null){
    return UiHelper.CustomAlertBox(context, "Enter Required Fields");
  }
  else{
    UserCredential? userCredential;
    try {
      userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password
      ).then(( _){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>   MyHomePage ( title:" home")));
      }
      );
      
    } on FirebaseAuthException  catch (e){
      return UiHelper.CustomAlertBox(context, e.code.toString());
  }
}
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login Screen')),
      body: Column(
        children: [
          UiHelper.CustomTextField(emailcontroller, "Email", Icons.mail, false),
          UiHelper.CustomTextField(passwordcontroller, "Password", Icons.password, true),
          SizedBox(
            height: 30,
          ),
        

          UiHelper.CustomButton("login", () {
            login(emailcontroller.text.toString(), passwordcontroller.text.toString());
           }),
          SizedBox(
            height: 30,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Don't have an account?"),
              TextButton(
                onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const SignupScreen()));

                },
                child: const Text('Sign Up'),
              ),
            ],
          ),

          SizedBox(
            height: 30,
          ),
       
        ],
      ),

    );
  }
}