import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          
          backgroundColor: Colors.orange.shade800,
          title: Container(
        width: double.infinity,
        height: 40,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(50)),
            
        child: Center(
          child: TextField(           
          cursorColor: Colors.orange.shade800,
            decoration: InputDecoration(
                prefixIcon:  Icon(
                  Icons.search,
                  color:Colors.orange.shade800,
                  ),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.clear),
                  color: Colors.orange.shade800,
                  onPressed: () {
                    /* Clear the search field */
                  },
                ),
                hintText: 'Search...',
                border: InputBorder.none),
          ),
        ),
      )),
    );
  }
}