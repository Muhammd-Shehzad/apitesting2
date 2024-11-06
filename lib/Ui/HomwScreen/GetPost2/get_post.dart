import 'package:apitesting2/Ui/HomwScreen/GetPost2/post_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class GetPost extends StatefulWidget {
  const GetPost({super.key});

  @override
  State<GetPost> createState() => _GetPostState();
}

class _GetPostState extends State<GetPost> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PostProvider(),
      child: Consumer<PostProvider>(
        builder: (context, model, child) => Scaffold(
          appBar: AppBar(
            title: Text('Get Post Data 2'),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FutureBuilder(
                future: model.getPostData(),
                builder: (context, snapshot) {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: model.listName.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            color: Colors.amberAccent,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'PostId: ${model.listName[index].postId}',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Text(
                                  'id: ${model.listName[index].id}',
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w400),
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Text(
                                  'Name: ${model.listName[index].name}',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w400),
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Text(
                                  'Email: ${model.listName[index].email}',
                                  style: TextStyle(
                                      color: Colors.redAccent,
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w400),
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Text(
                                  'Body: ${model.listName[index].body}',
                                  style: TextStyle(
                                      color: Colors.blueGrey,
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w400),
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                              ],
                            ),
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
