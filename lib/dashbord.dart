
import 'package:account_manager_erp/cedit_scareen.dart';
import 'package:account_manager_erp/controller.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Deshbord extends StatefulWidget {
  const Deshbord({Key? key}) : super(key: key);

  @override
  State<Deshbord> createState() => _DeshbordState();
}

class _DeshbordState extends State<Deshbord> {
  Myncontroller m = Get.put(Myncontroller());
  TextEditingController t1 = TextEditingController();
  bool tamp = false;
  bool serch = false;
  List<Map> serch_list = [];
  int credit=0,debit=0,balance=0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    m.get_database();

    tamp=true;

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
                accountName: Center(child: Text("Account Name")),
                accountEmail: Center(
                  child: Container(
                    height: 200,
                    width: 200,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.deepPurple),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text("Credit(+)"),
                              Text("RS.${credit}"),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text("Debit(-)"),
                              Text("RS.${debit}"),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text("Blance"),
                              Text("RS.${balance}"),
                            ],
                          )
                        ]),
                  ),
                )),
            Expanded(
              child: Container(
                child: ListView(
                  children: [
                    ListTile(
                      title: Text("Home"),
                    ),
                    ListTile(
                      title: Text("Backup"),
                    ),
                    ListTile(
                      title: Text("Restore"),
                    ),
                    ListTile(
                      title: Text("Change Currancy"),
                    ),
                    ListTile(
                      title: Text("Change Passwrod"),
                    ),
                    ListTile(
                      title: Text("Chnage Security"),
                    ),
                    ListTile(
                      title: Text("Setting"),
                    ),
                    ListTile(
                      title: Text("Share App"),
                    ),
                    ListTile(
                      title: Text("Rate the App"),
                    ),
                    ListTile(
                      title: Text("More App"),
                    ),
                    ListTile(
                      title: Text("Add Free"),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      //************************************************//
      floatingActionButton: FloatingActionButton(backgroundColor:  Colors.deepPurpleAccent,
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Card(
                  child: Container(height: 50,alignment: Alignment.center,
                    color: Colors.deepPurpleAccent,
                    child: Text("Add Account",textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),),
                  ),
                ),
                content: TextField(
                  controller: t1,
                  decoration: InputDecoration(hintText: "Add Account Name"),
                ),
                actions: [
                  Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,children: [
                    TextButton(onPressed: () {
                      Navigator.pop(context);

                    }, child: Text("Cancel")),
                    TextButton(onPressed: () {

                      String add_name=t1.text;
                      m.add_data(add_name);
                      m.select_user();
                      Navigator.pop(context);
                      tamp=true;
                      t1.text="";

                    }, child: Text("Save"))
                  ],)
                ],
              );
            },
          );
        },
        child: Icon(Icons.add),
      ),

      //*********************************************//
      appBar: AppBar(title: (serch=false)?TextField(onChanged: (value) {

        //serch_list=m.name_list.!where((element) => (element.toString().contains(value))).toString();

      },autofocus: true,cursorColor: Colors.white,):Text("Deshbord"),backgroundColor: Colors.deepPurpleAccent,actions: [
        Wrap(children: [
          IconButton(onPressed: () {
                serch!=serch;
                setState(() {});

          }, icon: Icon(Icons.search))
        ],)
      ],),
      //********************************************//
      body: (tamp) ? Obx((){ return
        Card(
          child: ListView.builder(itemCount: m.name_list.length,itemBuilder: (context, index) {
            return Card(child: Container(height: 150,
              child: SingleChildScrollView(
                child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,children: [
                  Row(
                    children: [
                      Container(margin: EdgeInsets.only(left: 5),child: Text("${m.name_list[index]['name']}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),),
                      Spacer(),
                      IconButton(onPressed: () {

                      }, icon: Icon(Icons.edit)),
                      IconButton(onPressed: () {


                      }, icon: Icon(Icons.delete))
                    ],
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,children: [
                    Card(
                      child: InkWell(onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return Crdit_Screen(m.name_list[index]['name']);
                        },));
                      },child: Center(child: Container(height: 80,width: 100,child: Text("Credit(+)\n\nRS. ${credit}",textAlign: TextAlign.center,),padding: EdgeInsets.all(5),))),
                    ),
                    Card(
                      child: InkWell(onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return Crdit_Screen(m.name_list[index]['name']);
                        },));
                      },child: Center(child: Container(color: Colors.deepPurple[100],height: 80,width: 100,child: Text("Debit(-)\n\nRs.${credit}",textAlign: TextAlign.center,),padding: EdgeInsets.all(5),))),
                    ),
                    Card(
                      child: InkWell(onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return Crdit_Screen(m.name_list[index]['name']);
                        },));
                      },child: Center(child: Container(color: Colors.deepPurpleAccent,height: 80,width: 100,child: Text("Blance \n\n RS.${balance}",textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),padding: EdgeInsets.all(5),))),
                    )
                  ],)
                ],),
              )
            ),
            );
          },),
        );

      } ): null,
    );
  }
}

