import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:nasaapi_app/model.dart';
import 'package:http/http.dart' as http;
import 'package:nasaapi_app/nasacard.dart';
import 'package:nasaapi_app/error.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<List<Nasa>> nasa;
  final String uri = 'https://apodapi.herokuapp.com/api/?count=5';
  Future<List<Nasa>> fetchNasa() async {
    var response = await http.get(uri);

    if (response.statusCode == 200) {
      final jsonList = jsonDecode(response.body);

      if (jsonList is List) {
        return jsonList.map((json) => Nasa.fromJson(json)).toList();
      }
    }
    throw Exception('http not call me');
  }

  @override
  void initState() {
    super.initState();
    nasa=fetchNasa();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: Text(
          'Nasa',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        elevation: 16.0,
        centerTitle: true,
        backgroundColor: Colors.black,
        actions: [
          IconButton(
              icon: Icon(Icons.autorenew),
              onPressed: () {
                setState(() {
                  nasa=fetchNasa();



                });
              })
        ],
      ),
      body: FutureBuilder(

        future: nasa,
        builder: (BuildContext context,AsyncSnapshot<List<Nasa>> snapshot){

          if (snapshot.hasData){

            return ListView(
              padding: EdgeInsets.all(16),
              children:snapshot.data.map((nasa) => NasaCard(nasa:nasa)).toList()

            );




          }
          else if (snapshot.hasError){
            return Error(error:snapshot.error);



          }
          else {

            return Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(Colors.blue),



              ),




            );
          }

      },



      ),
    );
  }
}
