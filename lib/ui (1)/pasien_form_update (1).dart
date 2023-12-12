import 'package:flutter/material.dart';
import 'package:klinik_app/model/pasien.dart';
import 'package:klinik_app/ui/pasien_detail_page.dart';

class PasienFormUpdate extends StatefulWidget {
  final Pasien pasien;
  const PasienFormUpdate({Key? key, required this.pasien}) : super(key: key);

  @override
  State<PasienFormUpdate> createState() => _PasienFormUpdateState();
}

class _PasienFormUpdateState extends State<PasienFormUpdate> {
  final _formKey = GlobalKey<FormState>();
  final _namaPasienCtrl = TextEditingController();
  final _nomorRmCtrl = TextEditingController();
  final _tanggalLahirCtrl = TextEditingController();
  final _nomorTeleponCtrl = TextEditingController();
  final _alamatCtrl = TextEditingController();

void initState(){
  super.initState();
    setState((){
      _namaPasienCtrl.text = widget.pasien.namaPasien;
      _nomorRmCtrl.text = widget.pasien.nomorRm;
      _tanggalLahirCtrl.text = widget.pasien.tanggalLahir;
      _nomorTeleponCtrl.text = widget.pasien.nomorTelepon;
      _alamatCtrl.text = widget.pasien.alamat;
    });
  }
   @override
  Widget build(BuildContext context) {
    return Scaffold(
  appBar: AppBar(title: Text("Ubah Pasien")),
  body: SingleChildScrollView(
    child: Form(
      key: _formKey,
      child: Column(
        children: [
          _fieldNomorRm(),
          _fieldNamaPasien(),
      _fieldTglLahir(),
      _fieldNoTlpn(),
      _fieldAlamat(),
        SizedBox(height: 20),
                _tombolUbah()
        ],
      ),
    ),
  ),
    );
  }

  _fieldNomorRm() {
    return TextField(
      decoration: InputDecoration(labelText: "Nomor RM"),
      controller: _nomorRmCtrl,
    );
  }

  _fieldNamaPasien() {
    return TextField(
      decoration: InputDecoration(labelText: "Nama Pasien"),
      controller: _namaPasienCtrl,
    );
  }

  _fieldTglLahir() {
    return TextField(
      decoration: InputDecoration(labelText: "Tgl Lahir Pasien"),
      controller: _tanggalLahirCtrl,
    );
  }

  _fieldNoTlpn() {
    return TextField(
      decoration: InputDecoration(labelText: "Telp Pasien"),
      controller: _nomorTeleponCtrl,
    );
  }

  _fieldAlamat() {
    return TextField(
      decoration: InputDecoration(labelText: "Alamat"),
      controller: _alamatCtrl,
    );
  }

  _tombolUbah() {
    return ElevatedButton(
        onPressed: () {
          Pasien pasien = Pasien(
              namaPasien: _namaPasienCtrl.text,
              nomorRm: _nomorRmCtrl.text,
              tanggalLahir: _tanggalLahirCtrl.text,
              nomorTelepon: _nomorTeleponCtrl.text,
              alamat: _alamatCtrl.text,
             );
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => PasienDetailPage(pasien: pasien)));
        },
        child: Text("Ubah"));
  }

}

 
