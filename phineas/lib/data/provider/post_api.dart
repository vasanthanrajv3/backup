import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../utils/constant.dart';
import '../../utils/local_storage.dart';
import '../../widgets/snackBars.dart';

class PostAPI {
  final GetConnect connect = Get.find<GetConnect>();
  final LocalStorage localStorage = Get.find<LocalStorage>();

  Future<dynamic> postQuestion(body) async {
    var decodedBody = jsonEncode(body);

    print(baseUrl());

    try {
      final http.Response response = await http.post(
        Uri.parse('${baseUrl()}$postMessage'),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${localStorage.token}',
        },
        body: decodedBody,
      );

      if (response.statusCode == 200) {
        var result = response.body;
        return result;
      } else {
        print('Getting Survey Failed: ${response.body}');
        SnackNotification.error(
          message: jsonDecode(response.body)['detail'],
        );
        return null;
      }
    } catch (e) {
      print('Exception occurred: ');
      print(e);
      SnackNotification.error(
        message: e,
      );
      return null;
    }
  }
}
