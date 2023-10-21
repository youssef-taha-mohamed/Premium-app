import 'package:e_premier_new/constant.dart';
import 'package:e_premier_new/screens/data_home.dart';
import 'package:e_premier_new/screens/home_page.dart';
import 'package:e_premier_new/screens/item_details.dart';
import 'package:go_router/go_router.dart';

GoRouter router(){
  return GoRouter(
    initialLocation: home,
      routes: [
        GoRoute(path: home,builder:((ctx,index) => const Home())),
        GoRoute(path: data,builder: ((ctx,index) =>  DataEnter())),
        GoRoute(path: details,builder: ((ctx,index) => const ItemDetails())),
      ]

  );
}