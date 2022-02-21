import 'package:flutter/material.dart';

import 'SearchPage.dart';
import 'SideMenu.dart';
import 'Venues.dart';

class HomeScreen extends StatefulWidget{
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      drawer:const SideMenu(),
        appBar: AppBar(
          
      backgroundColor: Colors.orange.shade800,
           title: const Text("Take a Seat",
            style: TextStyle(
              fontSize: 27,
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontFamily: 'Courgette',
              ),
          ),
          centerTitle:true,
           actions: [
          // Navigate to the Search Screen
          IconButton(
              onPressed: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => const SearchPage())),
              icon: const Icon(Icons.search))
        ],
        shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(30),
        ),
      ),
       ),
       body: const Center(child: Venues(),),
    );
 
 }
}