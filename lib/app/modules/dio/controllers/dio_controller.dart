import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:getx_cli/app/models/jsonmodel';
import 'package:getx_cli/app/models/usermodel2.dart';
import 'package:getx_cli/app/models/usermodel3.dart';

class DioController extends GetxController {
  //https://api.tcscourier.com/production/track/v1/shipments/detail?consignmentNo=$trackingNo
  //2367188037
  int trackingNo = 2367188037;
  List<UserModel3> postlist = [];
  UserModel? userModel;
  final dio = Dio();
  Future<void> dioApi() async {
    try {
      var response =
          await dio.get("https://jsonplaceholder.typicode.com/users");

      List<dynamic> extreactedData = response.data;

      for (var i in extreactedData) {
        postlist.add(UserModel3.fromJson(i));
      }

      print("Dio Response==>${response.statusCode}");
      print("Dio Response==>${postlist[0].address!.zipcode}");
      print("Dio Response==>${postlist[0].address!.geo!.lat}");
      print("Dio Response==>${postlist[0].address!.geo!.lng}");
    } on DioError catch (e) {
      throw Exception("failed to Load");
    }
  }

  void onInit() {
    dioApi();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  // void increment() => count.value++;
}
