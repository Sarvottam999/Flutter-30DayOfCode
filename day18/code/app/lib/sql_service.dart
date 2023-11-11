import 'dart:async';
import 'package:day1/db_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/widgets.dart';
 
class Sql_services  extends ChangeNotifier{
    late final  database;

 

  // ----------------------------------------------
  void openDBConnection() async {
   try {
      database = await openDatabase(
      join(await getDatabasesPath(), 'people_databases.db'),
      onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE users(id INTEGER PRIMARY KEY, email TEXT, password TEXT)",
        );
      },
      version: 1,
    );
print("--------------->   created   --------- " + database.toString());
    
    
    }
    catch(e){
      print("########### openDBConnection ###################    ${e}");
    }
  }

 

 




  // ---------------------- A method that retrieves all the person from the person table. ------------------------
  Future<List<User>> getusers() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('users');
    return List.generate(maps.length, (i) {
      return User(
        id: maps[i]['id'],
        email: maps[i]['email'],
        password: maps[i]['password'],
      );
    });
  }

  // ----------------------Insert a person into the database ------------------------
  Future<int > insertUser(User user) async {

    try {
      final Database db = await database;
      int id =  await db.insert(
        'users',
        user.toMap(),
        // conflictAlgorithm: ConflictAlgorithm.replace,
      );
print("--------------->   inserted ${id}");


      return id;

    } catch (e) {
      print("############## insertUser ################    ${e}");
      return 0 ;
 
  }
  }

  // check if user exist
  Future<bool> checkUser({ required  String email,required String password}) async {

    try {
       final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('users');
    bool isUser = false;
    for (var user in maps) {
      print(user['email'] + "-" + email + "============"  + "-" + password +  user['password']);
      if (user['email'] == email && user['password'] == password) {
        isUser = true;
print("--------------->   checkUser ${isUser}");

        break;
      }
     
    }
    return isUser;
      
    } catch (e) {
      print("################ checkUser ##############    ${e}");

      return false;

      
    }
   
  }
  }

 