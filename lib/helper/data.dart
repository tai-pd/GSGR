import 'package:flutter/material.dart';

class DataStreet {
  int id;
  String district;
  List<String> ward;

  DataStreet({this.id, this.district, this.ward});
}

List<String> getStringDistrict() {
  return [
    'Hải Châu',
    'Thanh Khê',
    'Sơn Trà',
    'Ngũ Hành Sơn',
    'Liên Chiểu',
    'Hòa Vang',
    'Cẩm Lệ',
  ];
}

List<String> getStringWardByID(String id) {
  switch (id) {
    case 'Hải Châu':
      return [
        'Bình Hiên',
        'Bình Thuận',
        'Hải Châu 1',
        'Hải Châu 2',
        'Hòa Cương Bắc',
        'Hòa Cường Nam',
        'Hòa Thuận Đông',
        'Hòa Thuận Tây',
        'Nam Dương',
        'Phước Ninh',
        'Thạch Thang ',
        'Thạnh Bình ',
        'Thuận Phước '
      ];
      break;

    case 'Thanh Khê':
      return [
        'An Khê',
        'Chính Gián',
        'Hòa Khê ',
        'Tam Thuận',
        'Tân Chính',
        'Thạc Gián',
        'Thanh Khê Đông',
        'Thanh Khê Tây',
        'Vĩnh Trung',
        'Xuân Hà'
      ];
      break;

    case 'Sơn Trà':
      return [
        'An Hải Bắc',
        'An Hải Đông',
        'An Hải Tây',
        'Mân Thái',
        'Nại Hiên Đông',
        'Phước Mỹ',
        'Thọ Quang'
      ];
      break;

    case 'Ngũ Hành Sơn':
      return [
        'Hòa Hải',
        'Hòa Quý',
        'Khuê Mỹ',
        'Mỹ An',
      ];
      break;

    case 'Liên Chiểu':
      return [
        'Hòa Hiệp Bắc',
        'Hòa Hiệp Nam',
        'Hòa Khánh Bắc',
        'Hòa Khánh Nam',
        'Hòa Minh'
      ];
      break;

    case 'Hòa Vang':
      return [
        'Hòa Bắc',
        'Hòa Châu',
        'Hòa Khương',
        'Hòa Liên',
        'Hòa Nhơn',
        'Hòa Ninh',
        'Hòa Phong',
        'Hòa Phú',
        'Hòa Phước',
        'Hòa Sơn',
        'Hòa Tiến'
      ];
      break;

    case 'Cẩm Lệ':
      return [
        'Hòa An',
        'Hòa Phát',
        'Hòa Thọ Đông',
        'Hòa Thọ Tây',
        'Hòa Xuân',
        'Khuê Trung'
      ];
      break;
    default:
      return [
        'Bình Hiên',
        'Bình Thuận',
        'Hải Châu 1',
        'Hải Châu 2',
        'Hòa Cương Bắc',
        'Hòa Cường Nam',
        'Hòa Thuận Đông',
        'Hòa Thuận Tây',
        'Nam Dương',
        'Phước Ninh',
        'Thạch Thang ',
        'Thạnh Bình ',
        'Thuận Phước '
      ];
  }
}

List<String> getOrderStatus(roleId) {
  if (roleId == '1') {
    return [
      'Mới',
      'Bắt đầu lấy hàng',
      'Đã lấy hàng xong',
      'Bắt đầu giặt',
      'Đã giặt xong',
      'Bắt đầu trả hàng',
      'Hoàn thành',
      'Hủy',
    ];
  }
  if (roleId == '2') {
    return [
      'Bắt đầu lấy hàng',
      'Đã lấy hàng xong',
      'Bắt đầu trả hàng',
      'Hoàn thành',
    ];
  }
  if (roleId == '3') {
    return [
      'Bắt đầu lấy hàng',
      'Đã lấy hàng xong',
      'Bắt đầu giặt',
      'Đã giặt xong',
      'Bắt đầu trả hàng',
      'Hoàn thành',
      'Hủy',
    ];
  }
  if (roleId == '4') {
    return [
      'Mới',
      'Bắt đầu lấy hàng',
      'Đã lấy hàng xong',
      'Bắt đầu giặt',
      'Đã giặt xong',
      'Bắt đầu trả hàng',
      'Hoàn thành',
      'Hủy',
    ];
  }
  return [
    'Mới',
    'Bắt đầu lấy hàng',
    'Đã lấy hàng xong',
    'Bắt đầu giặt',
    'Đã giặt xong',
    'Bắt đầu trả hàng',
    'Hoàn thành',
    'Hủy',
  ];
}

getStatusValue(item) {
  switch (item.toString()) {
    case 'Phân loại':
      return null;
    case 'Mới':
      return 1;
    case 'Bắt đầu lấy hàng':
      return 2;
    case 'Đã lấy hàng xong':
      return 3;
    case 'Bắt đầu giặt':
      return 4;
    case 'Đã giặt xong':
      return 5;
    case 'Bắt đầu trả hàng':
      return 6;
    case 'Hoàn thành':
      return 7;
    case 'Hủy':
      return 8;
    default:
  }
}

getStatusContent(item) {
  switch (item.toString()) {
    case '1':
      return 'Mới';
    case '2':
      return 'Bắt đầu lấy hàng';
    case '3':
      return 'Đã lấy hàng xong';
    case '4':
      return 'Bắt đầu giặt';
    case '5':
      return 'Đã giặt xong';
    case '6':
      return 'Bắt đầu trả hàng';
    case '7':
      return 'Hoàn thành';
    case '8':
      return 'Hủy';
    default:
  }
}

percentStatus(item) {
  switch (item.toString()) {
    case '1':
      return 0.1;
    case '2':
      return 0.2;
    case '3':
      return 0.3;
    case '4':
      return 0.4;
    case '5':
      return 0.5;
    case '6':
      return 0.6;
    case '7':
      return 0.7;
    case '8':
      return 0;
    default:
  }
}

getStatusColor(item) {
  switch (item) {
    case 1:
      return Colors.red[300].withOpacity(0.7);
    case 2:
      return Colors.green[300].withOpacity(0.7);
    case 3:
      return Colors.grey[400].withOpacity(0.7);
    case 4:
      return Colors.orange[300].withOpacity(0.7);
    case 5:
      return Colors.blue[300].withOpacity(0.7);
    case 6:
      return Colors.yellow[300].withOpacity(0.7);
    case 7:
      return Colors.pink[300].withOpacity(0.7);
    default:
  }
}
