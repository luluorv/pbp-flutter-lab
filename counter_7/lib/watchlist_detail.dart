import 'package:counter_7/widget_drawer/drawer.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final data;
  const MyApp({super.key, this.data});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Detail',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WatchListDetailPage(key, data: data),
    );
  }
}

class WatchListDetailPage extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  final data;
  const WatchListDetailPage(param0, {super.key, required this.data});
  final String title = 'Detail';

  @override
  State<WatchListDetailPage> createState() => _WatchListDetailPageState();
}

class _WatchListDetailPageState extends State<WatchListDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        drawer: const CustomDrawer(),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                padding: const EdgeInsets.all(20.0),
                child: Center(
                  child: Text('${widget.data.fields.title}',
                      style: const TextStyle(
                          fontSize: 30, fontWeight: FontWeight.bold)),
                )),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  const Text(
                    'Release Date: ',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(
                      DateFormat('MMM d, y')
                          .format(widget.data.fields.releaseDate),
                      style: const TextStyle(fontSize: 16))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  const Text(
                    'Rating: ',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text('${widget.data.fields.rating}/10',
                      style: const TextStyle(fontSize: 16))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  const Text('Status: ',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  if (widget.data.fields.watched)
                    const Text(
                      'watched',
                      style: TextStyle(fontSize: 16),
                    )
                  else
                    const Text(
                      'haven\'t watched',
                      style: TextStyle(fontSize: 16),
                    )
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Review:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                '${widget.data.fields.review}',
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton.extended(
            tooltip: 'Kembali',
            label: const Text("Kembali"),
            onPressed: () => Navigator.pop(context)));
  }
}
