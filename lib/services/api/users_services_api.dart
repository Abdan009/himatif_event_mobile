part of '../services.dart';

class UsersServicesApi {
  static Future<ApiReturnValue<Users>> getUser({http.Client client}) async {
    if (client == null) {
      client = http.Client();
    }
    String url = baseURL + 'user';
    var response = await client.post(
      Uri.parse(url),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer ${Users.token}"
      },
    );
    if (response.statusCode != 200) {
      return ApiReturnValue(message: 'Please try again');
    }

    var data = jsonDecode(response.body);

    Users value = Users.fromJson(data['data']);
    return ApiReturnValue(value: value);
  }

  static Future<ApiReturnValue<List<Users>>> getAllUser(
      {http.Client client}) async {
    if (client == null) {
      client = http.Client();
    }
    String url = baseURL + 'getAllUser';
    var response = await client.post(
      Uri.parse(url),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer ${Users.token}"
      },
    );
    if (response.statusCode != 200) {
      return ApiReturnValue(message: 'Please try again');
    }

    var data = jsonDecode(response.body);
    print(data);
    List<Users> listUser =
        (data['data'] as Iterable).map((e) => Users.fromJson(e)).toList();

    return ApiReturnValue(value: listUser);
  }

  static Future<ApiReturnValue<Users>> login(String email, String password,
      {http.Client client}) async {
    if (client == null) {
      client = http.Client();
    }

    String url = baseURL + 'login';

    var response = await client.post(
      Uri.parse(url),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(
        <String, String>{'email': email, 'password': password},
      ),
    );

    if (response.statusCode != 200) {
      return ApiReturnValue(message: 'Please try again');
    }

    var data = jsonDecode(response.body);

    Users.token = data['data']['access_token'];
    Users value = Users.fromJson(data['data']['user']);

    return ApiReturnValue(value: value);
  }

  static Future<ApiReturnValue<Users>> signUp(Users user, String password,
      {File pictureFile, http.Client client}) async {
    if (client == null) {
      client = http.Client();
    }

    String url = baseURL + 'register';

    var response = await client.post(
      Uri.parse(url),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        'email': user.email,
        'name': user.name,
        'phone_number': user.phoneNumber,
        'profile_photo_path': user.photoURL,
        'majors': user.majors,
        'study_program': user.studyProgram,
        'year_generation': user.yearGeneration,
        'roles': user.roles ?? 'Mahasiswa',
        'token_notif': user.tokenNotif,
        'gender': user.gender,
        'address': user.address,
        'password_confirmation': password,
        'password': password
      }),
    );

    if (response.statusCode != 200) {
      return ApiReturnValue(message: 'Please try again');
    }

    var data = jsonDecode(response.body);

    Users.token = data['data']['access_token'];
    Users value = Users.fromJson(data['data']['user']);

    if (pictureFile != null) {
      ApiReturnValue<String> result = await uploadProfilePicture(pictureFile);
      if (result.value != null) {
        value = value.copyWith(photoURL: "$storageURL" + result.value);
      }
    }

    return ApiReturnValue(value: value);
  }

  static Future<ApiReturnValue<String>> uploadProfilePicture(File pictureFile,
      {http.MultipartRequest request}) async {
    String url = baseURL + 'user/photo';
    var uri = Uri.parse(url);

    if (request == null) {
      request = http.MultipartRequest("POST", uri)
        ..headers["Content-Type"] = "application/json"
        ..headers["Authorization"] = "Bearer ${Users.token}";
    }

    var multipartFile =
        await http.MultipartFile.fromPath('file', pictureFile.path);
    request.files.add(multipartFile);

    var response = await request.send();

    if (response.statusCode == 200) {
      String responseBody = await response.stream.bytesToString();
      var data = jsonDecode(responseBody);

      String imagePath = data['data'][0];

      return ApiReturnValue(value: imagePath);
    } else {
      return ApiReturnValue(message: 'Uploading Profile Picture Failed');
    }
  }

  static Future<ApiReturnValue> logout({http.Client client}) async {
    if (client == null) {
      client = http.Client();
    }

    String url = baseURL + 'logout';

    var response = await client.post(
      Uri.parse(url),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer ${Users.token}"
      },
    );

    if (response.statusCode != 200) {
      return ApiReturnValue(message: 'Please try again');
    }
    return ApiReturnValue(value: true);
  }
}
