import 'package:e_premier_new/constant.dart';
import 'package:e_premier_new/screens/drawer.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../models/myprovider.dart';
import '../widget/dismisible.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerScreen(),
      appBar: AppBar(
        backgroundColor: primaryColor,
        title:const Text("الصفحة الرئيسية",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
      ),
      body: Provider.of<MyProvider>(context).listText == null
          ? const Center(
          child: Text('لا يوجد عملاء', style: TextStyle(fontSize: 22)))
          : Consumer<MyProvider>(
        builder: (ct, value, child) => ListView.separated(
          itemBuilder: (ctx, index) => Container(
            margin: const EdgeInsets.only(top: 15),
            height: MediaQuery.of(context).size.height * 0.13,
            child: buildDismissible(
              key: value.listText![index].id.toString(),
              context: context,
              delete: () {},
              edit: () {
                //context.push(details);
              },
              child: ListTile(
                onTap: () {
                  value.getZikrById(value.listText![index].id!);
                  context.push(details);
                },
                textColor: Colors.black,
                leading: Text(
                    value.listText![index].monthly.toString(),
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                  ),
                ),
                title: Text(
                  value.listText![index].name,
                  textDirection: TextDirection.rtl,
                  style: const TextStyle(
                    fontSize: 23,
                  ),
                ),
                subtitle: Text(
                  value.listText![index].item,
                  textDirection: TextDirection.rtl,
                  style: const TextStyle(
                    fontSize: 23,
                  ),
                ),
                trailing: Text(
                  value.listText![index].period.toString(),
                  textDirection: TextDirection.rtl,
                  style: const TextStyle(
                    fontSize: 23,
                  ),
                ),
              ),
            ),
          ),
          separatorBuilder: (ctx, i) => Padding(
            padding: const EdgeInsetsDirectional.only(end: 20.0),
            child: Container(
              width: MediaQuery.of(context).size.width,
              color: Colors.grey,
              height: 1.0,
            ),
          ),
          itemCount: value.listText!.length,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          context.push(data);
        },
        child:const Icon(Icons.add),
      ),
    );
  }
}
