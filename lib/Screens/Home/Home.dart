import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pet_app/Screens/Home/Account.dart';
import 'package:pet_app/Screens/Home/ChatPage.dart';
import 'package:pet_app/Screens/Home/HomePage.dart';
import 'package:pet_app/Screens/Home/MyAds.dart';
import 'package:pet_app/Screens/Home/SellPage.dart';
import 'package:pet_app/Screens/Widget/Color_Circle.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

PageController pageController;

class _HomeState extends State<Home> {
  int currentIndex = 0;
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (int index) {
          setState(() {
            currentIndex = index;
          });
          _pageController.animateToPage(index,
              duration: Duration(milliseconds: 200), curve: Curves.ease);
        },
        showUnselectedLabels: true,
        unselectedItemColor: Colors.blue[100],
        fixedColor: Colors.grey,
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
              backgroundColor: Colors.white,
              icon: Icon(Icons.home),
              // ignore: deprecated_member_use
              title: new Text(
                'Home',
              )),
          BottomNavigationBarItem(
              backgroundColor: Colors.white,
              icon: Icon(Icons.home),
              // ignore: deprecated_member_use
              title: new Text(
                'Home',
              )),
          BottomNavigationBarItem(
              backgroundColor: Colors.white,
              icon: Icon(Icons.home),
              // ignore: deprecated_member_use
              title: new Text(
                'Home',
              )),
          BottomNavigationBarItem(
              backgroundColor: Colors.white,
              icon: Icon(Icons.home),
              // ignore: deprecated_member_use
              title: new Text(
                'Home',
              )),
          BottomNavigationBarItem(
            backgroundColor: Colors.white,
            icon: Icon(Icons.home),
            // ignore: deprecated_member_use
            title: new Text(
              'Home',
            ),
          ),
        ],
      ),
      body: PageView(
        controller: _pageController,
        children: <Widget>[
          HomePage(),
          ChatPage(),
          SellPage(),
          MyAdsPage(),
          Account(),
        ],
        onPageChanged: (int index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}

//     Scaffold(
//       body: PageView(
//         children: [
//           Container(
//             child: HomePage(),
//           ),
//           Container(child: ChatPage()),
//           Container(child: SellPage()),
//           Container(child: MyAdsPage()),
//           Container(
//             child: Account(),
//           )
//         ],
//         controller: pageController,
//         physics: NeverScrollableScrollPhysics(),
//         onPageChanged: onPageChanged,
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//       bottomNavigationBar: CupertinoTabBar(
//         backgroundColor: Colors.white,
//         items: <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//               icon: Icon(Icons.home,
//                   color: (_page == 0) ? Colors.blue : Colors.grey),
//               backgroundColor: Colors.white),
//           BottomNavigationBarItem(
//               icon: Icon(Icons.search,
//                   color: (_page == 1) ? Colors.blue : Colors.grey),
//               backgroundColor: Colors.white),
//           BottomNavigationBarItem(
//               icon: ColorCircle(), backgroundColor: Colors.white),
//           BottomNavigationBarItem(
//               icon: Icon(Icons.star,
//                   color: (_page == 3) ? Colors.blue : Colors.grey),
//               backgroundColor: Colors.white),
//           BottomNavigationBarItem(
//               icon: Icon(Icons.person,
//                   color: (_page == 4) ? Colors.blue : Colors.grey),
//               backgroundColor: Colors.white),
//         ],
//         onTap: navigationTapped,
//         currentIndex: _page,
//       ),
//     );
//   }
// }
