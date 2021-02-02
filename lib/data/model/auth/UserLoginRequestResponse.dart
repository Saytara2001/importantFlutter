/// userExternalData : {"user":{"id":1121,"email":"acdb1@orchtech.com","authentication_token":"cMsMxupt2esxs_FywWLE"},"employee":{"id":1088,"first_name":"Rana","middle_name":"","family_name":"Sabra","employee_id":"rana","account_id":24}}
/// userToken : "dc5ea841-558b-40e4-a26d-d60364de21b6"

class UserLoginRequestResponse {
  UserExternalData _userExternalData;
  String _userToken;

  UserExternalData get userExternalData => _userExternalData;

  String get userToken => _userToken;

  UserLoginRequestResponse(
      {UserExternalData userExternalData, String userToken}) {
    _userExternalData = userExternalData;
    _userToken = userToken;
  }

  UserLoginRequestResponse.fromJson(dynamic json) {
    _userExternalData = json["userExternalData"] != null
        ? UserExternalData.fromJson(json["userExternalData"])
        : null;
    _userToken = json["userToken"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (_userExternalData != null) {
      map["userExternalData"] = _userExternalData.toJson();
    }
    map["userToken"] = _userToken;
    return map;
  }
}

/// user : {"id":1121,"email":"acdb1@orchtech.com","authentication_token":"cMsMxupt2esxs_FywWLE"}
/// employee : {"id":1088,"first_name":"Rana","middle_name":"","family_name":"Sabra","employee_id":"rana","account_id":24}

class UserExternalData {
  User _user;
  Employee _employee;

  User get user => _user;

  Employee get employee => _employee;

  UserExternalData({User user, Employee employee}) {
    _user = user;
    _employee = employee;
  }

  UserExternalData.fromJson(dynamic json) {
    _user = json["user"] != null ? User.fromJson(json["user"]) : null;
    _employee =
        json["employee"] != null ? Employee.fromJson(json["employee"]) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (_user != null) {
      map["user"] = _user.toJson();
    }
    if (_employee != null) {
      map["employee"] = _employee.toJson();
    }
    return map;
  }
}

/// id : 1088
/// first_name : "Rana"
/// middle_name : ""
/// family_name : "Sabra"
/// employee_id : "rana"
/// account_id : 24

class Employee {
  int _id;
  String _firstName;
  String _middleName;
  String _familyName;
  String _employeeId;
  int _accountId;

  int get id => _id;

  String get firstName => _firstName;

  String get middleName => _middleName;

  String get familyName => _familyName;

  String get employeeId => _employeeId;

  int get accountId => _accountId;

  Employee(
      {int id,
      String firstName,
      String middleName,
      String familyName,
      String employeeId,
      int accountId}) {
    _id = id;
    _firstName = firstName;
    _middleName = middleName;
    _familyName = familyName;
    _employeeId = employeeId;
    _accountId = accountId;
  }

  Employee.fromJson(dynamic json) {
    _id = json["id"];
    _firstName = json["first_name"];
    _middleName = json["middle_name"];
    _familyName = json["family_name"];
    _employeeId = json["employee_id"];
    _accountId = json["account_id"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = _id;
    map["first_name"] = _firstName;
    map["middle_name"] = _middleName;
    map["family_name"] = _familyName;
    map["employee_id"] = _employeeId;
    map["account_id"] = _accountId;
    return map;
  }
}

/// id : 1121
/// email : "acdb1@orchtech.com"
/// authentication_token : "cMsMxupt2esxs_FywWLE"

class User {
  int _id;
  String _email;
  String _authenticationToken;

  int get id => _id;

  String get email => _email;

  String get authenticationToken => _authenticationToken;

  User({int id, String email, String authenticationToken}) {
    _id = id;
    _email = email;
    _authenticationToken = authenticationToken;
  }

  User.fromJson(dynamic json) {
    _id = json["id"];
    _email = json["email"];
    _authenticationToken = json["authentication_token"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = _id;
    map["email"] = _email;
    map["authentication_token"] = _authenticationToken;
    return map;
  }
}
