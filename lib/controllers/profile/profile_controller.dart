
import 'package:get/get.dart';
import 'package:test_logrant/data/global_preferences.dart';

class ProfileController extends GetxController {

  late GlobalPreferences globalPrefs;
  late String nameUser;
  late String phoneUser;
  late String emailUser;
  late String dateRegisterUser;

  @override
  void onInit() {
    super.onInit();
    globalPrefs = GlobalPreferences();
    nameUser = globalPrefs.nameUser ?? '';
    phoneUser = globalPrefs.phoneUser ?? '';
    emailUser = globalPrefs.emailUser ?? '';
    dateRegisterUser = globalPrefs.dateRegister ?? '';
  }

}