import 'package:flutter/material.dart';
import 'package:solar/features/home/screens/customer_screen/widgets/customer_form.dart';

class CustomerFormScreen extends StatelessWidget {
  const CustomerFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Customer Form'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: CustomerForm(),
        ),
      ),
    );
  }
}
