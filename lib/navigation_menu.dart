import 'package:flutter/material.dart';
import 'package:flutter_task_1/constants/colors.dart';
import 'package:flutter_task_1/features/pages/meet_up_page/meet_up_page.dart';
import 'package:iconsax/iconsax.dart';


class NavigationMenu extends StatefulWidget {
  const NavigationMenu({super.key,});

  @override
  State<NavigationMenu> createState() => _NavigationMenuState();
}

class _NavigationMenuState extends State<NavigationMenu> {

  int _currentIndex = 0;
  void _navigateBottomBar(int index){
    setState(() {
      _currentIndex = index;
    });
  }
  List<Widget> body =  [
    Container(color: Colors.red),
    Container(color: Colors.grey),
    const MeetUpScreen(),
    Container(color: Colors.green),
    Container(color: Colors.purple),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        elevation: 4,
        selectedItemColor: kIconColor,
        unselectedItemColor: kLabelColor,
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        onTap: _navigateBottomBar,
        items: const [
          BottomNavigationBarItem(icon: Icon(Iconsax.home_24,),label: "Home",backgroundColor: kWhiteColor,),
          BottomNavigationBarItem(icon: Icon(Iconsax.category_24,),label: "Prolet",backgroundColor: kWhiteColor),
          BottomNavigationBarItem(icon: Icon(Icons.handshake,),label: "Meetup",backgroundColor: kWhiteColor),
          BottomNavigationBarItem(icon: Icon(Iconsax.folder_cloud,),label: "Explore",backgroundColor: kWhiteColor),
          BottomNavigationBarItem(icon: Icon(Iconsax.user_octagon,),label: "Account",backgroundColor: kWhiteColor),
        ],
      ),
      body: Container(
        child: body[_currentIndex],
      ),
    );
  }
}
