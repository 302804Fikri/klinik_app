import 'package:flutter/material.dart';
import 'package:klinik_app/model/pasien.dart';
import 'package:klinik_app/ui/pasien_detail_page.dart';
import 'package:klinik_app/ui/pasien_form_page.dart';
import 'package:klinik_app/widget/sidebar.dart';

class PasienPage extends StatefulWidget {
  const PasienPage({super.key});

  @override
  State<PasienPage> createState() => _PasienPageState();
}

class _PasienPageState extends State<PasienPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Sidebar(),
        appBar: AppBar(
          title: Text(
            "Data Pasien",
            style: TextStyle(color: Colors.white),
          ),
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
                    MaterialPageRoute(builder: (context) => PasienForm()));
              },
            )
          ],
        ),
        body: ListView(
          children: [
            GestureDetector(
              onTap: () {
                Pasien namaPasien = new Pasien(
                    nomorRm: "12345",
                    namaPasien: "Yos",
                    tanggalLahir: "19 juli 1998",
                    nomorTelepon: "0812345678",
                    alamat: "Cililitan");
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            PasienDetailPage(pasien: namaPasien)));
              },
              child: Card(
                child: ListTile(
                  title: Text("Yos"),
                ),
              ),
            )
          ],
        ));
  }
}
