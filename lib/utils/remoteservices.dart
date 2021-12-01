import 'package:http/http.dart' as http;

class RemoteServices {
  static Uri initialUrl = Uri.parse("https://jsonplaceholder.typicode.com");

  // fetch the posts from the server
  static Future<http.Response> fetchPosts() async {
    Uri uri = Uri.parse('$initialUrl/posts/1');
    var response = await http.get(uri);
    return response;
  }

  // fetching the comments
  static Future<http.Response> fetchComments() async {
    Uri uri = Uri.parse('$initialUrl/comments?postId=1');
    var response = await http.get(uri);
    return response;
  }

  // creating post in the database
  static createPost() {}
}
