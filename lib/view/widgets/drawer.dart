

import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(60.0),
        bottomRight: Radius.circular(60.0),
      ),
      child: Drawer(
        width: 249,
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
              child: Column(
                children: <Widget>[
                  Align(
                    alignment: Alignment.topLeft,
                    child: Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.arrow_back_ios_new_sharp),
                          onPressed: () {
                            Navigator.of(context).pop(); 
                          },
                        ),
                        Text("Back" ,style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500),)
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: CircleAvatar(
                      radius: 40.0,
                      backgroundImage:
                          AssetImage('assets/avatar.png'), 
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Nate Samson',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 4.0),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'nate@email.com',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.history),
                    title: Text('History',
                     style: TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.w500,
                      ),),
                    onTap: () {
                    },
                  ),
                  Divider(
                    color: const Color.fromARGB(255, 190, 190, 190),
                    height: 1,
                  ),
                  ListTile(
                    leading: Icon(Icons.report_problem),
                    title: Text('Complain'
                    ,
                     style: TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.w500,
                      ),),
                    onTap: () {
                    },
                  ),
                  Divider(
                    color: const Color.fromARGB(255, 190, 190, 190),
                    height: 1,
                  ),
                  ListTile(
                    leading: Icon(Icons.card_giftcard),
                    title: Text('Referral',
                     style: TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.w500,
                      ),),
                    onTap: () {
                    },
                  ),
                  Divider(
                    color: const Color.fromARGB(255, 190, 190, 190),
                    height: 1,
                  ),
                  ListTile(
                    leading: Icon(Icons.info),
                    title: Text('About Us',
                     style: TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.w500,
                      ),),
                    onTap: () {
                    },
                  ),
                  Divider(
                    color: const Color.fromARGB(255, 190, 190, 190),
                    height: 1,
                  ),
                  ListTile(
                    leading: Icon(Icons.settings),
                    title: Text('Settings',
                     style: TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.w500,
                      ),),
                    onTap: () {
                    },
                  ),
                  Divider(
                    color: const Color.fromARGB(255, 190, 190, 190),
                    height: 1,
                  ),
                  ListTile(
                    leading: Icon(Icons.help),
                    title: Text('Help and Support',
                     style: TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.w500,
                      ),),
                    onTap: () {
                    },
                  ),
                  Divider(
                    color: const Color.fromARGB(255, 190, 190, 190),
                    height: 1,
                  ),
                  ListTile(
                    leading: Icon(Icons.logout),
                    title: Text('Logout',
                     style: TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.w500,
                      ),  ),
                    onTap: () {
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

