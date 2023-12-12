import 'package:dio/dio.dart';
import 'package:klinik_app/helpers/api_client.dart';
import 'package:klinik_app/model/pasien.dart';

class PasienService {
  Future<List<Pasien>> listData() async {
    final Response response = await ApiClient().get('poli');
    final List data = response.data as List;
    List<Pasien> result = data.map((json) => Pasien.fromJson(json)).toList();
    return result;
  }

  Future<Pasien> simpan(Pasien pasien) async {
    var data = pasien.toJson();
    final Response response = await ApiClient().post('pasien', data);
    Pasien result = Pasien.fromJson(response.data);
    return result;
  }

  Future<Pasien> ubah(Pasien pasien, String id) async {
    var data = pasien.toJson();
    final Response response = await ApiClient().put('pasien/${id}', data);
    print(response);
    Pasien result = Pasien.fromJson(response.data);
    return result;
  }

  Future<Pasien> getById(String id) async {
    final Response response = await ApiClient().get('pasien/${id}');
    Pasien result = Pasien.fromJson(response.data);
    return result;
  }

  Future<Pasien> hapus(Pasien pasien) async {
    final Response response = await ApiClient().delete('paseien/${pasien.id}');
    Pasien result = Pasien.fromJson(response.data);
    return result;
  }
}
