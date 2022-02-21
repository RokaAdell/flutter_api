import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class Venues extends StatefulWidget{
  const Venues({Key? key}) : super(key: key);

  @override
  _VenuesState createState() => _VenuesState();
}

class _VenuesState extends State<Venues> {
  
   Future getVenues() async {
  
    var res = await http.get(Uri.parse("http://41d2-154-179-223-195.ngrok.io/api/users/view"));
   // var res = await http.get(Uri.http('localhost:3100', 'api/users/view'));
    var jsonObj = jsonDecode(res.body);
   
    List <VenuesItem> venuesItem=[];
    for (var v in jsonObj){
      VenuesItem venue =VenuesItem(v["logo"],v["_id"],v["name"],v["desc"],v["opensAt"],v["closesAt"],v["location"],v["category"], v["numOfSeats"]);
      venuesItem.add(venue);
    }
   print(venuesItem.elementAt(0).name);
    return venuesItem;
   
  }
  
  @override
  Widget build(BuildContext context) {
 
    return  Scaffold(
      body:/*Center(
        child: ElevatedButton(
          child
          :Text("click me"),
          
          onPressed: () { 
            getVenues();
           },),
      )*/
      Column
      (
        children:[
          Expanded(
            child: FutureBuilder<dynamic>(
            initialData: [],
            future: getVenues(),
            builder: (context, snapshot) {
              if (snapshot.data != null) {
                return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {

                      return VenuesWidget(snapshot.data[index]);
                     /* Card(
                        elevation: 4,
                        child: ListTile(
                          title: Text(snapshot.data[index].name),
                          //subtitle: Text(snapshot.data[index]['desc']),
                          subtitle: Column(
                            children: [
                              Text(snapshot.data[index].desc),
                              Text(snapshot.data[index].location),
                            ]
                          ),
                          
                            
                          ),
                        
                      );*/
                    });
              } else {
                return CircularProgressIndicator();
              }
            }),
           /* child: ListView.builder(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return VenuesWidget(VenuesList[index]);
              },
              itemCount: VenuesList.length,
            ),*/
          )
        ]
      )
    );
 }
}

class VenuesItem {
  String logo;
  String _id;
  String name;
  String desc;
  String opensAt,closesAt;
  int category,numOfSeats;
  String location;
  //int numChair;
  //int reservedseats;

  VenuesItem(this.logo,this._id,this.name,this.desc,this.opensAt,this.closesAt,this.location,this.category, this.numOfSeats);
}
 
class VenuesWidget extends StatelessWidget {
   final VenuesItem venuesItem;

  //Function onSideMenuItemClick;
  VenuesWidget(this.venuesItem);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
       // Navigator.of(context).pushNamed(sideMenuItem.routeName);
       // onSideMenuItemClick(sideMenuItem);
      },
      child: SafeArea(
        child: Column(
          children: [
            Container(
            margin: const EdgeInsets.only(top:10.0,bottom:3.0),
           height: 150.0,
           width: MediaQuery.of(context).size.width - 55.0,
           decoration: BoxDecoration(
           borderRadius: BorderRadius.circular(5),
          // color: Colors.blue,
          /* image: DecorationImage(
                    image: ExactAssetImage(venuesItem.img),
            fit: BoxFit.fill
                )*/
                   ),
           ),
                
             Container (
             height: 24.0,
           width: MediaQuery.of(context).size.width - 85.0,
                padding: const EdgeInsets.all(0.0),
               child: Text(
                  venuesItem.name,
                  style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Courgette'),
                ),
            ),
            Container(
             height: 15.0,
              width: MediaQuery.of(context).size.width - 85.0,
                padding: const EdgeInsets.all(0.0),
                child: Text(venuesItem.location,
                 style: const TextStyle(
                  color: Colors.black54,
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Courgette'),),
            ),
            Container(
             height: 23.0,
              width: MediaQuery.of(context).size.width - 85.0,
                padding: const EdgeInsets.all(0.0),
                 
                child:RichText(
                  text: TextSpan(
                    text:13.toString() ,
                    style:  TextStyle(
                    color: Colors.orange.shade800,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Courgette'),
                    children:  <TextSpan>[
                      const TextSpan(text: '/', 
                      style: TextStyle(color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Courgette')),
                      TextSpan(text:venuesItem.numOfSeats.toString(),style: const TextStyle(
                        color:Colors.black,
                        fontWeight: FontWeight.bold)),
                    ],
                  ),
                )
            ),
            Container(
              
             height: 30.0,
              width: MediaQuery.of(context).size.width - 85.0,
                padding: const EdgeInsets.all(0.0),
                child:RichText(
                  text: TextSpan(
                    text: 'Available Seats : ',
                    style: const TextStyle(
                      color:Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        fontFamily: 'Courgette'),
                    children: <TextSpan>[
                      TextSpan(text: (venuesItem.numOfSeats-13).toString(), 
                      style:  TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        fontFamily: 'Courgette',
                        color:Colors.orange.shade800)),
                    ],
                  ),
                )
            )
          ],
              ),
      ),
    );
  }
}