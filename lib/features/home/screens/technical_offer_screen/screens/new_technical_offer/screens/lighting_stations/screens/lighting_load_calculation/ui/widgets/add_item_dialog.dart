import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solar/core/helper/extensions.dart';
import 'package:solar/core/helper/spacing.dart';
import 'package:solar/generated/l10n.dart';

class AddLightingItemDialog extends StatelessWidget {
  const AddLightingItemDialog({
    super.key,
    required this.nameController,
    required this.addImage,
    required this.saveData,
  });
  final TextEditingController nameController;
  final Function addImage;
  final Function saveData;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(S.current.add_item),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: nameController,
            decoration: InputDecoration(
                isDense: false,
                border: const OutlineInputBorder(),
                hintText: S.current.enter_item_name),
          ),
          verticalSpace(10.h),
          ElevatedButton(
            child: Text(S.current.add_image),
            onPressed: () {
              addImage();
            },
          ),
        ],
      ),
      actions: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              child: Text(S.current.save),
              onPressed: () {
                saveData();
                context.pop();
              },
            ),
            ElevatedButton(
              child: Text(S.current.cancle),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ],
    );
  }
}
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:solar/core/helper/extensions.dart';
// import 'package:solar/core/helper/spacing.dart';
// import 'package:solar/generated/l10n.dart';

// appShowBottomSheet(BuildContext context) => showBottomSheet(
//     context: context,
//     sheetAnimationStyle: AnimationStyle(
//       duration: const Duration(seconds: 3),
//       reverseDuration: const Duration(seconds: 1),
//     ),
//     builder: (BuildContext context) {
//       return SizedBox(
//         height: .35.sh,
//         width: 1.sw,
//         child: Center(
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Container(
//                 decoration: BoxDecoration(
//                   color: Colors.red,
//                     shape: BoxShape.circle,
//                     image: DecorationImage(image: AssetImage(''))),
//               ),
//               TextField(
//                 // controller: nameController,
//                 decoration: InputDecoration(
//                     isDense: false,
//                     border: const OutlineInputBorder(),
//                     hintText: S.current.enter_item_name),
//               ),
//               verticalSpace(10.h),
//               ElevatedButton(
//                 child: Text(S.current.add_image),
//                 onPressed: () {
//                   // addImage();
//                 },
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: [
//                   ElevatedButton(
//                     child: Text(S.current.save),
//                     onPressed: () {
//                       // saveData();
//                       context.pop();
//                     },
//                   ),
//                   ElevatedButton(
//                     child: Text(S.current.cancle),
//                     onPressed: () {
//                       Navigator.pop(context);
//                     },
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       );
//     });
