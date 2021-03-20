import 'package:firebase_database/firebase_database.dart';
class User{
  final FirebaseDatabase _database = FirebaseDatabase.instance;
  String name;
  String id;
  bool isLoaded  = false;


  User(this.id, this.name);
  User.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        id = json['id'];

  Map<String, dynamic> toJson() => {
    'name': name,
    'id': id,
  };
  getIsLoaded(){
    return isLoaded;
  }
  setIsLoaded(bool check){
    isLoaded = check;
  }
  getId(){
    return id;
  }
  getUsername(){
    return name;
  }
}