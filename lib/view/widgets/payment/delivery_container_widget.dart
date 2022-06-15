import 'package:final_project_3/logic/controller/auth_controller.dart';
import 'package:final_project_3/logic/controller/payment_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../routes/routes.dart';
import '../../../utils/2.2 theme.dart';
import '../../../utils/my_string.dart';
import '../text_utils.dart';
class DeliveryContainerWidget extends StatefulWidget {
  const DeliveryContainerWidget({Key? key}) : super(key: key);
  @override
  State<DeliveryContainerWidget> createState() =>
      _DeliveryContainerWidgetState();
}
class _DeliveryContainerWidgetState extends State<DeliveryContainerWidget> {
  @override
  int radioContinerIndes = 1;
  bool changeColors = false;
  final TextEditingController phoneController = TextEditingController();
  final controller = Get.find<PayMentController>();
  final authController = Get.find<AuthController>();

  Widget build(BuildContext context) {
    return Column(
      children: [
        buildRadioContiner(
          icon: Container(),
          address: "Egypt,sohag medanelshoban el moslmean",
          name: "BeBo Shop",
          phone: "05544980933",
          title: "BeBo Shop",
          value: 1,
          color: changeColors ? white : Colors.grey.shade300,
          onChanged: (int? value) {
            setState(
              () {
                radioContinerIndes = value!;
                changeColors = !changeColors;
              },
            );
          },
        ),
        const SizedBox(height: 10),
        
        
        
        Obx(() => buildRadioContiner(
          address: controller.address.value,
          name: authController.displayUserName.value,
          phone:  controller.phoneNumber.value,
          title: "Delivery",
          value: 2,
          color: changeColors ? Colors.grey.shade300 : white,
          onChanged: (int? value) {
            setState(
                  () {
                radioContinerIndes = value!;
                changeColors = !changeColors;
              },
            );
            //this is the position or loction but where
            controller.updatePosition();
            print("****************************************");



          },
          icon: InkWell(
            child: Icon(
              Icons.contact_phone,
              color: Get.isDarkMode ? pinkClr : mainColor,
              size: 20,
            ),
            onTap: () {
              Get.defaultDialog(
                title: "Enter Your Phone Number",
                titleStyle: const TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                backgroundColor: white,
                radius: 10,
                textCancel: "Cancle",
                confirmTextColor: Colors.black,
                textConfirm: " Save ",
                cancelTextColor: Colors.black,
                onCancel: () {
                  Get.toNamed(Routes.paymentScreen);
                },
                onConfirm: () {
                  Get.back();
                  controller.phoneNumber.value = phoneController.text;
                },
                buttonColor: Get.isDarkMode ? pinkClr : mainColor,
                content: Padding(
                  padding: EdgeInsets.all(15),
                  child: TextField(

                    controller: phoneController,
                    onSubmitted: (value){
                      phoneController.text = value;
                    },
                    cursorColor: Colors.black,
                    keyboardType: TextInputType.phone,
                    maxLength: 11,
                    decoration: InputDecoration(
                      fillColor: Get.isDarkMode
                          ? pinkClr.withOpacity(0.1)
                          : mainColor.withOpacity(0.1),
                      focusColor: Colors.red,
                      prefixIcon: Icon(
                        Icons.phone,
                        color: Get.isDarkMode
                            ? pinkClr.withOpacity(0.5)
                            : mainColor.withOpacity(0.5),
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {
                          phoneController.clear();
                        },
                        icon: Icon(
                          Icons.cancel,
                          color: Get.isDarkMode
                              ? pinkClr.withOpacity(0.5)
                              : mainColor.withOpacity(0.5),
                        ),
                      ),
                      hintText: "Enter Your Phone Number",
                      hintStyle: const TextStyle(
                        color: Color.fromARGB(77, 0, 0, 0),
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: white),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: white),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: white),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: white),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        ),
      ],
    );
  }

  //TO DO
  Widget buildRadioContiner({
    required Color color,
    required int value,
    required Function onChanged,
    required String name,
    required String title,
    required String phone,
    required String address,
    required Widget icon,
  }) {
    return Container(
      height: 120,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: color,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 3,
              blurRadius: 5,
            ),
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Radio(
            value: value,
            groupValue: radioContinerIndes,
            onChanged: (int? value) {
              onChanged(value);
            },
            fillColor: MaterialStateColor.resolveWith((states) => Colors.red),
          ),
          const SizedBox(width: 10),
          Padding(
            padding: const EdgeInsets.only(
              top: 10,
            ),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              TextUtils(
                text: title,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                underline: TextDecoration.none,
              ),
              const SizedBox(width: 5),
              TextUtils(
                text: name,
                fontSize: 15,
                fontWeight: FontWeight.normal,
                color: Colors.black,
                underline: TextDecoration.none,
              ),
              const SizedBox(width: 5),
              Row(
                children: [
                  SizedBox(
                    width: 250,
                    child: Row(
                      children: [
                        Image.asset(
                          arabic,
                          width: 20,
                          height: 20,
                        ),
                        const Text(
                          '+02 ',
                          style: TextStyle(
                              color: Colors.black,)
                        ),
                        TextUtils(
                          text: phone,
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                          underline: TextDecoration.none,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    child: icon,
                  ),
                ],
              ),
              const SizedBox(width: 5),

              Text(
                address,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                  color: Colors.black,
                  overflow: TextOverflow.ellipsis
                ),
              ),







            ]),
          ),
        ],
      ),
    );
  }
}
