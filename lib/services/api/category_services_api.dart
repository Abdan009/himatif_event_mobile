part of '../services.dart';

class CategoryServicesApi {
  static Future<ApiReturnValue<List<CategoryEvent>>> getEvent(
      {http.Client client}) async {
    client ??= http.Client();
    String url = baseURL + 'category';
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

    List<CategoryEvent> category = (data['data'] as Iterable).map(
      (e) {
        CategoryEvent category = CategoryEvent.fromJson(e);
        return category;
      },
    ).toList();
    return ApiReturnValue(value: category);
  }

  static Future<ApiReturnValue<CategoryEvent>> addCategory(
      CategoryEvent category,
      {http.Client client}) async {
    client ??= http.Client();
    String url = baseURL + 'category';
    var response = await client.post(
      Uri.parse(url),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer ${Users.token}"
      },
      body: jsonEncode(category.toJson()),
    );
    print('RESPON:' + response.toString());
    if (response.statusCode != 200) {
      return ApiReturnValue(message: 'Please try again');
    }
    var data = jsonDecode(response.body);
    CategoryEvent categoryResult = CategoryEvent.fromJson(data['data']);

    return ApiReturnValue(value: categoryResult);
  }

  static Future<ApiReturnValue<CategoryEvent>> updateCategory(
      CategoryEvent category,
      {http.Client client}) async {
    client ??= http.Client();
    String url = baseURL + 'updateCategory?id=${category.id}';
    var response = await client.post(
      Uri.parse(url),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer ${Users.token}"
      },
      body: jsonEncode(category.toJson()),
    );
    if (response.statusCode != 200) {
      return ApiReturnValue(message: 'Please try again');
    }
    var data = jsonDecode(response.body);
    CategoryEvent categoryResult = CategoryEvent.fromJson(data['data']);

    return ApiReturnValue(value: categoryResult);
  }

  static Future<ApiReturnValue<bool>> deleteCategory(int id,
      {http.Client client}) async {
    client ??= http.Client();
    String url = baseURL + 'deleteCategory?id=$id';
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
}
