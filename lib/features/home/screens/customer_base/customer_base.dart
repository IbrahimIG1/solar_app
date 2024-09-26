import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solar/core/helper/extensions.dart';
import 'package:solar/core/widgets/delete_box.dart';
import 'package:solar/features/home/screens/customer_base/widgets/customer_item.dart';
import 'package:solar/features/home/screens/customer_screen/logic/cubit/customer_cubit.dart';
import 'package:solar/features/home/screens/customer_screen/logic/cubit/customer_state.dart';

class CustomerBaseScreen extends StatelessWidget {
  const CustomerBaseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Customer Data',
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
                child: BlocConsumer<CustomerCubit, CustomerState>(
              listener: (context, state) {
                // if (state is GetCustomerDataLoadingState) {
                //   showDialog(
                //     context: context,
                //     builder: (context) {
                //       return Container(
                //         color: Colors.white,
                //         child: Center(
                //           child: CircularProgressIndicator(
                //             color: Colors.blue,
                //           ),
                //         ),
                //       );
                //     },
                //   );
                // }
              },
              builder: (context, state) {
                var cubit = CustomerCubit.get(context);
                if (cubit.customersList.isNullOrEmpty()) {
                  cubit.getCustomerData();
                  return const Center(
                      child: Text("No Data Yet!, Please Add Data"));
                } else {
                  return ListView.builder(
                    itemCount: cubit.customersList.length,
                    itemBuilder: (context, index) {
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
