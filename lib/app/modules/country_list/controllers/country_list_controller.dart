import 'dart:convert';

import 'package:get/get.dart';
import 'package:getx_cli/app/modules/country_list/country_model.dart';
import 'package:getx_cli/app/modules/country_list/countrymodel.dart';
import 'package:http/http.dart' as http;

class CountryListController extends GetxController {
  List<CountryModel> countryList = [];

  //TODO: Implement CountryListController

  Future<List<CountryModel>> getCountry() async {
    final Response =
        await http.get(Uri.parse('https://disease.sh/v3/covid-19/countries'));
    if (Response.statusCode == 200) {
      print("${Response.statusCode}");

      var rawdata = jsonDecode(Response.body.toString());
      for (var i in rawdata) {
        // countryList.add(CountryModel(name: name, img: img));
        CountryModel(name: i['country'], img: i['countryInfo']['flag']);
      }
    }
    return countryList;

    // for (Map i in rawdata) {
    //   countryList.add(Country.fromJson(rawdata[i]));
    // }

    print(countryList[0].toString());
  }

  var count = 0.obs;
  void incrementt() {
    count++;
  }

  bool islogin = true;
  void isloginFu() {
    islogin = !islogin;
  }

  @override
  void onInit() {
    super.onInit();
    getCountry();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
