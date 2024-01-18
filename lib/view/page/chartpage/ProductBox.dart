import 'package:FoodCycle/controllers/ChartController.dart';
import 'package:FoodCycle/view/widgets/text/NormatText.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ProductBox extends StatelessWidget {
  final images;
  final name;
  final price;
  final jumlah;
  final increase;
  final decrease;
  final selected;
  final selectedTap;

  ProductBox({
    super.key,
    required this.name,
    required this.images,
    required this.jumlah,
    required this.price,
    required this.decrease,
    required this.increase,
    required this.selected,
    required this.selectedTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: selectedTap,
          child: Container(
            width: 22,
            height: 22,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                border: Border.all(
                    width: 1,
                    color: selected ? Color(0xff009688) : Color(0xffE8E8E8))),
          ),
        ),
        SizedBox(
          width: 15,
        ),
        Expanded(
            child: Container(
                height: 110,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                        width: 1,
                        color:
                            selected ? Color(0xff009688) : Color(0xffE8E8E8))),
                child: Row(
                  children: [
                    Container(
                      width: 120,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(images), fit: BoxFit.cover),
                          color: Color(0xffE8E8E8),
                          borderRadius: BorderRadius.horizontal(
                              left: Radius.circular(10))),
                    ),
                    Expanded(
                        child: Padding(
                      padding: EdgeInsets.all(13),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            NormalText(
                                text: name,
                                size: 12.0,
                                weight: FontWeight.w500),
                            SizedBox(
                              height: 5,
                            ),
                            NormalText(
                              text: "Rp " + price.toInt().toString(),
                              size: 12.0,
                              weight: FontWeight.w700,
                              color: Color(0xff009688),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              padding: EdgeInsets.all(5),
                              width: 100,
                              height: 30,
                              decoration: BoxDecoration(
                                  color: Color(0xffE8E8E8),
                                  borderRadius: BorderRadius.circular(5)),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    InkWell(
                                      onTap: decrease,
                                      child: Container(
                                        alignment: Alignment.center,
                                        width: 20,
                                        decoration: BoxDecoration(
                                          color: jumlah <= 1
                                              ? Color(0xffa5a5a5)
                                              : Color(0xffFEBF4B),
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        child: Icon(
                                          Iconsax.minus,
                                          size: 12,
                                        ),
                                      ),
                                    ),
                                    NormalText(
                                      text: jumlah.toString(),
                                      size: 12.0,
                                      weight: FontWeight.w700,
                                      color: Color(0xff009688),
                                    ),
                                    InkWell(
                                      onTap: increase,
                                      child: Container(
                                        alignment: Alignment.center,
                                        width: 20,
                                        decoration: BoxDecoration(
                                          color: Color(0xffFEBF4B),
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        child: Icon(
                                          Iconsax.add,
                                          size: 12,
                                        ),
                                      ),
                                    )
                                  ]),
                            ),
                          ]),
                    ))
                  ],
                )))
      ],
    );
  }
}
