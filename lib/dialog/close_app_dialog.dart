
import 'package:Tamrah/component/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import '../component/custom_text.dart';

Widget ColseAppDialog(BuildContext context) {
  return Dialog(
    alignment: Alignment.center,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10))),
    child: Padding(
      padding: const EdgeInsets.only(left: 8, right: 8, top: 16, bottom: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
      Container(
      alignment: AlignmentDirectional.center,
      height: 80,
      width: double.infinity,
      // Center is a layout widget. It takes a single child and positions it
      // in the middle of the parent.
      child: Image.asset(
        "assets/mainlogo.png",
        fit: BoxFit.cover,
      ),
      ),
         CustomText(
              color: AppColors.AppColor,
              fontFamily: 'f700',
              fontSize: 16,
              text: "الانهاء و الخروج من التطبيق",

          ),
          Padding(
            padding: EdgeInsets.only(top: 32),
            child: Row(children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: 8),
                    height: 45,
                    alignment: Alignment.center,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                        border: Border.all(
                            color: AppColors.AppColor, width: 1)),
                    child: CustomText(
                      color: AppColors.AppColor,
                      fontFamily: 'f700',
                      fontSize: 16,
                      text: "الغاء"
                    ),
                  ),
                ),
              ),      Padding(
  padding: EdgeInsets.only(right: 10)),
              Expanded(
                child:  GestureDetector(
                      onTap: () {
                        SystemNavigator.pop();
                      },
                      child: Container(
                        margin: EdgeInsets.only(right: 8),
                        height: 45,
                        alignment: Alignment.center,
                        width: double.infinity,
                        child: CustomText(
                          color: Colors.white,
                          fontFamily: 'f700',
                          fontSize: 16,
                          text: 'تاكيد',
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            color: AppColors.AppColor),
                      ),
                    )

                ),

            ]),
          )
        ],
      ),
    ),
  );
}
