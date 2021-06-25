import 'dart:convert';
import 'package:http/http.dart';

enum APIMethod { get, post }

class APIHandler {
  // Client for making requests
  static Client client = Client();

  // Base URL
  final String baseURL;

  // Instance
  static APIHandler _instance;

  // Private Constructor
  APIHandler._({this.baseURL});

  // Factory Method for Singleton Instance
  factory APIHandler.getInstance({baseURL}) {
    // return existing instance
    if (_instance != null) return _instance;

    _instance = APIHandler._(baseURL: baseURL);
    return _instance;
  }

  Future<Response> apiCall(String endPoint, APIMethod method,
      {Map params}) async {
    final String url = baseURL + endPoint;

    final headers = {"Content-Type": "application/json"};

    //Response
    Response responseBody;

    switch (method) {
      case APIMethod.get:
        responseBody = await client.get(url);
        break;
      case APIMethod.post:
        responseBody =
            await client.post(url, body: json.encode(params), headers: headers);
        break;
    }

    return responseBody;
  }
}

main() async {
  var apiHandler = APIHandler.getInstance(
      baseURL: "https://www.iosapplication.net/app-catalog/");
  var response = await apiHandler.apiCall("login.php", APIMethod.post,
      params: {"email": "apple@gmail.com", "password": "12345678"});
  var decoded = json.decode(response.body);

  Welcome login = Welcome.fromJson(decoded);
  print(login.message);
  print(login.token);
}

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
  Welcome({
    this.success,
    this.message,
    this.token,
  });

  int success;
  String message;
  String token;

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        success: json["success"],
        message: json["message"],
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "token": token,
      };
}
