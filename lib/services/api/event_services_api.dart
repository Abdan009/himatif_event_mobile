part of '../services.dart';

class EventServicesApi {
  static Future<ApiReturnValue<List<EventInfo>>> getEvent(
      {http.Client client}) async {
    client ??= http.Client();

    String url = baseURL + 'event';
    var response = await client.get(
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

    List<EventInfo> events = (data['data']['data'] as Iterable).map(
      (e) {
        EventInfo eventCopy = EventInfo.fromJson(e);
        eventCopy = eventCopy.copyWith(
          posterEvent: storageURL + eventCopy.posterEvent.toString(),
        );
        Users user = Users.fromJson(e['user']);
        eventCopy.copyWith(user: user);
        return eventCopy;
      },
    ).toList();
    return ApiReturnValue(value: events);
  }

  static Future<ApiReturnValue<List<EventInfo>>> getMyContibutionEvent(
      int idUser,
      {http.Client client}) async {
    client ??= http.Client();

    String url = baseURL + 'event?id_user=$idUser';
    var response = await client.get(
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

    List<EventInfo> events = (data['data']['data'] as Iterable).map(
      (e) {
        EventInfo eventCopy = EventInfo.fromJson(e);
        eventCopy = eventCopy.copyWith(
          posterEvent: storageURL + eventCopy.posterEvent.toString(),
        );
        Users user = Users.fromJson(e['user']);
        eventCopy.copyWith(user: user);
        return eventCopy;
      },
    ).toList();
    return ApiReturnValue(value: events);
  }

  static Future<ApiReturnValue<EventInfo>> addEvent(
      EventInfo event, File filePoster,
      {http.Client client}) async {
    client ??= http.Client();
    print('posisi 1');
    String url = baseURL + 'event';
    var response = await client
        .post(
      Uri.parse(url),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer ${Users.token}"
      },
      body: jsonEncode(event.toJson()),
    )
        .catchError((e) {
      print(e.toString());
    });
    if (response.statusCode != 200) {
      return ApiReturnValue(message: 'Please try again');
    }
    var data = jsonDecode(response.body);
    print(data.toString());
    print('posisi 3');

    EventInfo eventResult = EventInfo.fromJson(data['data']);
    eventResult.copyWith(
      user: Users.fromJson(
        data['data']['user'],
      ),
    );
    if (filePoster != null) {
      ApiReturnValue<String> result =
          await uploadProfilePicture(eventResult.id, filePoster);
      print('hasil upload:' + result.value.toString());
      eventResult = eventResult.copyWith(
          posterEvent: "$storageURL" + result.value.toString());
    }
    print(eventResult.toString());
    return ApiReturnValue(value: eventResult);
  }

  static Future<ApiReturnValue<bool>> deleteEvent(int id,
      {http.Client client}) async {
    client ??= http.Client();
    String url = baseURL + 'deleteEvent?id=$id';
    final response = await client.delete(
      Uri.parse(url),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer ${Users.token}"
      },
    );
    if (response.statusCode == 200) {
      return ApiReturnValue(value: true);
    } else {
      return ApiReturnValue(value: false);
    }
  }

  static Future<ApiReturnValue<EventInfo>> updateEvent(EventInfo event,
      {File filePoster, http.Client client}) async {
    client ??= http.Client();
    print('posisi 1');
    String url = baseURL + 'updateEvent?id=${event.id}';
    var response = await client
        .post(
      Uri.parse(url),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer ${Users.token}"
      },
      body: jsonEncode(event.toJson()),
    )
        .catchError(
      (e) {
        print(
          e.toString(),
        );
      },
    );
    if (response.statusCode != 200) {
      return ApiReturnValue(message: 'Please try again');
    }
    var data = jsonDecode(response.body);
    print(data.toString());

    EventInfo eventResult = EventInfo.fromJson(data['data']);
    eventResult = eventResult.copyWith(
        posterEvent: "$storageURL" + eventResult.posterEvent);
    eventResult = eventResult.copyWith(
      user: Users.fromJson(
        data['data']['user'],
      ),
    );
    if (filePoster != null) {
      ApiReturnValue<String> result =
          await uploadProfilePicture(eventResult.id, filePoster);
      print('hasil upload:' + result.value.toString());
      eventResult = eventResult.copyWith(
          posterEvent: "$storageURL" + result.value.toString());
    }
    print(eventResult.toString());
    return ApiReturnValue(value: eventResult);
  }

  static Future<ApiReturnValue<String>> uploadProfilePicture(
      int idEvent, File pictureFile,
      {http.MultipartRequest request}) async {
    print("Event id:" + idEvent.toString());
    String url = baseURL + 'updatePoster?id=$idEvent';
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
      print('respon: ' + data.toString());
      String imagePath = data['data']['poster_event'];
      return ApiReturnValue(value: imagePath);
    } else {
      return ApiReturnValue(message: 'Uploading Profile Picture Failed');
    }
  }
}
