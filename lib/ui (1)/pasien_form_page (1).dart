import 'package:flutter/material.dart';
import 'package:klinik_app/model/pasien.dart';
import 'package:klinik_app/ui/pasien_detail_page.dart';

class PasienForm extends StatefulWidget {
  const PasienForm({super.key});

  @override
  State<PasienForm> createState() => _PasienFormState();
}

class _PasienFormState extends State<PasienForm> {
  final _formKey = GlobalKey<FormState>();
  final _nomorRmCtrl = TextEditingController();
  final _namaPasienCtrl = TextEditingController();
  final _tanggalLahirCtrl = TextEditingController();
  final _nomorTeleponCtrl = TextEditingController();
  final _alamatCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Tambah Poli")),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                _fieldNamaPoli(),
            SizedBox(height: 20),
            _tombolSimpan()
              ],
            ),
          ),
        ),
    );
  }

   _fieldNamaPoli(){
    return TextField(
      decoration: InputDecoration(
        labelText: "Nama Poli"
      ),
      controller: _namaPasienCtrl,
    );
  }

   _tombolSimpan(){
    return ElevatedButton(
      onPressed: (){
        Pasien pasien = Pasien(
            namaPasien: _namaPasienCtrl.text,
            nomorRm: _nomorRmCtrl.text,
            tanggalLahir: _tanggalLahirCtrl.text,
            nomorTelepon: _nomorTeleponCtrl.text,
            alamat: _alamatCtrl.text,          
        );
        Navigator.pushReplacement(context,
          MaterialPageRoute(builder:
              (context) => PasienDetailPage(pasien: pasien))
        );
      },
      child: Text("Simpan")
    );
  }
}
