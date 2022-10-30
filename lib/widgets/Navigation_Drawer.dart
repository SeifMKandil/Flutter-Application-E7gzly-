import 'package:flutter/material.dart';
import 'package:sports_registration/Pages/Insights.dart';
import 'package:sports_registration/Pages/my_Fields.dart';
import 'package:sports_registration/Pages/Settings.dart';
import'package:sports_registration/widgets/drawer_item.dart';
class NavigationDraw extends StatelessWidget{
  const NavigationDraw({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Drawer(
        child:Material(
          color:Color(0xFF303030),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(24.0,80,24,0),
            child: Column(
              children:[
              
                headerWidget(),
                  SizedBox(height: 20,),
                DrawerItem(name: 'My Fields' 
                , onPressed: ()=>onItemPressed(context,index:0),
                ),
                DrawerItem(name: 'Insights' 
                , onPressed: ()=>onItemPressed(context,index:1),
                ),
                DrawerItem(name: 'Account Settings' 
                , onPressed: ()=>onItemPressed(context,index:2),
                ),
                TextButton(
                    style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 232, 25, 25)),
                        ),
                    onPressed: () { },
                    child: Text('SignOut'),
                  )
              ]
            ),
          ),
      ) ,
      
    );

  }
  void onItemPressed(BuildContext context,{required int index}){
    Navigator.pop(context);
    switch(index){
        case 0:
        Navigator.push(context,MaterialPageRoute(builder: (context)=> const MyFields()));
        break;
        case 1:
        Navigator.push(context,MaterialPageRoute(builder: (context)=> const Insights()));
        break;
      case 2:
        Navigator.push(context,MaterialPageRoute(builder: (context)=> const Settings()));
        break;
    }
  }
  Widget headerWidget() {
    const url = 'C:/Users/Dell/Downloads/app.png';
    return Row(
      children: [
        
        const SizedBox(width: 20,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text('Bussiness Owner Name', style: TextStyle(fontSize: 14, color: Colors.white)),
            SizedBox(height: 10,),
            Text('Owner@email.com', style: TextStyle(fontSize: 14, color: Colors.white))
          ],
        )
      ],
    );

  }
}
