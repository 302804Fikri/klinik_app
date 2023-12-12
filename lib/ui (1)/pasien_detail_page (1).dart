import 'package:flutter/material.dart';
import 'package:klinik_app/model/pasien.dart';
import 'package:klinik_app/ui/pasien_form_update.dart';
import 'package:klinik_app/ui/pasien_page.dart';

class PasienDetailPage extends StatefulWidget {
  final Pasien pasien;
  const PasienDetailPage({super.key, required this.pasien});

  @override
  State<PasienDetailPage> createState() => _PasienDetailPageState();
}

class _PasienDetailPageState extends State<PasienDetailPage> {
  @override
  Widget build(BuildContext context) {
      double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth; //selain text
    double ffem = fem * 0.97; //untuk Text
    return Scaffold(
       appBar: AppBar(title: Text("Detail Poli"),),
       body: Column(
        children: [
          SizedBox(height: 20*fem),
          Text(
            "Nomor RM : ${widget.pasien.nomorRm}",
            style: TextStyle(fontSize: 20*ffem),
          ),
          Text(
            "Nama Pasien : ${widget.pasien.namaPasien}",
            style: TextStyle(fontSize: 20*ffem),
          ),
          Text(
            "Tgl Lahir Pasien : ${widget.pasien.tanggalLahir}",
            style: TextStyle(fontSize: 20*ffem),
          ),
          Text(
            "No Telp Pasien : ${widget.pasien.nomorTelepon}",
            style: TextStyle(fontSize: 20*ffem),
          ),
          Text(
            "Alamat Pasien : ${widget.pasien.alamat}",
            style: TextStyle(fontSize: 20*ffem),
          ),
         
          SizedBox(height: 20*fem),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _tombolubah(),
              _tombolhapus()
            ],
          ),
        ],
       ),
    );
  }

   _tombolubah(){
    return ElevatedButton(
      onPressed: (){
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => PasienFormUpdate(pasien: widget.pasien))
        );
      },
      style: ElevatedButton.styleFrom(backgroundColor: Colors.orange, foregroundColor: Colors.white),
      child: Text("Ubah"),
    );
  }

  _tombolhapus(){
    return ElevatedButton(
      onPressed: (){
        AlertDialog alertDialog = AlertDialog(
          content: Text("Yakin ingin menghapus data ini?"),
          actions: [
            // tombol ya
            ElevatedButton(
              onPressed: (){
                Navigator.pop(context);
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => PasienPage()));
              },
              child: Text("YA"),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red, foregroundColor: Colors.white),
            ),

            // tombol batal
            ElevatedButton(
              onPressed: (){
                Navigator.pop(context);
              },
              child: Text("Tidak"),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.grey, foregroundColor: Colors.black),
            )
          ],
        );
        showDialog(context: context, builder: (context) => alertDialog);
      },
      style: ElevatedButton.styleFrom(backgroundColor: Colors.red, foregroundColor: Colors.white),
      child: Text("Hapus"),
    );
  }
}
