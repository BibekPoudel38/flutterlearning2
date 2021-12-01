import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:myapp/models/commentmodel.dart';
import 'package:myapp/utils/remoteservices.dart';

class CommentController extends GetxController {
  bool isLoading = false;

  @override
  void onInit() {
    fetchComments();
    super.onInit();
  }

  late CommentModel comment;

  fetchComments() async {
    isLoading = true;
    update();
    http.Response response = await RemoteServices.fetchComments();
    if (response.statusCode == 200) {
      comment = commentModelFromJson(response.body);
    } else {
      Fluttertoast.showToast(msg: 'Error while loading comments');
    }
    isLoading = false;
    update();
  }
}
