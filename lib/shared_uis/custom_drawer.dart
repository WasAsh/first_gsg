import 'package:flutter/material.dart';


Widget customDrawer({Function fun1 , Function fun2 , Function fun3}){
  return Drawer(
    child: Column(
      children: [
        UserAccountsDrawerHeader(
          accountEmail: Text('Wasee.2122@gmail.com'),
          accountName: Text('Waseem Ashraf'),
          currentAccountPicture: CircleAvatar(
            backgroundImage: AssetImage('assets/imgs/11.png'),
          ),
        ),
        ListTile(
          onTap: (){
            fun1();
          },
          title: Text('All Tasks'),
          subtitle: Text('go to All tasks screen'),
        ),
        ListTile(
          onTap: (){
            fun2();
          },
          title: Text('Complete Tasks'),
          subtitle: Text('go to completed tasks screen'),
        ),
        ListTile(
          onTap: (){
            fun3();
          },
          title: Text('InComplete Tasks'),
          subtitle: Text('go to uncompleted tasks screen'),
        ),
      ],
    ),
  );
}