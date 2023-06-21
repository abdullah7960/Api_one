class FetchDataModel{
  final int userId;
  final int id;
  final String title;

  FetchDataModel({required this.userId,required this.id,required this.title});

  factory FetchDataModel.fromJson(Map<String,dynamic>json){
    return FetchDataModel(
      userId: json['userId'],
      id: json['id'], 
      title: json['title'],);
  }
}