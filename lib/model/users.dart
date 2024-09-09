class User {
  final String Email;
  final String PhoneNumber;
  final String UserName;
  final String Password;
  final String Pdf;

  User.fromJson(Map<String, dynamic> data)
      : Email = data['Email'],
        PhoneNumber = data['PhoneNumber'],
        UserName = data['UserName'],
        Password = data['Password'],
        Pdf = data['pdf'];

  Map<String, dynamic> toJson() => {
        'Email': Email,
        'PhoneNumber': PhoneNumber,
        'UserName': UserName,
        'Password': Password,
        'pdf': Pdf,
      };
}
