import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/controller/postcontroller.dart';

class PostView extends StatelessWidget {
  const PostView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Posts"),
      ),
      body: GetBuilder<PostController>(
        init: PostController(),
        builder: (postController) {
          return postController.isLoading
              ? Center(child: CircularProgressIndicator())
              : Container(
                  child: Text(postController.post.body),
                );
        },
      ),
    );
  }
}
