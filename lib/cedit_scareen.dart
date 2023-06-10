import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'controller.dart';

class Crdit_Screen extends StatefulWidget {

  String a_name="";//gt teh name from privous pag
  Crdit_Screen(this.a_name);

  @override
  State<Crdit_Screen> createState() => _Crdit_ScreenState();
}

class _Crdit_ScreenState extends State<Crdit_Screen> {
  TextEditingController add_tra=TextEditingController();
  TextEditingController add_amt=TextEditingController();
  TextEditingController particular=TextEditingController();

  Myncontroller m = Get.put(Myncontroller());
  List<Map> account_name=[];
  String type="type";




  //***showdilogbox***//

  _showDialog( context) {

    // flutter defined function
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Card(
              child: Container(height: 50,alignment: Alignment.center,
                color: Colors.deepPurpleAccent,
                child: Text("Add Transation",textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),),
              ),
            ),
            content: TextField(
              controller: add_tra,
              decoration: InputDecoration(labelText: "Transation Date"),
              onTap:() {
                add_tra.text=DateTime.now().toString();
                m.age_selcted(context);
                //add_tra.text='${m.selectedDate.toString()}'.split("");
                add_tra.text=m.selectedDate.toString();
                print(add_tra.text);
              },
            ),
            actions: [Column(children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(flex: 2,child: Container(child: Text("Transation Type"),)),
                Spacer(),
                Obx(() => Radio(value: "credit", groupValue: m.trn_type.value, onChanged: (value) {
                  m.trn_type(value);
                },)),Text("Credit(-)"),

                Obx(() => Radio(value: "debit", groupValue: m.trn_type.value, onChanged: (value) {
                  m.trn_type(value);
                },)),Text("Debit(-)"),
              ],
              ),
              TextField(controller: add_amt,decoration: InputDecoration(label: Text("Amount")),onTap: () {
                String amt=add_amt.text;
                print(amt);
                m.add_amt(amt);
                m.select_amt();

              },),
              TextField(controller: particular,decoration: InputDecoration(label: Text("Particular")),onTap: () {
                String par=particular.text;
                m.add_par(par);
                m.select_par();

              },),

              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,children: [

                TextButton(onPressed: () {
                  Navigator.pop(context);

                }, child: Text("Cancel")),
                TextButton(onPressed: () {
                  m.date_list();
                  m.amt_list();
                  m.trn_type();
                  m.par_list();


                  Navigator.pop(context);
                }, child: Text("Add"))
              ],)

            ],)

            ],
          );
        },
      );

    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    m.get_database();
    m.getdata_database();
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //******************************************//
      appBar: AppBar(title: Text("${widget.a_name}"),backgroundColor: Colors.deepPurpleAccent,actions: [
        Wrap(children: [
          IconButton(onPressed: () {
            return
            _showDialog(context);

          }, icon: Icon(Icons.note_add)),
          IconButton(onPressed: () {

          }, icon: Icon(Icons.search)),
          PopupMenuButton(itemBuilder: (context) => [
            PopupMenuItem(value: "pdf",child: Text("Save as PDF"),onTap: () {

            },),
            PopupMenuItem(value: "pdf",child: Text("Save as Excel"),onTap: () {

            },)
          ],)
        ],)
      ],),
      //********************************************//
      body: Column(children: [
        Container(color: Colors.grey,height: 30,
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,children: [
            Container(child: Text("Date",textAlign: TextAlign.center,),),
            Container(child: Text("Particular",textAlign: TextAlign.center,),),
            Container(child: Text("Credit(+)",textAlign: TextAlign.center,),),
            Container(child: Text("Debit(-)",textAlign: TextAlign.center,),),
          ],),
        )
      ]),
  //***********************************************//


    );
  }
}
