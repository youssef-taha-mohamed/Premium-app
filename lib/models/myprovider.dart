
import 'package:e_premier_new/models/premium.dart';
import 'package:flutter/cupertino.dart';

import '../db/premium_reposetory.dart';

class MyProvider extends ChangeNotifier{
  late Premium premiumModel = Premium(name: "", address: "", phone: 0, idNumber: 0, item: "", totalItem: 0, monthly: 0, period: 0);
  List<Premium>? listText= [];
  late PremiumRepository premium = PremiumRepository();

  void stateFun() {
    retreivedata();
    //notifyListeners();
  }
  void retreivedata() async {
    listText = await premium.retrieve();
    notifyListeners();
  }
  void del(int id) async {
    listText = await premium.deleted(id);
    notifyListeners();
  }

  void getZikrById(int id) async{
    List<Premium> premiumList = await premium.retrieveById(id);
    premiumModel= premiumList[0];
    notifyListeners();
  }
}