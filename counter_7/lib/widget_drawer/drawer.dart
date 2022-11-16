import 'package:counter_7/main.dart';
import 'package:counter_7/tambah_budget.dart';
import 'package:counter_7/data_budget.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
      children: [
        ListTile(
          title: const Text('Counter'),
          onTap: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => const MyHomePage(title: 'Counter')));
          },
        ),
        ListTile(
          title: const Text('Tambah Budget'),
          onTap: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        const MyAddBudgetPage(title: 'Tambah Budget')));
          },
        ),
        ListTile(
          title: const Text('Data Budget'),
          onTap: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        const MyBudgetDataPage(title: 'Data Budget')));
          },
        )
      ],
    ));
  }
}
