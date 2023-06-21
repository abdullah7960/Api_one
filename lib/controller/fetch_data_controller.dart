
import 'dart:convert';

import 'package:http_one/model/fetch_data_model.dart';
import 'package:http/http.dart' as http;
Future<FetchDataModel> fetchAlbum()async{
  final respone = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));

  if(respone.statusCode ==200){
     return FetchDataModel.fromJson(jsonDecode(respone.body));
  }else {
    throw Exception('Status Code Error');
  }
}

Future<FetchDataModel> deleteAlbum(String id)async{
  final response = await http.delete(Uri.parse('https://jsonplaceholder.typicode.com/albums/$id'),
  headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );

  if(response.statusCode == 200){
    return FetchDataModel.fromJson(jsonDecode(response.body));
  }else {
    // If the server did not return a "200 OK response",
    // then throw an exception.
    throw Exception('Failed to delete album.');
  }
}