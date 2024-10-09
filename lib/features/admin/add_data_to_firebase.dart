import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solar/core/di/di.dart';
import 'package:solar/core/helper/extensions.dart';
import 'package:solar/core/helper/spacing.dart';
import 'package:solar/core/models/inverter_model/inverter_data_model.dart';
import 'package:solar/core/models/inverter_model/inverter_model.dart';
import 'package:solar/core/models/panal_model/panal_data_model.dart';
import 'package:solar/core/models/panal_model/panal_model.dart';
import 'package:solar/core/widgets/app_button.dart';
import 'package:solar/core/widgets/app_drop_down_button.dart';
import 'package:solar/core/widgets/app_text_feild.dart';
import 'package:solar/features/admin/cubit/admin_cubit.dart';
import 'package:solar/features/admin/cubit/admin_state.dart';

//* Define an enum for better readability and control over the options
enum DeviceType { panel, inverter }

class AddDataToFirebase extends StatelessWidget {
  const AddDataToFirebase({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AdminCubit(getIt()),
      child: BlocConsumer<AdminCubit, AdminState>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = AdminCubit.get(context);
            bool isPanal =
                cubit.selectedDevice == DeviceType.panel ? true : false;

            return Scaffold(
              body: SafeArea(
                  child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Form(
                    key: cubit.formKey,
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Radio button for "Panel"
                          Row(
                            children: [
                              Expanded(
                                child: ListTile(
                                  title: Text("Panel"),
                                  leading: Radio<DeviceType>(
                                    value: DeviceType.panel,
                                    groupValue: cubit.selectedDevice,
                                    onChanged: (DeviceType? value) {
                                      cubit.changeRadioButtonValue(value);
                                    },
                                  ),
                                ),
                              ),
                              Expanded(
                                child: ListTile(
                                  title: Text("Inverter"),
                                  leading: Radio<DeviceType>(
                                    value: DeviceType.inverter,
                                    groupValue: cubit.selectedDevice,
                                    onChanged: (DeviceType? value) {
                                      cubit.changeRadioButtonValue(value);
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                          verticalSpace(20),

                          AppDropDownButton(
                              data: isPanal
                                  ? cubit.panalTypeList
                                  : cubit.inverterTypeList,
                              onSelecte: (value) {
                                cubit.panalTypeDropdownValue = value;
                                cubit.getPanalsData();
                              }),
                          verticalSpace(10),
                          AppTextFormFeild(
                            focusNode: FocusNode(),
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.number,
                            controller: cubit.pmaxController,
                            hintText:
                                isPanal ? "Enter pmax" : "Enter Modle Inverter",
                            validator: (value) {
                              if (value!.isNullOrEmpty()) {
                                return isPanal
                                    ? "Enter pmax"
                                    : "Enter Modle Inverter";
                              }
                            },
                          ),
                          verticalSpace(10),
                          AppTextFormFeild(
                            keyboardType: TextInputType.number,
                            focusNode: FocusNode(),
                            textInputAction: TextInputAction.next,
                            controller: cubit.vocController,
                            hintText: isPanal
                                ? "Enter Voc"
                                : "Enter Maximum Input DC Voltage",
                            validator: (value) {
                              if (value!.isNullOrEmpty()) {
                                return "Enter Panal Voc";
                              }
                            },
                          ),
                          verticalSpace(10),

                          AppTextFormFeild(
                            keyboardType: TextInputType.number,
                            focusNode: FocusNode(),
                            textInputAction: TextInputAction.next,
                            controller: cubit.iscController,
                            hintText:
                                isPanal ? "Enter Isc" : "Enter IN PUT 1 DC",
                            validator: (value) {
                              if (value!.isNullOrEmpty()) {
                                return "Enter Panal Isc";
                              }
                            },
                          ),
                          verticalSpace(10),
                          AppTextFormFeild(
                            keyboardType: TextInputType.number,
                            focusNode: FocusNode(),
                            textInputAction: TextInputAction.next,
                            controller: cubit.vmpController,
                            hintText:
                                isPanal ? "Enter Vmp" : "Enter InPut 2 DC",
                            validator: (value) {
                              if (value!.isNullOrEmpty()) {
                                return "Enter Panal Vmp";
                              }
                            },
                          ),

                          verticalSpace(10),
                          AppTextFormFeild(
                            keyboardType: TextInputType.number,
                            focusNode: FocusNode(),
                            textInputAction: TextInputAction.done,
                            controller: cubit.impController,
                            hintText: isPanal
                                ? "Enter Imp"
                                : "Enter Rated Output Current",
                            validator: (value) {
                              if (value!.isNullOrEmpty()) {
                                return "Enter Panal Imp";
                              }
                            },
                          ),
                          verticalSpace(10),
                          if (state is AddDataLoading)
                            const Center(
                              child: LinearProgressIndicator(),
                            ),
                          Center(
                            child: AppTextButton(
                              text: "Add Data",
                              backgroundColor:
                                  cubit.panalTypeDropdownValue.isNullOrEmpty()
                                      ? Colors.grey
                                      : Colors.green,
                              onpressed:
                                  cubit.panalTypeDropdownValue.isNullOrEmpty()
                                      ? () {}
                                      : () async {
                                          if (cubit.formKey.currentState!
                                              .validate()) {
                                            isPanal
                                                ? await cubit.addPanalsData(
                                                    panalModel: PanalModel(
                                                        cubit
                                                            .panalTypeDropdownValue,
                                                        PanalDataModel(
                                                          pmax: cubit.pmax,
                                                          imp: cubit.imp,
                                                          isc: cubit.isc,
                                                          vmp: cubit.vmp,
                                                          voc: cubit.voc,
                                                        )))
                                                : await cubit.addInvertersData(
                                                    invetrerModel: InverterModel(
                                                        cubit.panalTypeDropdownValue,
                                                        InverterDataModel(
                                                          input1DC:
                                                              cubit.input1DC,
                                                          input2DC:
                                                              cubit.input2DC,
                                                          maxInputDC:
                                                              cubit.maxInputDC,
                                                          modelInverter: cubit
                                                              .modelInverter,
                                                          ratedOutputCurrent: cubit
                                                              .ratedOutputCurrent,
                                                        )));
                                          }
                                        },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )),
            );
          }),
    );
  }
}
