import 'package:apitesting2/Ui/APIsWithModel/Model/NestedModel/user_model.dart';
import 'package:apitesting2/Ui/APIsWithModel/NestedApiObject/UserModel1/reusable_row.dart';
import 'package:apitesting2/Ui/APIsWithModel/NestedApiObject/UserModel1/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserPost extends StatefulWidget {
  const UserPost({super.key});

  @override
  State<UserPost> createState() => _UserPostState();
}

class _UserPostState extends State<UserPost> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UserProviderWithoutModel(),
      child: Consumer<UserProviderWithoutModel>(
        builder: (context, model, child) => Scaffold(
          appBar: AppBar(
            title: const Text('Get User APIs'),
          ),
          body: Column(
            children: [
              Expanded(
                child: FutureBuilder(
                  future: model.userData(),
                  builder: (contex, AsyncSnapshot<List<UserModel>> snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                        itemCount: model.userList.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(10),
                            child: Card(
                              child: Column(
                                children: [
                                  ReusableRow(
                                    title: 'UserName:',
                                    value: snapshot.data![index].username
                                        .toString(),
                                  ),
                                  ReusableRow(
                                    title: 'Email:',
                                    value:
                                        snapshot.data![index].email.toString(),
                                  ),
                                  ReusableRow(
                                    title: 'Phone:',
                                    value:
                                        snapshot.data![index].phone.toString(),
                                  ),
                                  ReusableRow(
                                    title: 'Website:',
                                    value: snapshot.data![index].website
                                        .toString(),
                                  ),
                                  ReusableRow(
                                    title: 'Company:',
                                    value: snapshot.data![index].company
                                        .toString(),
                                  ),
                                  ReusableRow(
                                    title: 'Address:',
                                    value: snapshot.data![index].address!.street
                                            .toString() +
                                        snapshot.data![index].address!.geo!.lat
                                            .toString(),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    } else {
                      return const CircularProgressIndicator();
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
