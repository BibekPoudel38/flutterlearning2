import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:myapp/models/postmodel.dart';
import 'package:myapp/utils/remoteservices.dart';

class PostController extends GetxController {
  bool isLoading = false;

  late PostModel post;
  @override
  void onInit() {
    fetchPost();
    super.onInit();
  }

  fetchPost() async {
    isLoading = true;
    update();
    http.Response response = await RemoteServices.fetchPosts();
    if (response.statusCode == 200) {
      post = postModelFromJson(response.body);
    } else {
      Fluttertoast.showToast(msg: "Problem while fetching data");
    }

    isLoading = false;
    update();
  }
}
