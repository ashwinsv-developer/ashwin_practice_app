

import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../utills/constants.dart';
import '../utills/extensions.dart';

class DashBoardWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: Color(0Xff3462eb),

      padding: EdgeInsets.only(left: 16, top: 32, right: 16 ,bottom: 36),
      child:Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(CommonFunctions.rupeeFormatandSymbol(22650.51), style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),),
              Container(
                padding: EdgeInsets.only(left: 32, right: 28, top: 4, bottom: 4),
                decoration: BoxDecoration(color:Color(0Xff0818A8),borderRadius: BorderRadius.circular(16)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("0.97%",style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 12.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    )),
                    SizedBox(width: 2,),
                    Icon(Icons.arrow_drop_up, color: Colors.green,)
                  ],
                ),
              )
            ],
          ),
          SizedBox(height: 12,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(Constants.amount_value,style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 12.0,
                fontWeight: FontWeight.normal,
                color: Colors.white70,
              )),
              Text(Constants.since_last_purchase,style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 12.0,
                fontWeight: FontWeight.normal,
                color: Colors.white70,
              ))
            ],
          ),
          SizedBox(height: 16,),
          Divider(color: Colors.white70, thickness: 1,),
          SizedBox(height: 16,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(Constants.cash_balacne,style: TextStyle(
          fontFamily: 'Roboto',
              fontSize: 12.0,
              fontWeight: FontWeight.normal,
              color: Colors.white70,
          )),
              Text(Constants.metal_holding,style: TextStyle(
              fontFamily: 'Roboto',
              fontSize: 12.0,
              fontWeight: FontWeight.w500,
              color: Colors.white70,
              )),
            ],
          ),
          SizedBox(height: 12,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(CommonFunctions.rupeeFormatandSymbol(22265.64),style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  )),
                  SizedBox(width: 4,),
                  Icon(Icons.info_outline, color: Colors.white, size: 14)
                ],
              ),
              Text(CommonFunctions.rupeeFormatandSymbol(22265.64),style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ))
            ],
          ),
          SizedBox(
            height: 36,
          )
        ],
      ),

    );
  }

}