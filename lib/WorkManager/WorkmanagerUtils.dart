import 'package:flutter/cupertino.dart';
import 'package:workmanager/workmanager.dart';

class WorkManagerUtils {
  static String simplePeriodicTask = "simplePeriodicTask";
  static String oneTimeTask = "oneTimeTask";

  void callPeriodicTask(
      int timeDuration, Map<String, dynamic> data, String taskName) {
    Workmanager().registerPeriodicTask(
      taskName,
      simplePeriodicTask,
      frequency: Duration(minutes: timeDuration),
      inputData: data,
    );
  }

  void callBackgroundTask(Map<String, dynamic> data, String taskName) {
    Workmanager().registerOneOffTask(taskName, oneTimeTask, inputData: data);
  }
}
