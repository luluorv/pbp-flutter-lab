import 'package:counter_7/widget_drawer/budget.dart';
import 'package:counter_7/widget_drawer/drawer.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Data Budget',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyBudgetDataPage(title: 'Data Budget'),
    );
  }
}

class MyBudgetDataPage extends StatefulWidget {
  const MyBudgetDataPage({super.key, required this.title});

  final String title;

  @override
  State<MyBudgetDataPage> createState() => _MyBudgetDataPage();
}

class _MyBudgetDataPage extends State<MyBudgetDataPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        drawer: const CustomDrawer(),
        body: ListView.builder(
          itemCount: budgetData.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 3),
                      child: Text(
                        "${budgetData[index].judul} (${budgetData[index].tanggal})",
                        style: const TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 3),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "${budgetData[index].nominal}",
                            style: const TextStyle(
                              fontSize: 12,
                            ),
                          ),
                          Text(
                            budgetData[index].tipe,
                            style: const TextStyle(
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ));
  }
}
