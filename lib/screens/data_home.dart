import '../constant.dart';
import '../models/myprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/premium.dart';

class DataEnter extends StatelessWidget {
  DataEnter({super.key});


  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController idController = TextEditingController();
  TextEditingController itemController = TextEditingController();
  TextEditingController totalController = TextEditingController();
  TextEditingController monthlyController = TextEditingController();
  TextEditingController periodController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    Provider.of<MyProvider>(context).retreivedata();
    Provider.of<MyProvider>(context).stateFun();
    return Scaffold(
        appBar: AppBar(
          backgroundColor: primaryColor,
          title: const Text("أضافة عميل"),
        ),
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        buildTextFormField(nameController, TextInputType.text,
                            40, "أسم العميل", "يجب أدخال أسم العميل"),
                        buildTextFormField(addressController, TextInputType.text,
                            30, "عنوان العميل", "يجب أدخال عنوان العميل"),
                        buildTextFormField(phoneController, TextInputType.number,
                            11, "رقم التليفون", "يجب أدخال رقم التليفون"),
                        buildTextFormField(idController, TextInputType.number,
                            14, "الرقم القومي", "يجب أدخال الرقم القومي"),
                        buildTextFormField(itemController, TextInputType.text,
                            20, "السلعة", "يجب أدخال نوع السلعة"),
                        buildTextFormField(totalController, TextInputType.number,
                            5, "أجمالي الدين", "يجب أدخال المبلغ"),
                        buildTextFormField(monthlyController, TextInputType.number,
                            4, "القسط الشهري", "يجب أدخال القسط الشهري"),
                        buildTextFormField(periodController, TextInputType.number,
                            1, "مدة السداد", "يجب أدخال المدة"),
                        Consumer<MyProvider>(builder: (ctx, value,child){
                          return ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  minimumSize: Size(MediaQuery.of(context).size.width*1, MediaQuery.of(context).size.height*0.1),
                                  backgroundColor: primaryColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  )
                              ),
                              onPressed: () async {
                                value.premiumModel = Premium(
                                  name: nameController.text,
                                  address: addressController.text,
                                  phone: int.parse(phoneController.text),
                                  idNumber: int.parse(idController.text),
                                  item: itemController.text,
                                  totalItem: int.parse(totalController.text),
                                  monthly: int.parse(monthlyController.text),
                                  period: int.parse(periodController.text),
                                );
                                value.premium.insert(value.premiumModel);
                                value.listText = await value.premium.retrieve();
                                value.notifyListeners();
                              },
                              child:const Text("حفظ العميل",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 22),)
                          );
                        }),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
    );
  }
}
