class UserModel{
  late String id;
  late String fullname;
  late String email;
  UserModel(this.id,this.fullname,this.email);

  //Map to object ----- decode

UserModel.fromMap(Map<String, dynamic> map){
  this.id = map["id"];
  this.fullname = map["fullname"];
  this.email = map["email"];
}

// Object to Map --- encode

Map<String, dynamic> toMap(){
  return{
    "id" : this.id,
    "fullname" : this.fullname,
    "email" : this.email
  };
}

}

