import 'package:flutter/material.dart';
import 'package:klinik_app/ui%20(1)/login%20(1).dart';
import 'package:klinik_app/ui%20(1)/pasien_page%20(1).dart';
import 'package:klinik_app/ui%20(1)/pegawai_page%20(1).dart';
import 'package:klinik_app/ui%20(1)/poli_page%20(1).dart';
import 'package:klinik_app/ui/ui%20(1)/beranda%20(1).dart';


class Sidebar extends StatelessWidget {
  const Sidebar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text("Admin"),
            accountEmail: Text("admin@admin.com"),
            decoration: BoxDecoration(
              color: Colors.blue
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text("Beranda"),
            onTap: (){
              Navigator.push(
              context, MaterialPageRoute(builder: (context) => Beranda()));
            },
          ),

          ListTile(
            leading: Icon(Icons.accessible),
            title: Text("Poli"),
            onTap: (){
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => PoliPage()));
            },
          ),

          ListTile(
            leading: Icon(Icons.people),
            title: Text("Pegawai"),
            onTap: (){
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => PegawaiPage()));
            },
          ),

          ListTile(
            leading: Icon(Icons.account_box_sharp),
            title: Text("Pasien"),
            onTap: (){
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => PasienPage()));
            },
          ),

          ListTile(
            leading: Icon(Icons.logout_rounded),
            title: Text("Keluar"),
            onTap: (){
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => Login()),
                  (Route<dynamic> route) => false);
            },
          ),
        ],
      ),
    );
  }
}
