import 'dart:async';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getx_cli/app/models/jsonmodel';

import '../controllers/dio_controller.dart';

class DioView extends GetView<DioController> {
  const DioView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DioView'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          ElevatedButton(
            child: Text("DioApi"),
            onPressed: () {
              controller.dioApi();
            },
          ),
          // Center(
          //   child: Text(
          //     'DioView is working',
          //     style: TextStyle(fontSize: 20),
          //   ),
          // ),

          Expanded(
            child: FutureBuilder(
              future: controller.dioApi(),
              builder: (context, snapshot) {
                if (ConnectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text(snapshot.error.toString());
                } else {
                  return ListView.builder(
                    itemCount: controller.postlist.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Text(controller.postlist[index].id.toString()),
                          Text("name ${controller.postlist[index].email}"),
                          Text(
                              "name ${controller.postlist[index].address!.zipcode}"),
                          Text(
                              "name ${controller.postlist[index].address!.geo!.lat}"),
                          Text(
                              "name ${controller.postlist[index].address!.geo!.lng}"),
                        ],
                      );
                    },
                  );
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
