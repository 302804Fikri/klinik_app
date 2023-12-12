import 'package:flutter/material.dart';
import 'package:klinik_app/service/poli_service.dart';

import 'package:klinik_app/ui/poli_form_page.dart';
import 'package:klinik_app/ui/poli_item_page.dart';
import 'package:klinik_app/widget/sidebar.dart';

import '../model/poli.dart';

class PoliPage extends StatefulWidget {
  const PoliPage({super.key});

  @override
  State<PoliPage> createState() => _PoliPageState();
}

class _PoliPageState extends State<PoliPage> {
  Stream<List<Poli>> getList() async* {
    List<Poli> data = await PoliService().listData();
    yield data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Sidebar(),
        appBar: AppBar(
          title: Text(
            "Data Poli",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Colors.blue,
          leading: Builder(builder: (context) {
            return IconButton(
              icon: Icon(Icons.menu, color: Colors.white),
              onPressed: () => Scaffold.of(context).openDrawer(),
            );
          }),
          actions: [
            GestureDetector(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.add, color: Colors.white),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PoliForm()));
              },
            )
          ],
        ),
        body: StreamBuilder(
          stream: getList(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }
            if (snapshot.connectionState != ConnectionState.done) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (!snapshot.hasData &&
                snapshot.connectionState == ConnectionState.done) {
              return Text('Data Kosong');
            }
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return PoliItem(poli: snapshot.data[index]);
              },
            );
          },
        ));
  }
}
