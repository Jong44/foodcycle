import 'package:FoodCycle/models/StoreModel.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class ChartController extends GetxController {
  var notif = 0.obs;
  var jumlah = 1.obs;

  void chartAdd() {
    notif.value = notif.value + 1;
    print(notif.value);
  }

  final _stores = <Store>[].obs;

  List<Store> get stores => _stores;

  @override
  void onInit() {
    super.onInit();
    loadData();
  }

  Future<void> loadData() async {
    final prefs = await SharedPreferences.getInstance();
    final storedData = prefs.getStringList('stores');
    if (storedData != null) {
      _stores.assignAll(storedData.map((data) {
        final Map<String, dynamic> storeMap =
            Map<String, dynamic>.from(jsonDecode(data) as Map<String, dynamic>);
        return Store(
          uid_store: storeMap['uid_store'],
          name: storeMap['name'],
          products: List<Product>.from(storeMap['products'].map((product) =>
              Product(
                  uid_produk: product['uid_produk'],
                  name: product['name'],
                  price: product['price'],
                  jumlah: product['jumlah']))),
        );
      }));
    }
  }

  void saveData() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String> dataToSave = _stores.map((store) {
      final Map<String, dynamic> storeMap = {
        'name': store.name,
        'products': store.products
            .map((product) => {'name': product.name, 'price': product.price})
            .toList(),
      };
      final jsonString = jsonEncode(storeMap);
      print(jsonString);
      return jsonEncode(storeMap);
    }).toList();

    prefs.setStringList('stores', dataToSave);
  }

  void addProductToStore(String uid_store, String storeName, Product product) {
    final existingStore = _stores.firstWhere(
      (store) => store.name == storeName,
      orElse: () => Store(uid_store: uid_store, name: storeName, products: []),
    );

    if (existingStore.products
        .any((existingProduct) => existingProduct.name == product.name)) {
      print('Produk sudah ada di dalam toko.');
    } else {
      existingStore.products.add(product);
      _updateOrAddStore(existingStore);
    }
  }

  void _updateOrAddStore(Store store) {
    final index =
        _stores.indexWhere((existingStore) => existingStore.name == store.name);
    if (index != -1) {
      _stores[index] = store;
    } else {
      _stores.add(store);
    }
    saveData();
  }

  void removeStore(int index) {
    _stores.removeAt(index);
    saveData();
  }
}
