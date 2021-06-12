part of '../services.dart';

class JoinEventServicesApi {
  static Future<ApiReturnValue<List<JoinEvent>>> getJoinAllEvent(
      {http.Client client}) async {
    client ??= http.Client();

    String url = baseURL + 'join';
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

    List<JoinEvent> joins = (data['data']['data'] as Iterable).map(
      (e) {
        JoinEvent joinCopy = JoinEvent.fromJson(e);

        Users user = Users.fromJson(e['user']);
        EventInfo event = EventInfo.fromJson(e['event']);
        event = event.copyWith(posterEvent: "$storageURL" + event.posterEvent);
        joinCopy = joinCopy.copyWith(user: user, event: event);
        return joinCopy;
      },
    ).toList();
    return ApiReturnValue(value: joins);
  }

  static Future<ApiReturnValue<List<JoinEvent>>> getMyJoinEvent(int idUser,
      {http.Client client}) async {
    client ??= http.Client();

    String url = baseURL + 'join?id_user=$idUser';
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

    List<JoinEvent> joins = (data['data']['data'] as Iterable).map(
      (e) {
        JoinEvent joinCopy = JoinEvent.fromJson(e);

        Users user = Users.fromJson(e['user']);
        EventInfo event = EventInfo.fromJson(e['event']);
        event = event.copyWith(posterEvent: "$storageURL" + event.posterEvent);
        joinCopy = joinCopy.copyWith(user: user, event: event);
        return joinCopy;
      },
    ).toList();

    return ApiReturnValue(value: joins);
  }

  static Future<ApiReturnValue<JoinEvent>> addJoinEvent(JoinEvent joinEvent,
      {http.Client client}) async {
    client ??= http.Client();
    String url = baseURL + 'join';
    var response = await client.post(
      Uri.parse(url),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer ${Users.token}"
      },
      body: jsonEncode(joinEvent.toJson()),
    );
    print('RESPON:' + response.toString());
    if (response.statusCode != 200) {
      return ApiReturnValue(message: 'Please try again');
    }
    var data = jsonDecode(response.body);
    print(data);

    JoinEvent joinEventResult = JoinEvent.fromJson(data['data']);
    Users user = Users.fromJson(data['data']['user']);
    EventInfo event = EventInfo.fromJson(data['data']['event']);
    event = event.copyWith(posterEvent: "$storageURL" + event.posterEvent);
    joinEventResult = joinEventResult.copyWith(user: user, event: event);

    print("Result join");
    print(joinEventResult);

    return ApiReturnValue(value: joinEventResult);
  }
}
