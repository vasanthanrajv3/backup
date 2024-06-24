import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage extends GetxService {
  RxString token = ''.obs;
  RxString userId = ''.obs;
  RxString firstName = ''.obs;
  RxString lastName = ''.obs;
  RxString email = ''.obs;
  RxString image = ''.obs;
  RxBool newUser = true.obs;
  RxString colorScheme = ''.obs;

  @override
  void onInit() {
    fetchLocalUserDetails();
    super.onInit();
  }

  void fetchLocalUserDetails() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    token = RxString(preferences.getString('token') ?? '');
    userId = RxString(preferences.getString('userId') ?? '');
    firstName = RxString(preferences.getString('firstName') ?? '');
    lastName = RxString(preferences.getString('lastName') ?? '');
    email = RxString(preferences.getString('email') ?? '');
    image = RxString(preferences.getString('image') ?? '');
    colorScheme = RxString(preferences.getString('colorScheme') ?? 'Light');
    newUser = RxBool(preferences.getBool('newUser') ?? true);
  }

  setNewUserData({
    required bool newUserLocal,
  }) {
    newUser = RxBool(newUserLocal);
  }

  setColorSchemeData({
    required String colorSchemeLocal,
  }) {
    colorScheme = RxString(colorSchemeLocal);
  }

  setLocalData({
    required String tokenLocal,
  }) {
    token = RxString(tokenLocal);
  }

  setUserDetails({
    required String firstNameLocal,
    required String lastNameLocal,
    required String emailLocal,
    required String imageLocal,
    required String userIdLocal,
  }) {
    firstName = RxString(firstNameLocal);
    lastName = RxString(lastNameLocal);
    email = RxString(emailLocal);
    image = RxString(imageLocal);
    userId = RxString(userIdLocal);
  }
}
