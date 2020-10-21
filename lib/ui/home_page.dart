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
    return Container();
  }
}
