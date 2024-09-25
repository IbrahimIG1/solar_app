import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solar/core/helper/extensions.dart';
import 'package:solar/core/helper/spacing.dart';
import 'package:solar/core/theming/font_styles.dart';
import 'package:solar/core/widgets/app_button.dart';
import 'package:solar/features/categories_details/widgets/text_and_text_field.dart';
import 'package:solar/features/home/screens/cusomer_screen/cubit/customer_cubit.dart';
import 'package:solar/features/home/screens/cusomer_screen/cubit/customer_state.dart';

class CustomerForm extends StatelessWidget {
  const CustomerForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CustomerCubit(),
      child: BlocConsumer<CustomerCubit, CustomerState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = CustomerCubit.get(context);
          GlobalKey<FormState> formKey = cubit.formKey;
          return Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextAndTextFeild(
                  lable: "Customer name",
                  controller: cubit.nameController,
                  // lableStyle: ,
                  validator: (value) {
                    if (value.isNullOrEmpty()) {
                      return "Please Enter Customer name";
                    }
                  },
                  hintText: "اسم العميل",
                  name: '',
                ),
                // verticalSpace(20),
                TextAndTextFeild(
                  lable: "Customer address",
                  controller: cubit.addressController,
                  validator: (value) {
                    if (value.isNullOrEmpty()) {
                      return "Please Enter Customer address";
                    }
                  },
                  hintText: "العنوان",
                  name: '',
                ),
                // verticalSpace(20),
                TextAndTextFeild(
                  lable: "Phone number",
                  controller: cubit.phoneController,
                  validator: (value) {
                    if (value.isNullOrEmpty()) {
                      return "Please Phone number";
                    }
                  },
                  hintText: "رقم التليفون",
                  name: '',
                ),
                // verticalSpace(10),
                TextAndTextFeild(
                  controller: cubit.stationController,
                  lable: "Station type",
                  validator: (value) {
                    if (value.isNullOrEmpty()) {
                      return "Please Station type";
                    }
                  },
                  hintText: "نوع المحطة",
                  name: '',
                ),
                TextAndTextFeild(
                  controller: cubit.offerExpireController,
                  lable: "Offer expiry date",
                  validator: (value) {
                    if (value.isNullOrEmpty()) {
                      return "Please Offer expiry date";
                    }
                  },
                  hintText: "تاريخ انتهاء العرض",
                  name: '',
                ),
                verticalSpace(20),
                AppTextButton(
                    textStyle: TextStyles.font25BlackRegular
                        .copyWith(color: Colors.white),
                    text: "حفظ",
                    onpressed: () {
                      if (formKey.currentState!.validate()) {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            content: Container(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                      "Name is : ${cubit.nameController.text}"),
                                  Text(
                                      "Address is : ${cubit.addressController.text}"),
                                  Text(
                                      "Phone is : ${cubit.phoneController.text}"),
                                  Text(
                                      "Station is : ${cubit.stationController.text}"),
                                  Text(
                                      "Offer Expire is : ${cubit.offerExpireController.text}"),
                                ],
                              ),
                            ),
                          ),
                        );

                        print('save');
                        return;
                      }
                    })
              ],
            ),
          );
        },
      ),
    );
  }
}
