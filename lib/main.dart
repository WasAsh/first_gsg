import 'package:flutter/material.dart';
import 'package:flutter_app/page1.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: TabBar1(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          leading: Icon(
            Icons.arrow_back_ios  ,
            color: Colors.black,
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text('Edit Profile' , style: TextStyle(color: Colors.black ,fontSize: 18),),
          actions: [
            FlatButton(
              onPressed: (){},
              child: Text(
                'Save' ,
                style: TextStyle(
                    color: Colors.blue[400]
                ),
              ),
            )
          ],
        ),
        backgroundColor: Colors.white,
        extendBodyBehindAppBar: true,
        body: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 120) ,
              child: Center(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage('assets/imgs/11.png'),
                          fit: BoxFit.cover,
                          colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.3), BlendMode.dstATop),
                        ),
                        color: Colors.black ,
                      ),
                    ),
                    Icon(
                      Icons.camera_alt ,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 20,),
            Divider(color: Colors.blue[100], thickness: 1.1,),
            SizedBox(height: 15,),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                'Name',
                style: TextStyle(
                    fontSize: 15
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                'Waseem A. Akhras',
                style: TextStyle(
                  color: Colors.blue[400] ,
                  fontSize: 20,
                ),
              ),
            ),
            SizedBox(height: 15,),
            Divider(color: Colors.blue[100], thickness: 1.1,),
            SizedBox(height: 15,),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                'Address',
                style: TextStyle(
                    fontSize: 15
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                'Gaza, GazaStrip, Palestine',
                style: TextStyle(
                  color: Colors.blue[400] ,
                  fontSize: 20,
                ),
              ),
            ),
            SizedBox(height: 15,),
            Divider(color: Colors.blue[100], thickness: 1.1,),
            SizedBox(height: 15,),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                'Email',
                style: TextStyle(
                    fontSize: 15
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                'wasee.2132254@gmail.com',
                style: TextStyle(
                  color: Colors.blue[400] ,
                  fontSize: 20,
                ),
              ),
            ),
            SizedBox(height: 15,),
            Divider(color: Colors.blue[100], thickness: 1.1,),
            SizedBox(height: 15,),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                'Mobile',
                style: TextStyle(
                    fontSize: 15
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                '0019223232242',
                style: TextStyle(
                  color: Colors.blue[400] ,
                  fontSize: 20,
                ),
              ),
            ),
            SizedBox(height: 15,),
            Divider(color: Colors.blue[100], thickness: 1.1,),
            SizedBox(height: 15,),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                'Birthdate',
                style: TextStyle(
                    fontSize: 15
                ),
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '01-JAN-1995',
                      style: TextStyle(
                        color: Colors.blue[400] ,
                        fontSize: 20,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Icon(Icons.calendar_today , size: 15, color: Colors.blue[400],),
                    )
                  ],
                )
            ),
          ],
        )
    );
  }
}