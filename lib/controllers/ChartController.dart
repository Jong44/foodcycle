import 'package:FoodCycle/models/StoreModel.dart';
import 'package:FoodCycle/view/page/chartpage/CharPage.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class ChartController extends GetxController {
  var notif = 0.obs;
  var jumlah = 0.obs;

  var jumlahProduct = 0.obs;
  var total = 0.obs;

  void chartAdd() {
    notif.value = notif.value + 1;
    print(notif.value);
  }

  final _stores = <Store>[].obs;
  final _productSelected = <Store>[].obs;

  List<Store> get stores => _stores;
  List<Store> get productSelected => _productSelected;

  void calculateTotal() {
    double totalHarga = 0;
    int totalProduk = 0;
    int jumlahs = 0;

    total.value = 0;
    jumlahProduct.value = 0;
    jumlahs = 0;

    for (var store in _stores) {
      for (var product in store.products) {
        if (product.selected) {
          totalHarga += product.price * product.jumlah;
          totalProduk += 1;
        }
        jumlahs += 1;
      }
    }

    total.value = totalHarga.toInt();
    jumlahProduct.value = totalProduk;
    jumlah.value = jumlahs;

    print('Total Produk: ${jumlah.value}');
  }

  void calculateStoreTotal() {}

  @override
  void onInit() {
    super.onInit();
    loadData();
    calculateTotal();
  }

  void SelectedList() {
    if (_stores.isNotEmpty) {
      _productSelected.clear();

      final selectedStores = _stores
          .where((store) => store.products.any((product) => product.selected));

      _productSelected.addAll(selectedStores.expand(
        (store) {
          if (store.products.any((product) => product.selected)) {
            double storeTotal = 0.0;

            List<Product> selectedProducts = store.products
                .where((product) => product.selected)
                .map((product) => Product(
                      uid_produk: product.uid_produk,
                      name: product.name,
                      price: product.price,
                      jumlah: product.jumlah,
                      images: product.images,
                      selected: product.selected,
                    ))
                .toList();

            // Update total harga produk terpilih di toko
            storeTotal = selectedProducts.fold(0.0,
                (total, product) => total + (product.price * product.jumlah));

            print('Total for Store ${store.name}: Rp $storeTotal');
            store.total = storeTotal.toInt();

            return [
              Store(
                uid_store: store.uid_store,
                name: store.name,
                images: store.images,
                products: selectedProducts,
                total: storeTotal.toInt(),
              )
            ];
          } else {
            return [];
          }
        },
      ));

      _productSelected.forEach((product) {
        print('Selected Product: $product');
      });
    }
  }

// ...

  Future<void> loadData() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final storedData = prefs.getString('stores');
      if (storedData != null) {
        final List<dynamic> decodedData = jsonDecode(storedData);

        _stores.assignAll(decodedData.map((data) {
          final Map<String, dynamic> storeMap = Map<String, dynamic>.from(data);
          return Store(
            uid_store: storeMap['uid_store'] ?? '',
            name: storeMap['name'] ?? '',
            images: storeMap['images'] ?? '',
            products: (storeMap['products'] as List<dynamic>?)?.map((product) {
                  return Product(
                      uid_produk: product['uid_produk'] ?? '',
                      name: product['name'] ?? '',
                      price: product['price'] ?? 0.0,
                      jumlah: product['jumlah'] ?? 0,
                      images: product['images'] ?? '');
                }).toList() ??
                [],
          );
        }));
        calculateTotal();
        print('Data loaded successfully');
      }
    } catch (e) {
      print('Error loading data: $e');
    }
  }

  void saveData() async {
    try {
      final prefs = await SharedPreferences.getInstance();

      // Convert _stores list to a List<Map<String, dynamic>>
      final List<Map<String, dynamic>> dataToSave = _stores.map((store) {
        return {
          'uid_store': store.uid_store,
          'name': store.name,
          'images': store.images,
          'products': store.products.map((product) {
            return {
              'uid_produk': product.uid_produk,
              'name': product.name,
              'price': product.price,
              'jumlah': product.jumlah,
              'images': product.images,
            };
          }).toList(),
        };
      }).toList();

      final jsonString = jsonEncode(dataToSave);

      prefs.setString('stores', jsonString);
      print('Data saved successfully');
      calculateTotal();
    } catch (e) {
      print('Error saving data: $e');
    }
  }

  void addProductToStore(
      String uid_store, String storeName, String storeImages, Product product) {
    final existingStore = _stores.firstWhere(
      (store) => store.name == storeName,
      orElse: () => Store(
          uid_store: uid_store,
          name: storeName,
          images: storeImages,
          products: []),
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
    final index = _stores.indexWhere(
      (existingStore) => existingStore.uid_store == store.uid_store,
    );

    if (index != -1) {
      if (store.products.isEmpty) {
        // Remove the store from the list if its product list is empty
        _stores.removeAt(index);
      } else {
        // Update the existing store with the modified product list
        _stores[index] = store;
      }
    } else {
      // Add the store to the list if it doesn't exist
      if (store.products.isNotEmpty) {
        _stores.add(store);
      }
    }

    saveData();
  }

  void removeProductFromStore(String uid_store, Product product) {
    final storeIndex =
        _stores.indexWhere((store) => store.uid_store == uid_store);

    if (storeIndex != -1) {
      final store = _stores[storeIndex];

      final productIndex = store.products.indexWhere((existingProduct) =>
          existingProduct.uid_produk == product.uid_produk);

      if (productIndex != -1) {
        store.products.removeAt(productIndex);

        if (store.products.isEmpty) {
          _stores.removeAt(storeIndex);
        }

        _updateOrAddStore(store);
      }
    }
  }

  void increaseProductQuantity(String uid_store, String uid_produk) {
    _updateProductQuantity(uid_store, uid_produk, 1);
  }

  void decreaseProductQuantity(String uid_store, String uid_produk) {
    _updateProductQuantity(uid_store, uid_produk, -1);
  }

  void _updateProductQuantity(String uid_store, String uid_produk, int change) {
    final storeIndex =
        _stores.indexWhere((store) => store.uid_store == uid_store);

    if (storeIndex != -1) {
      final store = _stores[storeIndex];

      final productIndex = store.products
          .indexWhere((product) => product.uid_produk == uid_produk);

      if (productIndex != -1) {
        final product = store.products[productIndex];

        final newQuantity =
            (product.jumlah + change).clamp(0, double.infinity).toInt();

        // Update the quantity of the product
        store.products[productIndex] = Product(
            uid_produk: product.uid_produk,
            name: product.name,
            price: product.price,
            jumlah: newQuantity,
            images: product.images);

        // Update or add the modified store
        _updateOrAddStore(store);
      }
    }
  }

  void toggleProductSelection(String uid_store, String uid_product) {
    final storeIndex =
        _stores.indexWhere((store) => store.uid_store == uid_store);

    if (storeIndex != -1) {
      final store = _stores[storeIndex];

      final productIndex = store.products.indexWhere(
          (existingProduct) => existingProduct.uid_produk == uid_product);

      if (productIndex != -1) {
        final product = store.products[productIndex];
        product.selected = !product.selected;
      }

      _updateOrAddStore(store);
      update();
    }
  }
}
