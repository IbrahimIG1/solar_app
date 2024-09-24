import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  const ItemCard(
      {super.key,
      required this.index,
      required this.data,
      required this.onTap});
  final int index;
  final Function onTap;
  final List<Map<String, dynamic>> data;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Card(
        elevation: 5,
        shadowColor: Colors.black,
        shape: const RoundedRectangleBorder(
          side: BorderSide(color: Colors.black),
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        color: Colors.white,
        child: Container(
          padding: const EdgeInsets.all(50),
          child: Center(
            child: Image.asset(
              data[index]['icon'],
              //   width: data[index]['width'],
              //   height: data[index]['height'],
            ),
          ),
        ),
      ),
    );
  }
}
