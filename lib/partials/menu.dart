import 'package:flutter/material.dart';

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  String activeMenu = "main";

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF0E2C4F),
      child: Column(
        children: [
          SizedBox(
            height: 100,
          ),
          Expanded(
            flex: 6,
            child: Column(
              children: [
                buildMenuItem(
                    icon: Icons.ac_unit,
                    text: "Main",
                    isActive: activeMenu == "main",
                    callback: () => setState(() {
                          activeMenu = "main";
                        })),
                buildMenuItem(
                    icon: Icons.login_outlined,
                    text: "Logs",
                    isActive: activeMenu == "logs",
                    callback: () => setState(() {
                          activeMenu = "logs";
                        })),
                buildMenuItem(
                    icon: Icons.settings,
                    text: "Setting",
                    isActive: activeMenu == "setting",
                    callback: () => setState(() {
                          activeMenu = "setting";
                        })),
                buildMenuItem(
                    icon: Icons.info,
                    text: "About",
                    isActive: activeMenu == "about",
                    callback: () => setState(() {
                          activeMenu = "about";
                        }))
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Align(
              child: Container(
                alignment: Alignment.bottomCenter,
                // height: 100,
                color: Color(0xFF0d2440),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget buildMenuItem({
    required IconData icon,
    required String text,
    required VoidCallback callback,
    bool isActive = false,
  }) {
    return InkWell(
      onTap: callback,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            AnimatedContainer(
              alignment: Alignment.centerLeft,
              duration: const Duration(milliseconds: 500),
              curve: Curves.fastOutSlowIn,
              height: 40,
              width: 3,
              decoration: BoxDecoration(
                  border: Border(
                      left: BorderSide(
                          color:
                              isActive ? Color(0xFFbde4ff) : Colors.transparent,
                          width: 4))),
            ),
            SizedBox(
              width: 30,
            ),
            Icon(
              icon,
              color: isActive ? Colors.white : Color(0xFF8693a3),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              text.toString(),
              style: TextStyle(
                  color: isActive ? Colors.white : Color(0xFF8693a3),
                  fontSize: 15),
            )
          ],
        ),
      ),
    );
  }
}
