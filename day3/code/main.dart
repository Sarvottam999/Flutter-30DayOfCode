import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
       
        body: AutheticationScreen(),
      ),
    );
  }
}
 
class AutheticationScreen extends StatefulWidget {
  const AutheticationScreen({super.key});

  @override
  State<AutheticationScreen> createState() => _AutheticationScreenState();
}

class _AutheticationScreenState extends State<AutheticationScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLogin = true;
  List<Map<String, String>> _users = [
    {'email': 'user1@example.com', 'password': '123'},
    {'email': 'user2@example.com', 'password': '123'},
    // Add more users if needed
  ];

  void _toggleAuthMode() {
    setState(() {
      _isLogin = !_isLogin;
    });
  }

  bool _submitForm() {
    final enteredEmail = _emailController.text;
    final enteredPassword = _passwordController.text;

    // Simulated authentication logic
    bool isAuthenticated = false;
    for (var user in _users) {
      if (user['email'] == enteredEmail &&
          user['password'] == enteredPassword) {
        isAuthenticated = true;
        break;
      }
    }

    if (isAuthenticated) {
      print('Authentication successful');
    } else {
      print('Authentication failed');
    }

    // Reset text fields after submission
    _emailController.clear();
    _passwordController.clear();
  return isAuthenticated;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(40.0),
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          const SizedBox(
            height: 50,
          ),
          // --------------------------------------------------
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                      onTap: _toggleAuthMode,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                      Padding(
                      padding: EdgeInsets.only(bottom: 10.0),
                      child: Text(
                        "Login",
                        style: TextStyle(
                            color: _isLogin ? Colors.blue :Color.fromARGB(255, 175, 219, 255),
                            fontFamily: "Roboto",
                            fontSize: 30,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    Container(
                      color: Colors.blue,
                      height: 4,
                      width: 40,
                    )
                  ],
                ),
              ),
              GestureDetector(
                      onTap: _toggleAuthMode,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                            color: _isLogin ? Color.fromARGB(255, 175, 219, 255):Colors.blue,
                            fontFamily: "Roboto",
                            fontSize: 30,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    Container(
                      color: Colors.blue,
                      height: 4,
                      width: 40,
                    )
                  ],
                ),
              )
            ],
          ),
          // --------------------------------------------------

            TextField(
            controller: _emailController,
            decoration: InputDecoration(labelText: 'Email'),
          ),
          // --------------------------------------------------

          Column(
            children: [
                TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(labelText: 'Password'),
              ),
              SizedBox(
                height: 5,
              ),
              Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'Forgot Password.',
                    textAlign: TextAlign.end,
                    style: TextStyle(color: Colors.grey),
                  )),
            ],
          ),

          // FilledButton(onPressed: null, child: const Text('Filled')),
          SizedBox(
            height: 60,
            width: 230,
            child: TextButton(
                child:
                    Text(  _isLogin ? "Login".toUpperCase() : "Sign Up".toUpperCase(), style: TextStyle(fontSize: 21)),
                style: ButtonStyle(
                    padding: MaterialStateProperty.all<EdgeInsets>(
                        EdgeInsets.fromLTRB(15, 5, 15, 5)),
                    foregroundColor: MaterialStateProperty.all<Color>(
                        const Color.fromARGB(255, 255, 255, 255)),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.blue),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(28.0),
                            side: BorderSide(color: Colors.blue)))),
                onPressed: () {
                  var temp =_submitForm();
                  if (temp == true) {
                     Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const newScreen()),
  );
                    
                  }
                },),
          ),
          const Text('or login with', textAlign: TextAlign.right),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RoundIconButtonWithLittleShow(img: "assets/face.png", onPressed: () {}),
              SizedBox(width: 20),
              RoundIconButtonWithLittleShow(img: "assets/insta.png", onPressed: () {}),
              SizedBox(width: 20),
              RoundIconButtonWithLittleShow(img: "assets/x.png", onPressed: () {})
            ],
          ),
          // const Text('dont have an account? '),
        ]));
  }
}

 

class RoundIconButtonWithLittleShow extends StatelessWidget {
  // final IconData icon;
  final Function onPressed;
  final String img;


  const RoundIconButtonWithLittleShow({
    Key? key,
    required this.onPressed,
    // required this.icon,
    required this.img,


  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 5.0,
          ),
        ],
        shape: BoxShape.circle,
        color: const Color.fromARGB(255, 255, 255, 255),
      ),
      child: Image.asset(img, height: 30,)
      
    );
  }
}


class newScreen extends StatelessWidget {
  const newScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Title( color: Colors.blue, child:Text("home")),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("you have logged in successfully  🤩 !", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),),
              ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Go back!'),
        ),
            ],
          ),
        ),
      ),
    );
  }
}