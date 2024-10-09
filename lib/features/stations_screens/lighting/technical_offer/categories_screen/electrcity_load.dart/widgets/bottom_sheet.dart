// import 'package:flutter/material.dart';



// enum AnimationStyles { defaultStyle, custom, none }

// const List<(AnimationStyles, String)> animationStyleSegments =
//     <(AnimationStyles, String)>[
//   (AnimationStyles.defaultStyle, 'Default'),
//   (AnimationStyles.custom, 'Custom'),
//   (AnimationStyles.none, 'None'),
// ];

// class AppBottomSheet extends StatefulWidget {
//   const AppBottomSheet({super.key});

//   @override
//   State<AppBottomSheet> createState() => _AppBottomSheetState();
// }

// class _AppBottomSheetState extends State<AppBottomSheet> {
//   Set<AnimationStyles> _animationStyleSelection = <AnimationStyles>{
//     AnimationStyles.defaultStyle
//   };
//   AnimationStyle? _animationStyle;

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[
//           SegmentedButton<AnimationStyles>(
//             selected: _animationStyleSelection,
//             onSelectionChanged: (Set<AnimationStyles> styles) {
//               setState(() {
//                 _animationStyle = switch (styles.first) {
//                   AnimationStyles.defaultStyle => null,
//                   AnimationStyles.custom => AnimationStyle(
//                       duration: const Duration(seconds: 3),
//                       reverseDuration: const Duration(seconds: 1),
//                     ),
//                   AnimationStyles.none => AnimationStyle.noAnimation,
//                 };
//                 _animationStyleSelection = styles;
//               });
//             },
//             segments: animationStyleSegments
//                 .map<ButtonSegment<AnimationStyles>>(
//                     ((AnimationStyles, String) shirt) {
//               return ButtonSegment<AnimationStyles>(
//                   value: shirt.$1, label: Text(shirt.$2));
//             }).toList(),
//           ),
//           const SizedBox(height: 10),
//           ElevatedButton(
//             child: const Text('showBottomSheet'),
//             onPressed: () {
              
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }
