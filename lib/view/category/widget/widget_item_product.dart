import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gsgr/helper/helper.dart';
import 'package:gsgr/models/product_model.dart';

class WidgetItemProduct extends StatelessWidget {
  final Function onClickProduct;
  final Products item;
  const WidgetItemProduct({
    this.item,
    @required this.onClickProduct,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onClickProduct();
      },
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 12, horizontal: 4),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage('${item.image}'), fit: BoxFit.cover),
                color: Colors.redAccent.withOpacity(.5),
                borderRadius: BorderRadius.circular(20)),
            width: Get.width,
            height: 200,
          ),
          Positioned(
            top: 34,
            left: 4,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(12),
                      bottomRight: Radius.circular(12))),
              child: Text(
                Helper.convertPrice('${item.price} đ'),
                style: TextStyle(fontWeight: FontWeight.w400),
              ),
            ),
          ),
          Positioned(
            bottom: 34,
            left: 4,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.black12,
              ),
              child: Text(
                '${item.name}',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
          Positioned(
            right: 12,
            bottom: 34,
            child: InkWell(
              onTap: () {
                // Get.to(DetailOrder());
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black45,
                          offset: Offset(0, 3),
                          blurRadius: 4)
                    ],
                    borderRadius: BorderRadius.circular(20)),
                child: Row(
                  children: [
                    Text('-',
                        style: TextStyle(color: Colors.brown, fontSize: 24)),
                    SizedBox(width: 8),
                    Text('0',
                        style: TextStyle(color: Colors.black, fontSize: 18)),
                    SizedBox(width: 8),
                    Text('+',
                        style: TextStyle(color: Colors.brown, fontSize: 24)),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
