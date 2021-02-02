import 'package:flutter/material.dart';
class DrawerList extends StatelessWidget {

  final Function onTap;
  const DrawerList({this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width*0.6,
      child: Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DrawerHeader(
                decoration:BoxDecoration(
                  color: Colors.blue
                ),
             child: Padding(
               padding: const EdgeInsets.all(8.0),
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    child: CircleAvatar(
                      backgroundImage: AssetImage("assets/images/10.png"),
                    ),
                  ),
                  SizedBox(height: 15,),
                  //verticalSizedBox(context, 15.0),
                  Text('Mohamed Hany',style:TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18
                  ),),
                  SizedBox(height: 3,),
                  Text('mohamedhany@gmail.com',style: TextStyle(
                    color: Colors.white,
                    fontSize: 15
                  ),)
                ],
            ),
             ),),
            SizedBox(height: 10,),
            ListTile(
              leading: Icon(Icons.poll,size: 30,),
              title: Text('Employees',style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18
              ),),
              onTap: ()=>onTap(context,0),
            ),
            SizedBox(height: 10,),
            ListTile(
              leading: Icon(Icons.notifications,size: 30,),
              title: Text('Notification',style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18
              ),),
              onTap: ()=>onTap(context,1),
            ),
            SizedBox(height: 10,),
            ListTile(
              leading: Icon(Icons.logout,size: 30,),
              title: Text('Logout',style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18
              ),),
              onTap: ()=>onTap(context,2),
            ),
          ],
        ),
      ),
    );
  }
}

/*
             list[index],
            drawer: DrawerList(
              onTap:(context,i)
            {
              setState(() {
                index=i;
                Navigator.pop(context);
              });
            },
            ),
  */