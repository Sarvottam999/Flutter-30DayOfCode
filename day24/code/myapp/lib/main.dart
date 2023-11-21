import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:myapp/checkUser.dart';
import 'package:myapp/loginScreen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
 
  await Firebase.initializeApp( );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
      
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: CheckUser(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title}); 

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  


  logout()async{
    FirebaseAuth.instance.signOut().then((value){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>   LoginScreen ()));
    }
    );

  }

  @override
  Widget build(BuildContext context) { 
    return Scaffold(
      appBar: AppBar( 
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center( 
        child: Column( 
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("home" , style: TextStyle(fontSize: 70, fontWeight: FontWeight.bold),)
           
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: logout,
        tooltip: 'Increment',
        child: const Icon(Icons.logout),
      ),  
       );
  }
}
