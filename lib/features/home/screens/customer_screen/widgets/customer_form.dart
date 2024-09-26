import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solar/core/helper/extensions.dart';
import 'package:solar/core/helper/spacing.dart';
import 'package:solar/features/home/screens/price_offers/screens/new_price_offers/screens/lighting_stations_categories/ui/screens/categories_details/widgets/dialog_done.dart';
import 'package:solar/features/home/screens/customer_screen/logic/cubit/customer_cubit.dart';
import 'package:solar/features/home/screens/customer_screen/logic/cubit/customer_state.dart';
import 'package:solar/features/home/screens/customer_screen/widgets/customer_form_button.dart';
import 'package:solar/features/home/screens/customer_screen/widgets/customer_text_field.dart';

class CustomerForm extends StatelessWidget {
  const CustomerForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CustomerCubit, CustomerState>(
      listener: (context, state) {
        if (state is AddCustomerDataSuccessState) {
          showDialog(
            context: context,
            builder: (context) {
              return const Center(child: DialogDone());
            },
          ).timeout(
            const Duration(milliseconds: 700),
            onTimeout: () => context.pop(),
          );
        }
        if (state is AddCustomerDataErrorState) {
          showDialog(
            context: context,
            builder: (context) {
              return const Center(
                child: DialogDone(
                  color: Colors.red,
                  icon: Icons.error_outline,
                ),
              );
            },
          );
        }
      },
      builder: (context, state) {
        var cubit = CustomerCubit.get(context);
        GlobalKey<FormState> formKey = cubit.formKey;
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomerTextField(
                  lable: "Customer name",
                  controller: cubit.nameController,
                  validator: (value) {
                    if (value.isNullOrEmpty()) {
                      return "Please Enter Customer name";
                    }
                  },
                  hintText: "اسم العميل",
                ),
                CustomerTextField(
                  lable: "Customer address",
                  controller: cubit.addressController,
                  validator: (value) {
                    if (value.isNullOrEmpty()) {
                      return "Please Enter Customer address";
                    }
                  },
                  hintText: "العنوان",
                ),
                CustomerTextField(
                  lable: "Phone number",
                  keyboardType: TextInputType.phone,
                  controller: cubit.phoneController,
                  validator: (value) {
                    if (value.isNullOrEmpty()) {
                      return "Please Phone number";
                    }
                  },
                  hintText: "رقم التليفون",
                ),
                CustomerTextField(
                  controller: cubit.stationController,
                  lable: "Station type",
                  validator: (value) {
                    if (value.isNullOrEmpty()) {
                      return "Please Station type";
                    }
                  },
                  hintText: "نوع المحطة",
                ),
                CustomerTextField(
                  readOnly: true,
                  controller: cubit.offerExpireController,
                  lable: "Offer expiry date",
                  suffixIcon: IconButton(
                    onPressed: () {
                      cubit.pickeDateOfferExpire(context);
                    },
                    icon: Icon(
                      Icons.date_range,
                      size: 25.w,
                    ),
                  ),
                  validator: (value) {
                    if (value.isNullOrEmpty()) {
                      return "Please Offer expiry date";
                    }
                  },
                  hintText: "تاريخ انتهاء العرض",
                ),
                verticalSpace(20),
                CustomerFormButton(
                  addCustomer: () {
                    cubit.addCustomer();
                  },
                  formKey: formKey,
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
