
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class Myncontroller extends GetxController{
  static Database? database;
  RxList name_list=[].obs;
  RxList date_list=[].obs;
  RxList amt_list=[].obs;
  RxList par_list=[].obs;

  DateTime ?selectedDate;
  RxString trn_type="".obs;

get_database() async {

  var databasesPath = await getDatabasesPath();
  String path = join(databasesPath, 'demo.db');

  Myncontroller.database = await openDatabase(path, version: 1,
      onCreate: (Database db, int version) async {
        // When creating the db, create the table
        await db.execute(
            'CREATE TABLE user (id INTEGER PRIMARY KEY, name TEXT)');
      });
  select_user();
}


  getdata_database() async {

    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'demo.db');

    Myncontroller.database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
          // When creating the db, create the table
          await db.execute(
              'CREATE TABLE dataentery (id INTEGER PRIMARY KEY,date TEXT,amount Text,particular TEXT)');
        });
    select_user();
  }

 add_data(String name){

  String sql="insert into user (name) VALUES ('$name')";
  Myncontroller.database!.rawInsert(sql);

  print(name);

 }
 select_user() async {
  String sql1="select* from user where id= ${['id']}";
  name_list.value= await  Myncontroller.database!.rawQuery(sql1);

 }
  Future<void> age_selcted(BuildContext context) async {
  selectedDate=DateTime.now();
    DateTime ?picked_date = await showDatePicker(context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1990),
        lastDate: DateTime(2030));
    if (picked_date != null && picked_date != selectedDate) {
      selectedDate = picked_date;
      print(selectedDate);
    }
  }
  add_date(String date){

    String sql="insert into user (date) VALUES ('$date')";
    Myncontroller.database!.rawInsert(sql);
    print(date);

  }
  select_date() async {
    String sql1="select* from dataentery where id= ${['id']}";
    date_list.value= await  Myncontroller.database!.rawQuery(sql1);
    print("Date:${date_list.value}");

  }
  select_type(String  type){
    trn_type.value=type;
  }


  add_amt(String amt){

    String sql="insert into dataentery (amount) VALUES ('$amt')";
    Myncontroller.database!.rawInsert(sql);

  }
  select_amt() async {
    String sql1="select* from dataentery where id= ${['id']}";
    amt_list.value= await  Myncontroller.database!.rawQuery(sql1);
    print("Amount:${amt_list.value}");

  }
  add_par(String par){

    String sql="insert into dataentery (particular) VALUES ('$par')";
    Myncontroller.database!.rawInsert(sql);
    print(par);
  }
  select_par() async {
    String sql1="select* from dataentery where id= ${['id']}";
    par_list.value= await  Myncontroller.database!.rawQuery(sql1);
    print("particuler:${par_list.value}");

  }



}