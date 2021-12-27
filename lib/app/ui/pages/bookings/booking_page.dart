import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:fixy/app/ui/pages/bookings/accepted_booking.dart';
import 'package:fixy/app/ui/pages/bookings/inprogress_booking.dart';
import 'package:fixy/app/ui/pages/bookings/new_booking.dart';
import 'package:flutter/material.dart';

class BookingsPage extends StatelessWidget {
  const BookingsPage({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: DefaultTabController(
          length: 3,
          child: Column(
            children: <Widget>[
              ButtonsTabBar(
                backgroundColor: Colors.red,
                contentPadding: const EdgeInsets.only(
                    left: 25, right: 25, top: 5, bottom: 5),
                unselectedBackgroundColor: Colors.grey[300],
                unselectedLabelStyle: const TextStyle(color: Colors.black),
                labelStyle: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
                tabs: const [
                  Tab(
                    text: "New",
                  ),
                  Tab(
                    text: "Accepted",
                  ),
                  Tab(
                    text: "In Progress",
                  ),
                ],
              ),
              const Expanded(
                child: TabBarView(
                  children: <Widget>[
                    NewBooking(),
                    AcceptedBooking(),
                    InProgressBooking(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
