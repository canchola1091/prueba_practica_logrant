
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:test_logrant/views/people/favorite_person_view.dart';
import 'package:test_logrant/views/login/login_view.dart';
import 'package:test_logrant/views/people/people_view.dart';
import 'package:test_logrant/views/profile/profile_view.dart';

class RoutesApp {
  static List<GetPage> routes = [
    GetPage(
      name: '/login_view',
      page: () => const LoginView()
    ),
    GetPage(
      name: '/people_view',
      page: () => const PeopleView()
    ),
    GetPage(
      name: '/favorite_person_view',
      page: () => const FavoritePersonView()
    ),
    GetPage(
      name: '/profile_view',
      page: () => const ProfileView()
    ),
  ];
}
