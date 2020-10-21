import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //Função de Requisição
  Future<Map> _getGIfs() async{
    String _search;
    int _offset;
    //Resposta
    http.Response response;

    if (_search == null){
      response = await http.get("https://api.giphy.com/v1/gifs/trending?api_key=f2rQ49y3pFHvAv5g0Oez49ZhfceF39Ll&limit=20&rating=g");
    } else {
      response = await http.get("https://api.giphy.com/v1/gifs/search?api_key=f2rQ49y3pFHvAv5g0Oez49ZhfceF39Ll&q=$_search&limit=$_offset&offset=25&rating=g&lang=pt");
    }

    return json.decode(response.body);
  }

  @override
  void initState(){
    super.initState();

    _getGIfs().then((map) => print(map));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Image.network("https://developers.giphy.com/branch/master/static/header-logo-8974b8ae658f704a5b48a2d039b8ad93.gif"),
      ),
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(10.0),
            child: TextField(
              decoration: InputDecoration(
                  labelText: "Pesquise Aqui!",
                  labelStyle: TextStyle(color: Colors.white),
                  border: OutlineInputBorder()
              ),
              style: TextStyle(color: Colors.white, fontSize: 18.0),
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}
