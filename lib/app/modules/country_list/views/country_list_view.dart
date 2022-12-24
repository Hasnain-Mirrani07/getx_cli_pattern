import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/country_list_controller.dart';

class CountryListView extends GetView<CountryListController> {
  const CountryListView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CountryListView'),
        centerTitle: true,
      ),
      body: Obx(
        () => Column(
          children: [
            Expanded(
              child: FutureBuilder(
                future: controller.getCountry(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    CircularProgressIndicator();
                  } else {
                    return ListView.builder(
                      itemCount: controller.countryList.length,
                      itemBuilder: (context, index) {
                        print("Listview builder");
                        return Row(
                          children: [
                            Text(
                                "country Name: ${controller.countryList[index].name}")
                          ],
                        );
                      },
                    );
                  }
                  return ListView.builder(
                    itemCount: controller.countryList.length,
                    itemBuilder: (context, index) {
                      return Row(
                        children: [
                          Text(
                            "country Name: ${controller.countryList[index].name}",
                            style: TextStyle(color: Colors.black),
                          )
                        ],
                      );
                    },
                  );
                },
              ),
            ),
            GestureDetector(
              onTap: () {
                controller.isloginFu();
                controller.incrementt();
                print("${controller.count}");
                print("${controller.islogin}");
              },
              child: ListTile(
                title: Text("see detail "),
                trailing: Icon(Icons.arrow_downward),
              ),
            ),
            Visibility(
              visible: controller.islogin,
              child: Center(
                child: Text(
                  'CountryListView is working=> ${controller.count}  ${controller.islogin} ',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                controller.incrementt();
                controller.isloginFu();
                print("${controller.count}");
                print("${controller.islogin}");
                // printError(info: "${controller.count}"),
              },
              child: Text('increment'),
            )
          ],
        ),
      ),
    );
  }
}
