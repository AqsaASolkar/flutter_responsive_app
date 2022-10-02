abstract class ApiProvider {
  Future<dynamic> httpGet(String path);
  Future<dynamic> httpPost(
      String path,
      );
}