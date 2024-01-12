import 'dart:convert';
import 'dart:ffi';
import 'package:FoodCycle/models/ProvinceModel.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ProvinceController extends GetxController {
  RxList<DropdownItemProvince> _items = <DropdownItemProvince>[].obs;
  RxString _selectedItem = ''.obs;
  RxInt _selectedId = 0.obs;

  List<DropdownItemProvince> get items => _items;
  String get selectedItem => _selectedItem.value;
  int get selectedId => _selectedId.value;

  Future<void> fetchData() async {
    try {
      final response = await http.get(Uri.parse(
          'https://jong44.github.io/api-wilayah-indonesia/api/provinces.json'));

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        _items.assignAll(
            data.map((item) => DropdownItemProvince.fromJson(item)).toList());
      } else {
        throw Exception('Failed to load data from API');
      }
    } catch (error) {
      throw Exception('Failed to load data: $error');
    }
  }

  void setSelectedItem(String value) {
    _selectedItem.value = value;
  }

  void setSelectedId(int id) {
    _selectedId.value = id;
  }
}

class RegencyController extends GetxController {
  RxList<DropdownItemRegency> _items = <DropdownItemRegency>[].obs;
  RxString _selectedItem = ''.obs;

  List<DropdownItemRegency> get items => _items;
  String get selectedItem => _selectedItem.value;

  Future<void> fetchRegenciesByProvinceId(int provinceId) async {
    try {
      String id = provinceId.toString();
      final response = await http.get(Uri.parse(
          'https://jong44.github.io/api-wilayah-indonesia/api/regencies/$id.json'));
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        _items
            .assignAll(data.map((item) => DropdownItemRegency.fromJson(item)));
      } else {
        throw Exception('Gagal mengambil data kabupaten dari API');
      }
    } catch (error) {
      print('Gagal Bro');
      throw Exception('Gagal: $error');
    }
  }

  void setSelectedItem(String value) {
    _selectedItem.value = value;
  }
}

class DistrictController extends GetxController {
  RxList<DropdownItemDistrict> _items = <DropdownItemDistrict>[].obs;
  RxString _selectedItem = ''.obs;

  List<DropdownItemDistrict> get items => _items;
  String get selectedItem => _selectedItem.value;

  Future<void> fetchRegenciesByRegencyId(int regencyId) async {
    try {
      // Ganti URL dengan URL yang sesuai
      String id = regencyId.toString();
      final response = await http.get(Uri.parse(
          'https://jong44.github.io/api-wilayah-indonesia/api/districts/$id.json'));
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        _items
            .assignAll(data.map((item) => DropdownItemDistrict.fromJson(item)));
      } else {
        throw Exception('Gagal mengambil data kabupaten dari API');
      }
    } catch (error) {
      print('Gagal Bro');
      throw Exception('Gagal: $error');
    }
  }

  void setSelectedItem(String value) {
    _selectedItem.value = value;
  }
}
