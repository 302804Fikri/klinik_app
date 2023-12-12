import 'package:flutter/material.dart';
import 'package:klinik_app/helpers%20(1)/user_info%20(1).dart';
import 'package:klinik_app/ui%20(1)/login%20(1).dart';
import 'package:klinik_app/ui/ui%20(1)/beranda%20(1).dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var token = await UserInfo().getToken();
  print(token);
  runApp(MaterialApp(
    title: "Klinik APP",
    debugShowCheckedModeBanner: false,
    home: token == null ? Login() : Beranda(),
  ));
}
