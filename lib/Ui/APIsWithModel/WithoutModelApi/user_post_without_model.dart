import 'package:apitesting2/Ui/APIsWithModel/NestedApiObject/UserModel1/reusable_row.dart';
import 'package:apitesting2/Ui/APIsWithModel/NestedApiObject/UserModel1/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserPostWithoutModel extends StatefulWidget {
  const UserPostWithoutModel({super.key});

  @override
  State<UserPostWithoutModel> createState() => _UserPostWithoutModelState();
}

class _UserPostWithoutModelState extends State<UserPostWithoutModel> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UserProviderWithoutModel(),
      child: Consumer<UserProviderWithoutModel>(
        builder: (context, model, child) => Scaffold(
          body: Column(
            children: [
              FutureBuilder(
                  future: model.userData(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Text('Loading');
                    } else {
                      return ListView.builder(itemBuilder: (context, index) {
                        return Card(
                          child: Column(
                            children: [
                              ReusableRow(
                                  title: 'name',
                                  value: '${snapshot.data![index].address}')
                            ],
                          ),
                        );
                      });
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
