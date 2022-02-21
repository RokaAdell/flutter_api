import 'package:flutter/material.dart';
class SideMenu extends StatelessWidget {
  const SideMenu({Key? key}) : super(key: key);


 // Function onSideMenuItemClick;
 // SideMenu(this.onSideMenuItemClick);
  @override
  Widget build(BuildContext context) {
    List<SideMenuItem> sideMenuList = [
      SideMenuItem(SideMenuItem.CATEGORIES, "Categories", Icons.view_list_rounded),
      SideMenuItem(SideMenuItem.SETTINGS, "Settings", Icons.settings),
    ];
    return Drawer(
      child: Column(
        children: [
          Container(
           // color: Theme.of(context).backgroundColor.orange,
            color: Colors.orange.shade800,
             
            padding: const EdgeInsets.symmetric(vertical: 50),
            child: const Center(
              child: Text(
                'Take a seat',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    fontFamily: 'Courgette'),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return SideMenuWidget(sideMenuList[index]);
              },
              itemCount: sideMenuList.length,
              
            ),
            
          )
        ],
      ),
    );
  }
}

class SideMenuItem {
  static const CATEGORIES = 'Cats';
  static const SETTINGS = 'settings';
 
  String id;
  String title;
  IconData iconData;
  SideMenuItem(this.id, this.title, this.iconData);
}

class SideMenuWidget extends StatelessWidget {
  final SideMenuItem sideMenuItem;
  //Function onSideMenuItemClick;
  SideMenuWidget(this.sideMenuItem);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
       // Navigator.of(context).pushNamed(sideMenuItem.routeName);
       // onSideMenuItemClick(sideMenuItem);
      },
      child: ListTile(
              contentPadding: const EdgeInsets.only(top: 10, left: 10),
               dense: true,
              visualDensity: const VisualDensity(horizontal: 0, vertical: -3),
              leading: Icon(
                sideMenuItem.iconData,
                size: 35,
                color: Colors.black,
              ),
              title: Align(
                child: Text(
                  sideMenuItem.title,
                  style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Courgette'),
                ),
                alignment: const Alignment(-1.2, 0),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
    );
  }
}