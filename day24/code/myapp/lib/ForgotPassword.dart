import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myapp/UiHelper.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {

    TextEditingController emailcontroller = TextEditingController();


forgotpassword(String email) async {
  if (email == ""){
    return UiHelper.CustomAlertBox(context, "Enter Email ");
  }
  else{
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      return UiHelper.CustomAlertBox(context, "Reset Password Link Sent to your Email");
    } on FirebaseAuthException  catch (e){
      return UiHelper.CustomAlertBox(context, e.code.toString());
  }
  }
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Forgot Password')),
      body: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Text("Enter your email address below and we'll send you a link to reset your password.", style: TextStyle(fontSize: 20),),
          SizedBox(
            height: 30,
          ),
          UiHelper.CustomTextField(emailcontroller, "Email", Icons.mail, false),
          SizedBox(
            height: 30,
          ),
          UiHelper.CustomButton("Send",() {
            forgotpassword(emailcontroller.text.toString());
          }, )
        ],
      ),
    );
  }
}