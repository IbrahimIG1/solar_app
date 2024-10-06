import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solar/core/di/di.dart';
import 'package:solar/core/helper/extensions.dart';
import 'package:solar/core/theming/font_styles.dart';
import 'package:solar/core/widgets/dialogs/dialogs_status.dart';
import 'package:solar/features/home/screens/price_offers/logic/cubit/price_offers_cubit.dart';
import 'package:solar/features/home/screens/price_offers/logic/cubit/price_offers_state.dart';
import 'package:solar/features/price_issud_screens/price_offers/widget/pdf_card.dart';

class PriceOffersIssuedScreen extends StatelessWidget {
  const PriceOffersIssuedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("All Pdf"),
      ),
      body: SafeArea(
          child: BlocProvider(
        create: (context) =>
            LightingCategoriesCalculationCubit(getIt(), getIt())..getAllPdf(),
        child: BlocConsumer<LightingCategoriesCalculationCubit,
            LightingCategoriesCalculationState>(listener: (context, state) {
          if (state is DeletePdfSuccess) {
            doneDialog(context);
          }
        }, builder: (context, snapshot) {
          var cubit = LightingCategoriesCalculationCubit.get(context);
          if (cubit.pdfFiles.isNullOrEmpty()) {
            return Center(
              child: Text("No Pdf Extracted Yet!",
                  style: TextStyles.font16GreyMeduim),
            );
          } else {
            return Container(
              padding: EdgeInsets.only(top: 15.h),
              width: 1.sw,
              child: ListView.builder(
                itemCount: cubit.pdfFiles.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onLongPress: () {
                      deleteDialog(context, () {
                        cubit.deletePdf(cubit.pdfFiles[index].path, context);
                      });
                    },
                    onTap: () {
                      cubit.openPdf(cubit.pdfFiles[index].path);
                    },
                    child: PdfCard(
                      pdfName: cubit.pdfFiles[index].path.split('/').last,
                    ),
                  );
                },
              ),
            );
          }
        }),
      )),
    );
  }
}
