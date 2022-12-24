import 'package:datetime_picker_formfield_new/datetime_picker_formfield_new.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'package:get/get.dart';
import 'package:getx_cli/app/modules/reminder/controllers/notification_services.dart';
import 'package:getx_cli/main.dart';
import 'package:timezone/timezone.dart' as tz;

import '../controllers/reminder_controller.dart';

class ReminderView extends GetView<ReminderController> {
  ReminderView({Key? key}) : super(key: key);
  final timeController = TextEditingController();
  var h, m, s;

  // simple notification
  void showNotification() async {
    AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails("channelId", "channelName",
            priority: Priority.max, importance: Importance.high);
    NotificationDetails notificationDetails =
        NotificationDetails(android: androidNotificationDetails);
    await notiPlugin.show(0, "title", "body", notificationDetails);
  }

  // shedule notification

  Future<void> sheduledNotification() async {
    AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails("channelId", "channelName",
            priority: Priority.max, importance: Importance.high);
    NotificationDetails notificationDetails =
        NotificationDetails(android: androidNotificationDetails);
    DateTime sheduled =
        DateTime.now().add(Duration(hours: h, minutes: m, seconds: s));
    await notiPlugin.zonedSchedule(0, "Sheduled Time", "body after 5 sec",
        tz.TZDateTime.from(sheduled, tz.local), notificationDetails,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.wallClockTime,
        androidAllowWhileIdle: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                    child: NoteThumbnail(
                        id: 1,
                        color: Color(0xFFFF9C99),
                        title: "Note one",
                        content: "watter reminder")),
                SizedBox(
                  width: 15,
                ),
                Expanded(
                    child: NoteThumbnail(
                        id: 2,
                        color: Color(0xFF6fefb0),
                        title: "Note two",
                        content: "2nd watter reminder")),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
            Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                ElevatedButton(
                  onPressed: null,
                  child: Text("Simple Local Notification"),
                ),
                ElevatedButton(
                  onPressed: sheduledNotification,
                  child: Text("Simple Local Notification"),
                ),
                TextField(
                  onChanged: (value) {
                    s = value;
                    print("senonds=> $s");
                  },
                  keyboardType: TextInputType.number,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class NoteThumbnail extends StatefulWidget {
  final int id;
  final Color color;
  final String title;
  final String content;

  NoteThumbnail(
      {Key? key,
      required this.id,
      required this.color,
      required this.title,
      required this.content})
      : super(key: key);

  @override
  _NoteThumbnailState createState() => _NoteThumbnailState();
}

class _NoteThumbnailState extends State<NoteThumbnail> {
  DateTime selectedDate = DateTime.now();
  DateTime fullDate = DateTime.now();

  Future<DateTime> _selectDate(BuildContext context) async {
    final date = await showDatePicker(
        context: context,
        firstDate: DateTime(1900),
        initialDate: selectedDate,
        lastDate: DateTime(2100));
    if (date != null) {
      final time = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.fromDateTime(selectedDate),
      );
      if (time != null) {
        setState(() {
          fullDate = DateTimeField.combine(date, time);
        });
        // await _notificationService.scheduleNotifications(
        //     id: widget.id,
        //     title: widget.title,
        //     body: widget.content,
        //     time: fullDate);
      }
      return DateTimeField.combine(date, time);
    } else {
      return selectedDate;
    }
  }

  /// final NotificationService _notificationService = NotificationService();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: BoxDecoration(
        color: widget.color,
        borderRadius: BorderRadius.circular(10.0),
      ),
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(widget.content),
          const SizedBox(
            height: 80,
          ),
          Text(fullDate.toString()),
          const SizedBox(
            height: 15,
          ),
          ElevatedButton(
              onPressed: () => _selectDate(context),
              child: const Text("Add reminder"))
        ],
      ),
    );
  }
}
