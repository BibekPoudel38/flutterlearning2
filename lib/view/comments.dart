import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/controller/commentcontroller.dart';

class CommentView extends StatelessWidget {
  const CommentView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Comments"),
      ),
      body: GetBuilder<CommentController>(
        init: CommentController(),
        builder: (commentController) {
          return commentController.isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                itemCount: moviesController.data.movies.length,
                  itemBuilder: (context, index) {
                    return Text(moviesController.data.movies[0].title);
                  },
                );
        },
      ),
    );
  }
}
