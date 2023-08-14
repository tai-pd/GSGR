import 'package:get/get.dart';
// import 'package:gsgr/helper/helper.dart';
import 'package:gsgr/models/product_model.dart';

class CartController extends GetxController {
  List<Products> listItem = [];
  var countItemCar = 0.obs;

  void addItemtoCart(Products item) async {
    bool addToCar = true;
    listItem.forEach((element) {
      if ((element).id == item.id) {
        addToCar = false;
        if (item.isMulti == 1) {
          (element).quantity += 1;
        }
      }
    });
    if (addToCar) {
      item.quantity = 1;
      listItem.add(item);
    }
    countItemQuatity();
  }

  void removeItemTocar(Products item) {
    if (listItem.length > 0) {
      //  Products result =  listItem.firstWhere((element) => (element as Products).id == item.id);
      int idChange = -1;
      for (var i = 0; i < listItem.length; i++) {
        if (listItem[i].id == item.id) {
          idChange = i;
        }
      }

      if (idChange != -1) {
        listItem[idChange].quantity -= 1;
        if (listItem[idChange].quantity == 0) {
          listItem.removeAt(idChange);
        }
      }

      countItemQuatity();

      // listItem.forEach((element) {
      //   if ((element).id == item.id) {
      //     element.quantity -= 1;
      //     if (element.quantity == 0) {
      //       listItem.remove(element);
      //     }
      //   }
      // });
      // countItemQuatity();
    }
  }

  bool checkIssetItemInCart(Products item) {
    bool checkValue = false;
    if (listItem.length > 0) {
      listItem.forEach((element) {
        if ((element).id == item.id) {
          checkValue = true;
        }
      });
    } else {
      checkValue = false;
    }
    return checkValue;
  }

  countItemQuatity() {
    countItemCar.value = 0;
    listItem.forEach((item) {
      countItemCar.value += (item).quantity;
    });
  }

  int getNumberQuatity(Products item) {
    int checkValue = 0;
    if (listItem.length > 0) {
      listItem.forEach((element) {
        if ((element).id == item.id) {
          checkValue = (element).quantity;
        }
      });
    } else {
      checkValue = 0;
    }
    return checkValue;
    // var _animatedMovies =
    //     listItem.where((i) => (i as Products).id == item.id).toList();
    // if (_animatedMovies.length > 0) {
    //   return (_animatedMovies[0] as Products)?.quantity ?? 0;
    // } else {
    //   return 0;
    // }
  }
}
