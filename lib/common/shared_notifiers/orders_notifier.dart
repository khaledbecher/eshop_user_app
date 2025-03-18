import 'package:eshop/common/utils/services/remote/orders_service.dart';
import 'package:eshop/models/order.dart';
import 'package:flutter/cupertino.dart';

class OrdersNotifier with ChangeNotifier {
  bool _isLoading = false;
  bool _refresher = false;
  int _categoryIndex = 0;

  bool get isLoading => _isLoading;

  bool get refresher => _refresher;

  int get categoryIndex => _categoryIndex;

  void refresh() {
    _refresher = !_refresher;
    notifyListeners();
  }

  void changeCategoryIndex(int index) {
    _categoryIndex = index;
    notifyListeners();
  }

  void resetCategoryIndex() {
    _categoryIndex = 0;
    notifyListeners();
  }

  Future<void> addOrder(Orderr newOrder) async {
    _isLoading = true;
    notifyListeners();
    await OrdersService.addOrder(newOrder);
    _isLoading = false;
    notifyListeners();
  }

  Future<List<Orderr>> fetchAllOrders() async {
    final response = await OrdersService.fetchOrders();
    List<Orderr> orders = response.map((order) {
      return Orderr.fromJson(order);
    }).toList();
    return orders;
  }

  Future<List<Orderr>> fetchOrdersWithStatusFilter(
      {required String status}) async {
    final response = await OrdersService.fetchOrders();
    List<Orderr> orders =
        response.map((order) => Orderr.fromJson(order)).toList();
    List<Orderr> filteredOrders =
        orders.where((order) => order.status == status).toList();
    return filteredOrders;
  }

  Future<void> removeOrder({required Orderr order}) async {
    try {
      await OrdersService.removeOrder(order);
    } catch (e) {
      throw (e.toString());
    } finally {
      refresh();
    }
  }
}
