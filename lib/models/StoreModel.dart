class Store {
  final String uid_store;
  final String name;
  final List<Product> products;

  Store({required this.name, required this.products, required this.uid_store});
}

class Product {
  final String uid_produk;
  final String name;
  final double price;
  final int jumlah;

  Product(
      {required this.uid_produk,
      required this.name,
      required this.price,
      required this.jumlah});
}
