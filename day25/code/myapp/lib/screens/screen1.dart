import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myapp/screens/addContact.dart';
import 'package:myapp/screens/assets.dart';

class Screen1 extends StatefulWidget {
  const Screen1({super.key});

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {

  late final auth;
  late final databaseaReference ;

  @override
  void initState() {
     auth = FirebaseAuth.instance;
     databaseaReference = FirebaseDatabase.instance.ref("users");
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 100,
          centerTitle: true,
          backgroundColor: Assets.darkPink,
          title: SvgPicture.asset(Assets.people),
     
        ),

          floatingActionButton:  FloatingActionButton.extended(
            backgroundColor: Colors.white,
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) =>   AddContact ()));
                    // Add your onPressed code here!
                  },
                  label: const Text('ADD', style: TextStyle(
                                  fontSize: 21,
                                  fontWeight: FontWeight.bold,
                                  color: Assets.darkPink
                                ),),
                  icon: const Icon(Icons.add, color: Assets.darkPink, size: 30,),
                ),
 
        body:
 
   

      StreamBuilder(
        stream: databaseaReference.onValue,
        builder: (context, AsyncSnapshot<DatabaseEvent> snapshot) {
        if (snapshot.hasData == true  && snapshot.data!.snapshot.value != null ) {

                    Map<dynamic, dynamic>  map = snapshot.data!.snapshot.value  as dynamic;
                        List<dynamic> list = map.values.toList();
                        
                  return  ListView.builder(

                    itemCount: snapshot.data!.snapshot.children.length,
                    itemBuilder: (BuildContext context, int index) {
                      

                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                        color: Assets.darkPink

                        ),
                        padding: EdgeInsets.only(left: 0, right: 10),

                        margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                        height: 90.0,
                        child: 
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              height: 60,
                              width: 90,
                              decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(6),

                              ) ,
                              child: Icon(Icons.person, color: const Color.fromARGB(255, 175, 175, 175), size: 40,)
                            ),
                            Flexible(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                              Flexible(
                                child: Text( list[index]["name"].toString() , style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white
                                ),),
                              ),
                                                      
                              Text(list[index]["phone"].toString(), 
                              style: TextStyle(
                                // fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.white
                              )),
                            
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                           
                              Icon(Icons.call, color: Color.fromARGB(255, 255, 255, 255),)
                          
                          ],
                        )
                      );
                    },
                  );

   }

                else {
                  return Container();
                }


        
       
        }
      ),
    // ])
    );
  }
}
