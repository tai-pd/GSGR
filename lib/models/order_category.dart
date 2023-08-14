import 'package:flutter/material.dart';
import 'package:gsgr/value/colors.dart';

class OrderCategory {
  String title;
  Icon icon;

  OrderCategory({this.title, this.icon});

  static List<OrderCategory> faceData() {
    return [
      OrderCategory(
          title: 'Combo',
          icon: Icon(Icons.people, color: AppColors.kMaincolor)),
      OrderCategory(
          title: 'Giặt ký',
          icon: Icon(Icons.people, color: AppColors.kMaincolor)),
      OrderCategory(
          title: 'Giặt thường',
          icon: Icon(Icons.people, color: AppColors.kMaincolor)),
      OrderCategory(
          title: 'Đồ văn phòng',
          icon: Icon(Icons.people, color: AppColors.kMaincolor)),
      OrderCategory(
          title: 'Dã ngoại',
          icon: Icon(Icons.people, color: AppColors.kMaincolor)),
      OrderCategory(
          title: 'Phòng khách',
          icon: Icon(Icons.people, color: AppColors.kMaincolor)),
      OrderCategory(
          title: 'Dịch vụ khác',
          icon: Icon(Icons.people, color: AppColors.kMaincolor)),
    ];
  }
}
