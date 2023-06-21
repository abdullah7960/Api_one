import 'package:flutter/material.dart';
import 'package:http_one/controller/fetch_data_controller.dart';
import 'package:http_one/model/fetch_data_model.dart';

class FetchData extends StatefulWidget {
  const FetchData({super.key});

  @override
  State<FetchData> createState() => _FetchDataState();
}

class _FetchDataState extends State<FetchData> {
 late Future<FetchDataModel> futureAlbum;
 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    futureAlbum = fetchAlbum();
  }
  @override
  
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('API ONE'),
          centerTitle: true,
        ),
        body: Center(
          child: FutureBuilder<FetchDataModel>(
            future: futureAlbum,
            builder: (context,snapshot){
              if(snapshot.hasData){
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Id    "+snapshot.data!.id.toString(),style: TextStyle(fontSize: 30),),
                    Text("Title "+snapshot.data!.title,style: TextStyle(fontSize: 30),),
                    Text(snapshot.data!.title ?? 'Deleted',style: TextStyle(fontSize: 30),),
                      ElevatedButton(
                        child: const Text('Delete Data'),
                        onPressed: () {
                          setState(() {
                           futureAlbum =
                                deleteAlbum(snapshot.data!.id.toString());
                          });
                        },
                      ),
                  ],
                );
              }else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              return CircularProgressIndicator();
            }),
        ),
      ),
    );
  }
}