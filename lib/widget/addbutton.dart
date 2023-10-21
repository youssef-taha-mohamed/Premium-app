// import 'package:e_premier_new/constant.dart';
// import 'package:e_premier_new/models/premium.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// // import '../models/cart_model.dart';
// //
// // import '../models/item.dart';
//
// class AddButton extends StatelessWidget {
//   const AddButton({super.key,
//     //required this.item
//   });
//
//   //final Item item;
//
//   @override
//   Widget build(BuildContext context) {
//     //var isInCart =
//     //context.select<CartModel, bool>((cart) => cart.items.contains(item));
//     return ElevatedButton(
//       style: ElevatedButton.styleFrom(
//         minimumSize: Size(MediaQuery.of(context).size.width*1, MediaQuery.of(context).size.height*0.1),
//         backgroundColor: primaryColor,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(20),
//         )
//       ),
//       onPressed: () async {
//         Navigator.of(context).pop();
//         value.zikrModel = Premium(
//           name: controllerText.text,
//           count: int.parse(controllerGoal.text),
//           clicked: 0,
//         );
//         value.zikr.insert(value.zikrModel);
//         value.listText = await value.zikr.retrieve();
//         value.notifyListeners();
//       },
//          // ? null
//          // : () {
//         //context.read<CartModel>().add(item);
//      // },
//       child:const Text("حفظ العميل",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 22),)
//         // isInCart
//         //   ? const Icon(Icons.check)
//         //   : const Text(
//         // "add",
//         // style: TextStyle(fontSize: 18),),
//     );
//   }
// }
