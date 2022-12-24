import 'package:http/http.dart' as http;
import 'package:get/get.dart';

import '../country_model.dart';

class CountryProvider extends GetConnect {
  Future<void> getCountry() async {
    final response =
        await http.get(Uri.parse('https://disease.sh/v3/covid-19/countries'));
    if (response.statusCode == 200) {
      print(response.body);
      print("response.body");
    }
  }
}
