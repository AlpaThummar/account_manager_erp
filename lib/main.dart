import 'package:account_manager_erp/controller.dart';
import 'package:account_manager_erp/dashbord.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screen_lock/flutter_screen_lock.dart';
import 'package:get/get.dart';

void main(){
  
  runApp(GetMaterialApp(home: erp(),debugShowCheckedModeBanner: false,),);
}
class erp extends StatefulWidget {
  const erp({Key? key}) : super(key: key);

  @override
  State<erp> createState() => _erpState();
}

class _erpState extends State<erp> {

  bool setpass=false;
  bool curreny=false;

  _showDialog( context) {

    // flutter defined function
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          // return object of type Dialog
          return AlertDialog(
            title: new Text("Alert Dialog title"),
            content: new Text("Alert Dialog body"),
            actions: [
              TextButton(onPressed: () {

                  Navigator.push(context, MaterialPageRoute(builder: (context) => erp(),));

              }, child: Text("Set"))
            ],

          );
        },
      );

    });
     }

  //*************//
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:
      (setpass==false)?Container(child: ScreenLock(correctString: "1234", onUnlocked: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          print("Hello");
          return Deshbord();
        },));
      },),):_showDialog(context),

    );
  }
}
