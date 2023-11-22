import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:myapp/screens/assets.dart';

class AddContact extends StatefulWidget {
  const AddContact({super.key});

  @override
  State<AddContact> createState() => _AddContactState();
}

class _AddContactState extends State<AddContact> {

    bool isLoading = false;
final nameController = TextEditingController();
final phoneController = TextEditingController();
  final databaseaReference = FirebaseDatabase.instance.ref("users");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Assets.darkPink,
        title: Text("Add Contact", style: TextStyle(color: Colors.white),)
      ),

      // add contact form
      body:  Container(
        alignment: Alignment.center,
     
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
                controller: nameController,

              decoration: InputDecoration(
                hintText: "Name",
                labelText: "Name",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20,),
            TextFormField(
              controller: phoneController,
              decoration: InputDecoration(
                hintText: "Phone",
                labelText: "Phone",
                border: OutlineInputBorder(),
              ),
            ),
         
            SizedBox(height: 50,),
            SizedBox(
              height: 50,
              width: 200,
              child: ElevatedButton(
                style: ButtonStyle(
                   backgroundColor: MaterialStateProperty.all(Assets.darkPink),
                  foregroundColor: MaterialStateProperty.all(Colors.white),
                ),
                onPressed: (){
                  databaseaReference.child(DateTime.now().millisecondsSinceEpoch.toString()).set({
                    "name": nameController.text,
                    "phone": phoneController.text
                  }).then((value){
                    nameController.clear();
                    phoneController.clear();
                    // Navigator.pop(context);
                  });
                },
                child: Text("Add Contact", style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                
                ),),
              ),
            )
          ],
        ),
      ));
  }
}