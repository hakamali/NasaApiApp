import 'package:flutter/material.dart';
import 'package:nasaapi_app/model.dart';
import 'package:transparent_image/transparent_image.dart';

class DetailsPage extends StatelessWidget {
  final Nasa nasa;

  const DetailsPage({Key key, this.nasa}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(nasa.title),
        backgroundColor: Colors.black,
      ),
      body: ListView(
        children: [
          Stack(
            children: [
              Container(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
              Hero(
                  tag: nasa.date,
                  child: FadeInImage.memoryNetwork(
                    placeholder: kTransparentImage,
                    image: nasa.url,
                    fit: BoxFit.contain,
                  ))
            ],
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: Row(
              children: [
                Text(
                  nasa.date,
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                      fontStyle: FontStyle.italic),
                ),
                Container(
                  width: 250,
                  child: Text(
                    '©${nasa.copyright}',
                    softWrap: true,
                    textAlign: TextAlign.end,
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.normal,
                        fontStyle: FontStyle.italic),
                  ),
                )
              ],
            ),
          ),
          
          Padding(padding: EdgeInsets.fromLTRB(16, 16, 16, 16),
            child: Text(nasa.description,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic),),
          ),

        ],
      ),
    );
  }
}
