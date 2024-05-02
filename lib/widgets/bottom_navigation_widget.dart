import 'package:flutter/material.dart';
import '../model/bottom_navi_data.dart';

class BottomNavigationWidget extends StatelessWidget {
  List<BottomNavData> listData;
  final void Function(List<BottomNavData> bottomData) onDataReceived;
  BottomNavigationWidget(
      {required this.listData, required this.onDataReceived});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: listData.length,
        shrinkWrap: true,
        itemBuilder: (context, i) {
          return GestureDetector(
              onTap: () {
                for (var j in listData) {
                  if (j.position == i) {
                    listData[i].isSelected = true;
                  } else {
                    listData[j.position].isSelected = false;
                  }
                }
                onDataReceived(listData);
              },
              child: bottomIcon(
                  listData[i].title,
                  listData[i].iconNmae,
                  listData[i].isSelected,
                  MediaQuery.of(context).size.width / listData.length));
        });
  }

  Widget bottomIcon(
      String title, IconData icon, bool isSelected, double width) {
    return title.isEmpty
        ? SizedBox(
            width: width,
            child: Icon(
              icon,
              color: const Color(0Xff3462eb),
              size: 36,
            ))
        : SizedBox(
            width: width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  icon,
                  color: isSelected ? const Color(0Xff3462eb) : Colors.grey,
                  size: 24,
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  title,
                  style: TextStyle(
                      color:
                          isSelected ? const Color(0Xff3462eb) : Colors.grey),
                )
              ],
            ),
          );
  }
}