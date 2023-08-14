import 'package:gsgr/value/constants.dart';

class OrderDetail {
  int id;
  String title;
  String price;
  String detail;
  String thumb;

  OrderDetail({this.id, this.price, this.title, this.thumb, this.detail});

  static List<OrderDetail> listOrderCompo(TYPEORDER type) {
    switch (type) {
      case TYPEORDER.Combo:
        return [
          OrderDetail(
              id: 11, price: '25000', title: 'Combo 1', detail: 'Detail null'),
          OrderDetail(
              id: 12, price: '25000', title: 'Combo 1', detail: 'Detail null'),
        ];
        break;

      case TYPEORDER.KG:
        return [
          OrderDetail(
              id: 21,
              price: '12.000/kg',
              title: 'Quần áo dân sinh',
              detail: 'Quần áo <2kg :25k/ lần giặt'),
          OrderDetail(
              id: 22,
              price: '20.000/kg',
              title: 'Chăn, ga',
              detail: 'Chăn ga<1.5kg:; 30k/lần giặt')
        ];
        break;
      case TYPEORDER.Office:
        return [
          OrderDetail(
              id: 31,
              price: '10.000/cái',
              title: 'Áo sợ mi',
              detail: 'Giặt + sấy + ủi'),
          OrderDetail(
              id: 32,
              price: '10.000/cái',
              title: 'Quần âu',
              detail: 'Giặt + sấy + ủi'),
          OrderDetail(
              id: 32,
              price: '10.000/cái',
              title: 'Váy ngắn',
              detail: 'Giặt + sấy + ủi'),
        ];
        break;
      case TYPEORDER.Vip:
        return [
          OrderDetail(
              id: 41,
              price: '50.000đ/cái',
              title: 'Áo vest',
              detail: 'Giặt + sấy + ủi'),
          OrderDetail(
              id: 42,
              price: '40.000đ/cái',
              title: 'Áo dạ',
              detail: 'Giặt + sấy + ủi'),
          OrderDetail(
              id: 43,
              price: '40.000đ/cái',
              title: 'Áo dài',
              detail: 'Giặt + sấy + ủi'),
          OrderDetail(
              id: 44,
              price: '40.000đ/cái',
              title: 'Áo Nhung',
              detail: 'Giặt + sấy + ủi'),
        ];
        break;
      case TYPEORDER.Shoes:
        return [
          OrderDetail(
              id: 51,
              price: '40.000đ/cái',
              title: 'Giày',
              detail: 'Detail null'),
          OrderDetail(
              id: 52,
              price: '20.000đ/cái',
              title: 'Mũ bảo hiểm',
              detail: 'Detail null '),
        ];
        break;

      case TYPEORDER.Other:
        return [
          OrderDetail(
              id: 61,
              price: 'Đang phát triển',
              title: 'Dịch vụ dọn nhà theo giờ',
              detail: 'Đang phát triển, sẽ sớm cập nhật'),
          OrderDetail(
              id: 62,
              price: 'Đang phát triển',
              title: 'Dịch vụ dọn nhà trọn gói',
              detail: 'Đang phát triển, sẽ sớm cập nhật'),
          OrderDetail(
              id: 63,
              price: 'Đang phát triển',
              title: 'Dịch vụ dọn nhà theo giờ',
              detail: 'Đang phát triển, sẽ sớm cập nhật'),
        ];
      default:
        return [];
    }
  }
}
