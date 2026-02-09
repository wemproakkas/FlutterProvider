class ProfileModel {
  final String? fullName;
  final String? email;
  final String? phone; 

  ProfileModel({
    this.fullName,
    this.email,
    this.phone, 
  });

  
    factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        fullName: json["fullName"],
        email: json["email"], 
        phone: json["phone"],   
    );

    Map<String, dynamic> toJson() => {
        "fullName": fullName,
        "email": email,
        "phone": phone,  
    };
 
}
