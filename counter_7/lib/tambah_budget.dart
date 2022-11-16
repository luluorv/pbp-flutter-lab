import 'package:counter_7/widget_drawer/budget.dart';
import 'package:counter_7/widget_drawer/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tambah Budget',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyAddBudgetPage(title: 'Tambah Budget'),
    );
  }
}

class MyAddBudgetPage extends StatefulWidget {
  const MyAddBudgetPage({super.key, required this.title});

  final String title;

  @override
  State<MyAddBudgetPage> createState() => _MyAddBudgetPage();
}

class _MyAddBudgetPage extends State<MyAddBudgetPage> {
  final _formKey = GlobalKey<FormState>();
  String _judul = "";
  int _nominal = 0;
  String? _tipe;
  final List<String> _listTipe = ['Pemasukan', 'Pengeluaran'];
  DateTime date = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        drawer: const CustomDrawer(),
        body: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: "Judul",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        onChanged: (String? value) {
                          setState(() {
                            _judul = value!;
                          });
                        },
                        onSaved: (String? value) {
                          setState(() {
                            _judul = value!;
                          });
                        },
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Judul tidak boleh kosong!';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: "Nominal",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        onChanged: (String? value) {
                          setState(() {
                            _nominal = int.parse(value!);
                          });
                        },
                        onSaved: (String? value) {
                          setState(() {
                            _nominal = int.parse(value!);
                          });
                        },
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Nominal tidak boleh kosong!';
                          }
                          return null;
                        },
                      ),
                    ),
                    DropdownButton(
                      value: _tipe,
                      icon: const Icon(Icons.keyboard_arrow_down),
                      hint: const Text("Pilih jenis"),
                      items: _listTipe.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(items),
                        );
                      }).toList(),
                      onChanged: (String? value) {
                        setState(() {
                          _tipe = value ?? "";
                        });
                      },
                    ),
                    Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(height: 8),
                          Text(
                            '${date.day}/${date.month}/${date.year}',
                            style: const TextStyle(fontSize: 16),
                          ),
                          ElevatedButton(
                            onPressed: () async {
                              DateTime? newDate = await showDatePicker(
                                context: context,
                                initialDate: date,
                                firstDate: DateTime(1900),
                                lastDate: DateTime(2100),
                              );

                              setState(() {
                                date = newDate!;
                              });
                            },
                            child: const Text('Pilih tanggal'),
                          ),
                          const SizedBox(height: 8),
                          TextButton(
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.blue),
                            ),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                budgetData.add(Budget(_judul, _nominal, _tipe!,
                                    '${date.day}/${date.month}/${date.year}'));
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(const SnackBar(
                                  content: Text("Budget berhasil ditambah!"),
                                ));
                              }
                            },
                            child: const Text(
                              "Simpan",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ]),
                  ],
                ),
              ),
            )));
  }
}
