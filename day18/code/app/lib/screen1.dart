import 'package:day1/db_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:day1/sql_service.dart';

enum status {
  notAuth,
  correct,
  wrong,
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

  status isUserAuth = status.notAuth;

  @override
  void initState() {
    final sql_provider = Provider.of<Sql_services>(context, listen: false);
    sql_provider.openDBConnection();

    super.initState();
  }

  void inserOne() {
    DateTime now = DateTime.now();
// convert "now" to int
    int id = int.parse(now.day.toString() +
        now.hour.toString() +
        now.minute.toString() +
        now.second.toString());
    final sql_provider = Provider.of<Sql_services>(context, listen: false);
    Future<int> result =
        sql_provider.insertUser(User(id: id, email: "s", password: "s"));
    print(result.toString() + "  <------------ result");
  }

  void _toggleAuthMode() {
    setState(() {
      _isLogin = !_isLogin;
      isUserAuth = status.notAuth;
    });
  }

  // creat function for login
  Future<bool> login() {
    final sql_provider = Provider.of<Sql_services>(context, listen: false);
    final result = sql_provider.checkUser(
        email: _emailController.text, password: _passwordController.text);

    result.then((value) {
      setState(() {
        if (value == true) {
          isUserAuth = status.correct;
        } else {
          isUserAuth = status.wrong;
        }
      });
    });

    return result;
  }

  // create function of signup
  Future<int> signup() {
    final sql_provider = Provider.of<Sql_services>(context, listen: false);

    // get current date for assigning id
    DateTime now = DateTime.now();
// convert "now" to int
    int id = int.parse(now.year.toString() +
        now.day.toString() +
        now.hour.toString() +
        now.minute.toString() +
        now.second.toString());

    Future<int> result = sql_provider.insertUser(User(
        id: id,
        email: _emailController.text,
        password: _passwordController.text));
    return result;
  }

//  get users
  Future<void> getusers() async {
    final sql_provider = Provider.of<Sql_services>(context, listen: false);
    final result = await sql_provider.getusers();
    print(result);
    // return result;
  }
  // setState(() {

  Text getStatus() {
    switch (isUserAuth) {
      case status.notAuth:
        return Text(
          "",
          textAlign: TextAlign.end,
          style: TextStyle(color: const Color.fromARGB(255, 255, 0, 0)),
        );

      case status.correct:
        return Text(
          "correct",
          textAlign: TextAlign.end,
          style: TextStyle(color: Color.fromARGB(255, 25, 136, 0)),
        );
      case status.wrong:
        return Text(
          "Please enter correct email and password",
          textAlign: TextAlign.end,
          style: TextStyle(color: const Color.fromARGB(255, 255, 0, 0)),
        );
      default:
        return Text(
          "",
          textAlign: TextAlign.end,
          style: TextStyle(color: const Color.fromARGB(255, 255, 0, 0)),
        );
    }
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
                            color: _isLogin
                                ? Color(0xffED5AB3)
                                : Color(0xffFF90C2),
                            fontFamily: "Roboto",
                            fontSize: 30,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    Container(
                      color: Color(0xffED5AB3),
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
                            color: _isLogin
                                ? Color(0xffFF90C2)
                                : Color(0xffED5AB3),
                            fontFamily: "Roboto",
                            fontSize: 30,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    Container(
                      color: Color(0xffED5AB3),
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
                //   onSubmitted: (value) {

                // },
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
              Align(
                alignment: Alignment.center,
                child: getStatus(),
              )
            ],
          ),

          // FilledButton(onPressed: null, child: const Text('Filled')),
          SizedBox(
            height: 60,
            width: 230,
            child: TextButton(
              child: Text(
                  _isLogin ? "Login".toUpperCase() : "Sign Up".toUpperCase(),
                  style: TextStyle(fontSize: 21)),
              style: ButtonStyle(
                  padding: MaterialStateProperty.all<EdgeInsets>(
                      EdgeInsets.fromLTRB(15, 5, 15, 5)),
                  foregroundColor: MaterialStateProperty.all<Color>(
                      const Color.fromARGB(255, 255, 255, 255)),
                  backgroundColor: MaterialStateProperty.all<Color>(
                    Color(0xffED5AB3),
                  ),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(28.0),
                          side: BorderSide(
                            color: Color(0xffED5AB3),
                          )))),
              onPressed: () {
                // var temp = login();

                if (_isLogin == true) {
                  print("clicked ! login ");
                  login().then((value) {
                    if (value == true) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => newScreen(text: "sign in ")),
                      );
                    }
                  });
                } else {
                  print("clicked ! signup ");
                  signup().then((value) {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) =>   newScreen(text:  "sign Up")),
                    // );
                  });
                }
              },
            ),
          ),
          const Text('or login with', textAlign: TextAlign.right),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  print("clicked!");
                  inserOne();
                },
                child: RoundIconButtonWithLittleShow(
                  img: "assets/social/face.png",
                ),
              ),
              SizedBox(width: 20),
              GestureDetector(
                onTap: () {
                  print(" getusers clicked!");
                  getusers();
                },
                child: RoundIconButtonWithLittleShow(
                  img: "assets/social/insta.png",
                ),
              ),
              SizedBox(width: 20),
              RoundIconButtonWithLittleShow(
                img: "assets/social/x.png",
              )
            ],
          ),
          // const Text('dont have an account? '),
        ]));
  }
}

class RoundIconButtonWithLittleShow extends StatelessWidget {
  // final IconData icon;
  // final GestureTapCallback onPressed;
  final String img;

  const RoundIconButtonWithLittleShow({
    Key? key,
    // required this.onPressed,
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
        child: Image.asset(
          img,
          height: 30,
        ));
  }
}

class newScreen extends StatelessWidget {
  final String text;
  newScreen({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xffED5AB3),
          title: Title(
              color: Color.fromARGB(255, 255, 255, 255), child: Text("home")),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "you have $text in successfully  🤩 !",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xffED5AB3),
                ),
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
