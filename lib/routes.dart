import 'package:admin/core/constant/routes.dart';
import 'package:admin/core/middleware/middleware.dart';
import 'package:admin/view/screens/auth/forgetpassord/checkemail.dart';
import 'package:admin/view/screens/auth/forgetpassord/resetpassword.dart';
import 'package:admin/view/screens/auth/forgetpassord/successresetpassword.dart';
import 'package:admin/view/screens/auth/forgetpassord/verifycode.dart';
import 'package:admin/view/screens/auth/login.dart';
import 'package:admin/view/screens/auth/signup.dart';
import 'package:admin/view/screens/auth/successsignup.dart';
import 'package:admin/view/screens/auth/verifycodesignup.dart';
import 'package:admin/view/screens/categories/categoriesadd.dart';
import 'package:admin/view/screens/categories/categoriesedit.dart';
import 'package:admin/view/screens/categories/categoriesview.dart';
import 'package:admin/view/screens/home/home.dart';
import 'package:admin/view/screens/items/itemsadd.dart';
import 'package:admin/view/screens/items/itemsedit.dart';
import 'package:admin/view/screens/items/itemsview.dart';
import 'package:admin/view/screens/orders/adminordershome.dart';
import 'package:admin/view/screens/orders/ordersdetails.dart';
import 'package:admin/view/screens/selectlanguage.dart';
import 'package:get/get.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(
      name: "/",
      page: () => const SelectLanguage(),
      middlewares: [MiddleWare()]),
// GetPage(name: "/", page: ()=>const TestView()),
//onboarding
  GetPage(name: AppRoutes.login, page: () => const Login()),
  GetPage(name: AppRoutes.signup, page: () => const SignUp()),
  GetPage(name: AppRoutes.successsignup, page: () => const SucessSignUp()),
  GetPage(
      name: AppRoutes.verifycodesignup, page: () => const VerifyCodeSignUp()),

  //forgetten password
  GetPage(
      name: AppRoutes.successresetpassword,
      page: () => const SucessResetPassword()),
  GetPage(name: AppRoutes.forgetpassword, page: () => const ForgetPassword()),
  GetPage(name: AppRoutes.resetpassword, page: () => const ResetPassword()),
  GetPage(name: AppRoutes.verifycode, page: () => const VerifyCode()),
  //Home
  GetPage(name: AppRoutes.homepage, page: () => const Home()),
  //Categories
  GetPage(name: AppRoutes.categoriesView, page: () => const CategoriesView()),
  GetPage(name: AppRoutes.categoriesAdd, page: () => const CategoriesAdd()),
  GetPage(name: AppRoutes.categoriesEdit, page: () => const CategoriesEdit()),
  //Items
  GetPage(name: AppRoutes.itemsView, page: () => const ItemsView()),
  GetPage(name: AppRoutes.itemsAdd, page: () => const ItemsAdd()),
  GetPage(name: AppRoutes.itemsEdit, page: () => const ItemsEdit()),
  //Orders
  GetPage(name: AppRoutes.ordersHomeScreen, page:() =>const HomeScreen()),
  GetPage(name: AppRoutes.ordersDetails, page:() =>const OrderDetails())

];
