class UserModel{

  String? uId;
  String ?email;
  String ?age;
  String ?phoneNumber;
  String ?image;
  String ?fullName;
  String ?bio;


  UserModel({
    this.uId,
    this.email,
    this.age,
    this.image,
    this.phoneNumber,
    this.fullName,
    this.bio,

  });

  UserModel.formJson( Map <String , dynamic> json ){

    email=json['email'];
    uId=json['uId'];
    fullName=json['fullName'];
    bio=json['bio'];
    image=json['image'];
    age=json['age'];
    phoneNumber=json['phoneNumber'];
  }

  Map <String,dynamic> toMap(){
    return{
      'email':email,
      'uId':uId,
      'fullName':fullName,
      'bio':bio,
      'image':image,
      'phoneNumber':phoneNumber,
      'age':age

    };
  }

}
