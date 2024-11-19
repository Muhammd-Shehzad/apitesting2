import 'package:apitesting2/Ui/APIsWithModel/GetComment/comment_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GetComment extends StatefulWidget {
  const GetComment({super.key});

  @override
  State<GetComment> createState() => _GetCommentState();
}

class _GetCommentState extends State<GetComment> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CommentProvider(),
      child: Consumer<CommentProvider>(
        builder: (context, model, child) => Scaffold(
          appBar: AppBar(
            title: const Text('Comment APIs'),
          ),
          body: Column(
            children: [
              FutureBuilder(
                future: model.getCommentData(),
                builder: (context, snapshot) {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: model.commentList.length,
                      itemBuilder: (context, index) {
                        return Card(
                          color: Colors.amberAccent,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                    'Name:   ${snapshot.data![index].name}'),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                    'Email:   ${snapshot.data![index].email}'),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child:
                                    Text('Id:   ${snapshot.data![index].id}'),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                    'PostId:   ${snapshot.data![index].postId}'),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
