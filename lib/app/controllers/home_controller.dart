import 'package:fixy/app/data/services/icon_broken.dart';
import 'package:fixy/app/ui/pages/chats_page.dart';
import 'package:fixy/app/ui/pages/profile_page.dart';
import 'package:fixy/app/ui/pages/home_page.dart';
import 'package:fixy/app/ui/pages/bookings/booking_page.dart';
import 'package:fixy/app/ui/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:geocode/geocode.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:location/location.dart';

class HomeController extends GetxController {
  int currentIndex = 0;
  List<String> titles = ["Fixy", "Fixy", 'Chats', "Profile"];
  List<Widget> screens = [
    HomePage(),
    const BookingsPage(),
    const ChatsPage(),
    const ProfilePage(),
  ];
  List<BottomNavigationBarItem> bottomItem = [
    BottomNavigationBarItem(
        icon: Icon(
          IconBroken.Home,
          color: Get.isDarkMode ? whiteColor : blackColor,
        ),
        label: '',
        activeIcon: const Text('Home')),
    BottomNavigationBarItem(
        icon: Icon(
          IconBroken.Work,
          color: Get.isDarkMode ? whiteColor : blackColor,
        ),
        label: '',
        activeIcon: const Text('Workers')),
    BottomNavigationBarItem(
        icon: Icon(
          IconBroken.Chat,
          color: Get.isDarkMode ? whiteColor : blackColor,
        ),
        label: '',
        activeIcon: const Text('Chats')),
    BottomNavigationBarItem(
        icon: Icon(
          IconBroken.Profile,
          color: Get.isDarkMode ? whiteColor : blackColor,
        ),
        label: '',
        activeIcon: const Text('Profile')),
  ];

  void changebottomnavbar(int index) {
    currentIndex = index;
    update();
  }

  bool isClick = false;
  void changeCommentArea(bool isClicked) {
    isClick = !isClicked;
    update();
  }

  DateTime dateTime = DateTime.now();
  String startTime = DateFormat("hh:mm a").format(DateTime.now()).toString();
  void getDataFromUser(context) async {
    DateTime? _picker = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2021),
        lastDate: DateTime(2030));

    if (_picker != null) {
      dateTime = _picker;
    } else {}
    update();
  }

  Future<LocationData?> getLocation() async {
    Location location = new Location();
    LocationData locationData;

    bool serviceEnabled;
    PermissionStatus permissionGranted;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return null;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return null;
      }
    }

    locationData = await location.getLocation();

    return locationData;
  }

  Future<String> getAddress(double? lat, double? lang) async {
    if (lat == null || lang == null) return "";
    GeoCode geoCode = GeoCode();
    Address address =
        await geoCode.reverseGeocoding(latitude: lat, longitude: lang);

    return "${address.streetAddress}, ${address.city}, ${address.countryName}";
  }

  LocationData? currentLocation;
  String address = "";
  void getMyLocation() {
    getLocation().then((value) {
      LocationData? location = value;
      getAddress(location?.latitude, location?.longitude).then((value) {
        currentLocation = location;
        address = value;
        update();
      });
    });
    update();
  }
}
