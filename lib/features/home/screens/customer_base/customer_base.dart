import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solar/core/helper/extensions.dart';
import 'package:solar/core/widgets/delete_box.dart';
import 'package:solar/features/home/screens/customer_base/widgets/customer_item.dart';
import 'package:solar/features/home/screens/customer_screen/logic/cubit/customer_cubit.dart';
import 'package:solar/features/home/screens/customer_screen/logic/cubit/customer_state.dart';
import 'package:solar/generated/l10n.dart';

class CustomerBaseScreen extends StatelessWidget {
  const CustomerBaseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          S.current.customers_data,
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
                child: BlocConsumer<CustomerCubit, CustomerState>(
              listener: (context, state) {
                // if (state is GetCustomerDataLoadingState) {
                //   loadingDialog(context);
                // }
              },
              builder: (context, state) {
                var cubit = CustomerCubit.get(context);
                if (cubit.customersList.isNullOrEmpty()) {
                  cubit.getCustomerData();
                  return Center(child: Text(S.current.no_data_yet));
                } else {
                  return ListView.builder(
                    itemCount: cubit.customersList.length,
                    itemBuilder: (context, index) {
                      // cubit.customersList.sort((a, b) =>
                      //     DateTime.parse(a['offer_expiry_date']).compareTo(
                      //         DateTime.parse(b['offer_expiry_date'])));
                      return GestureDetector(
                        onLongPress: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return Center(
                                  child: DeleteBox(deleteFunc: () {
                                    cubit.delete(
                                        cubit.customersList[index]['id']);
                                  }),
                                );
                              });
                        },
                        child: CustomerItem(
                          data: cubit.customersList[index],
                        ),
                      );
                    },
                  );
                }
              },
            ))
          ],
        ),
      ),
    );
  }
}
