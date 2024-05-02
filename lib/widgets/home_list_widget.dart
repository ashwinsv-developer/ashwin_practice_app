import 'package:ashwin_practice_app/utills/extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../model/list_item_data.dart';
import '../utills/constants.dart';

class HomeListWidget extends StatelessWidget {
  List<ListItemData> itemList;

  HomeListWidget({required this.itemList});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 138 * (itemList.length).toDouble(),
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: itemList.length,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return itemWidget(itemList[index]);
          }),
    );
  }

  Widget itemWidget(ListItemData item) {
    return Container(
      height: 121,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(color: Colors.grey.shade300, spreadRadius: 1, blurRadius: 6)
      ], color: Colors.white, borderRadius: BorderRadius.circular(4)),
      margin: const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
      padding: const EdgeInsets.only(left: 12, right: 12, top: 12, bottom: 12),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                      child: SvgPicture.asset(
                    'assets/images/metal.svg',
                    semanticsLabel: 'My SVG Image',
                    color: item.colour,
                    height: 36,
                    width: 36,
                  )),
                  const SizedBox(
                    width: 8,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(item.name,
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                            color: item.colour,
                          )),
                      const SizedBox(
                        height: 4,
                      ),
                      Text("${item.qty} oz",
                          style: const TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 12.0,
                            fontWeight: FontWeight.normal,
                            color: Colors.grey,
                          ))
                    ],
                  )
                ],
              ),
              Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                        CommonFunctions.rupeeFormatandSymbol(
                            item.pricePerQty * item.qty),
                        style: const TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            letterSpacing: 0.5)),
                    const SizedBox(
                      height: 4,
                    ),
                    Text("${item.purity} %",
                        style: const TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 12.0,
                          fontWeight: FontWeight.normal,
                          color: Colors.grey,
                        )),
                  ])
            ],
          ),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(Constants.metal_price,
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 12.0,
                        fontWeight: FontWeight.normal,
                        color: Colors.grey,
                      )),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(CommonFunctions.rupeeFormatandSymbol(item.pricePerQty),
                      style: const TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 12.0,
                        fontWeight: FontWeight.normal,
                        color: Colors.grey,
                      ))
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text(Constants.change,
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 12.0,
                        fontWeight: FontWeight.normal,
                        color: Colors.grey,
                      )),
                  const SizedBox(height: 4,),
                  Text(
                    item.change.toString(),
                    style: TextStyle(
                      color: item.change > 0 ? Colors.green : Colors.red,
                      fontFamily: 'Roboto',
                      fontSize: 12.0,
                      fontWeight: FontWeight.normal,
                    ),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
