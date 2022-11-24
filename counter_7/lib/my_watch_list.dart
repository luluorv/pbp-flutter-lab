import 'package:counter_7/watchlist_detail.dart';
import 'package:counter_7/widget_drawer/drawer.dart';
import 'package:flutter/material.dart';
import 'package:counter_7/fetch_watchlist_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Watch List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyWatchlistPage(
        title: 'My Watch List',
      ),
    );
  }
}

class MyWatchlistPage extends StatefulWidget {
  const MyWatchlistPage({super.key, required String title});
  final String title = 'My Watch List';

  @override
  State<MyWatchlistPage> createState() => _MyWatchlistPageState();
}

class _MyWatchlistPageState extends State<MyWatchlistPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: const CustomDrawer(),
      body: FutureBuilder(
          future: fetchWatchlist(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return const Center(child: CircularProgressIndicator());
            } else {
              if (!snapshot.hasData) {
                return Column(
                  children: const [
                    Text(
                      "Tidak ada watch list :(",
                      style: TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                    ),
                    SizedBox(height: 8),
                  ],
                );
              } else {
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (_, index) => GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => WatchListDetailPage(
                                  snapshot.data![index].pk,
                                  // title: 'Detail',
                                  data: snapshot.data![index],
                                )),
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.all(5.0),
                      padding: const EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(
                            color: (snapshot.data![index].fields.watched)
                                ? Colors.green
                                : Colors.red,
                            width: 1,
                          )),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${snapshot.data![index].fields.title}",
                              style: const TextStyle(
                                fontSize: 18.0,
                              ),
                            ),
                            Checkbox(
                              checkColor: Colors.white,
                              value: snapshot.data![index].fields.watched,
                              onChanged: (bool? value) {
                                setState(() {
                                  snapshot.data![index].fields.watched = value!;
                                });
                              },
                            ),
                          ]),
                    ),
                  ),
                );
              }
            }
          }),
    );
  }
}
