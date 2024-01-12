class DropdownItemProvince {
  int id;
  String name;

  DropdownItemProvince({required this.id, required this.name});

  factory DropdownItemProvince.fromJson(Map<String, dynamic> json) {
    return DropdownItemProvince(
        id: int.tryParse(json['id'].toString()) ?? 0,
        name: json['name'] as String);
  }

  @override
  String toString() {
    return name;
  }
}

class DropdownItemRegency {
  int id;
  int province_id;
  String name;

  DropdownItemRegency(
      {required this.id, required this.name, required this.province_id});

  factory DropdownItemRegency.fromJson(Map<String, dynamic> json) {
    return DropdownItemRegency(
      id: int.tryParse(json['id'].toString()) ?? 0,
      province_id: int.tryParse(json['province_id'].toString()) ?? 0,
      name: json['name'] as String,
    );
  }
  @override
  String toString() {
    return name;
  }
}

class DropdownItemDistrict {
  int id;
  int regency_id;
  String name;

  DropdownItemDistrict(
      {required this.id, required this.name, required this.regency_id});

  factory DropdownItemDistrict.fromJson(Map<String, dynamic> json) {
    return DropdownItemDistrict(
      id: int.tryParse(json['id'].toString()) ?? 0,
      regency_id: int.tryParse(json['regency_id'].toString()) ?? 0,
      name: json['name'] as String,
    );
  }
  @override
  String toString() {
    return name;
  }
}
