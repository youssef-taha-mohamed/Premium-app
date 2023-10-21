import 'package:e_premier_new/constant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/myprovider.dart';

class ItemDetails extends StatelessWidget {
  const ItemDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<MyProvider>(builder: (ctx,value,child){
      return Scaffold(
        appBar: AppBar(
          backgroundColor: primaryColor,
          title:  Text(value.premiumModel.name),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Text(value.premiumModel.item,style:const TextStyle(fontSize: 25),textDirection: TextDirection.rtl,),
              Text(value.premiumModel.address,style:const TextStyle(fontSize: 25),textDirection: TextDirection.rtl,),
              Text(value.premiumModel.totalItem.toString(),style:const TextStyle(fontSize: 25),textDirection: TextDirection.rtl,),
            ],
          ),
        ),
      );
    });
  }
}
