import 'package:get/get.dart';

class Store {
  final String uid_store;
  final String name;
  final String images;
  int total;
  final List<Product> products;

  Store(
      {required this.uid_store,
      required this.name,
      required this.products,
      required this.images,
      this.total = 0});

  Map<String, dynamic> toMap() {
    return {
      'uid_store': uid_store,
      'name': name,
      'images': images,
      'total': total,
      'products': products.map((product) => product.toMap()).toList(),
    };
  }

  static Store fromMap(Map<String, dynamic> map) {
    return Store(
      uid_store: map['uid_store'],
      name: map['name'],
      images: map['images'],
      total: map['total'],
      products: List<Product>.from(
        map['products'].map((productMap) => Product.fromMap(productMap)),
      ),
    );
  }

  @override
  String toString() {
    return 'uid_store: $uid_store, name: $name, images:$images, products: $products, total: $total';
  }
}

class Product {
  final String uid_produk;
  final String name;
  final double price;
  final int jumlah;
  final String images;
  bool selected;

  Product(
      {required this.uid_produk,
      required this.name,
      required this.price,
      required this.jumlah,
      required this.images,
      this.selected = false});

  Map<String, dynamic> toMap() {
    return {
      'uid_produk': uid_produk,
      'name': name,
      'price': price,
      'jumlah': jumlah,
      'images': images,
      'selected': selected
    };
  }

  static Product fromMap(Map<String, dynamic> map) {
    return Product(
        uid_produk: map['uid_produk'],
        name: map['name'],
        price: map['price'],
        jumlah: map['jumlah'],
        images: map['images'],
        selected: map['selected']);
  }

  @override
  String toString() {
    return 'uid_produk: $uid_produk, name: $name, price: $price, jumlah: $jumlah, images: $images, selected: $selected';
  }
}
