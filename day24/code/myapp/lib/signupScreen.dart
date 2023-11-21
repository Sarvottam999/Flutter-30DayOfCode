import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myapp/UiHelper.dart';
import 'package:myapp/main.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {

  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();

signUp(String email, String password) async {
  if (email == "" && password == null){
UiHelper.CustomAlertBox(context, "Enter Required Fields");
  }
  else{
    UserCredential? userCredential;
    try {
      userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
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
      appBar: AppBar(title: const Text('Signup Screen')),
      body: Column(
        children: [
          UiHelper.CustomTextField(emailcontroller, "Email", Icons.mail, false),
          UiHelper.CustomTextField(passwordcontroller, "Password", Icons.password, true),
          SizedBox(
            height: 30,
          ),
        

          UiHelper.CustomButton("SignUp", () {
            signUp(emailcontroller.text.toString(), passwordcontroller.text.toString());
           }),
          SizedBox(
            height: 30,
          ),

          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     Text("Don't have an account?"),
          //     TextButton(
          //       onPressed: () {},
          //       child: const Text('Sign Up'),
          //     ),
          //   ],
          // )

        ],
      ),

    );
  }
}