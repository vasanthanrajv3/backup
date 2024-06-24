import 'package:get/get.dart';

import '../data/provider/authentication_api.dart';
import '../data/provider/post_api.dart';
import '../services/network_status_service.dart';
import 'local_storage.dart';

class DependencyInjection {
  static void init() async {
    Get.put<GetConnect>(GetConnect());

    //local storage service
    Get.put<LocalStorage>(LocalStorage(), permanent: true);

    //providers
    Get.put<AuthenticationAPI>(AuthenticationAPI());
    Get.put<PostAPI>(PostAPI());

    //(creating issues in iOS so loading only for android)
    if(GetPlatform.isAndroid) {
      Get.put<NetworkStatusService>(NetworkStatusService(), permanent: true);
    }

  }
}
