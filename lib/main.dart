import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_api/model.dart';
import 'package:getx_api/mvc.dart';
void main() {
  runApp(GetMaterialApp(debugShowCheckedModeBanner: false, home: Home()));
}
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  State<Home> createState() => _HomeState();
}
class _HomeState extends State<Home> {
  class_ obj = class_();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    obj.get();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Products ",
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.teal,
        ),
        drawer: Drawer(child: Obx(() => ListView.builder(
          itemCount: obj.list_.length,
          itemBuilder: (context, index) {
            Products p = Products.fromJson(obj.list_[index]);
            return Card(
              color: Colors.deepOrangeAccent.shade700,
              margin: EdgeInsets.all(5),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage("${p.thumbnail}"),
                ),
                title: Text("${p.title}",style: TextStyle(color: Colors.black),),
                subtitle: Text("₹.${p.price}",style: TextStyle(color: Colors.black),),
                trailing: Text("ID:${p.id}",style: TextStyle(color: Colors.black),),
              ),
            );
          },
        )),),
        body: Obx(() => ListView.builder(
              itemCount: obj.list_.length,
              itemBuilder: (context, index) {
                Products p = Products.fromJson(obj.list_[index]);
                return Card(
                  color: Colors.lightGreen.shade900,
                  margin: EdgeInsets.all(5),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage("${p.thumbnail}"),
                    ),
                    title: Text("${p.title}",style: TextStyle(color: Colors.pink),),
                    subtitle: Text("₹.${p.price}",style: TextStyle(color: Colors.grey),),
                    trailing: Text("ID:${p.id}",style: TextStyle(color: Colors.black),),
                  ),
                );
              },
            ))
    );
  }
}
