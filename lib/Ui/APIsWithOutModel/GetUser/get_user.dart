import 'package:apitesting2/Ui/APIsWithModel/NestedApiObject/UserModel1/reusable_row.dart';
import 'package:apitesting2/Ui/APIsWithOutModel/GetUser/user_Provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GetUser extends StatefulWidget {
  const GetUser({super.key});

  @override
  State<GetUser> createState() => _GetUserState();
}

class _GetUserState extends State<GetUser> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UserProvider(),
      child: Consumer<UserProvider>(
        builder: (context, model, child) => Scaffold(
          appBar: AppBar(
            title: const Text('User API withot Model'),
          ),
          body: Column(
            children: [
              FutureBuilder(
                  future: model.getuserData(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    } else {
                      return Expanded(
                        child: ListView.builder(
                            itemCount: model.data.length,
                            itemBuilder: (contex, index) {
                              return Card(
                                child: Column(
                                  children: [
                                    ReusableRow(
                                        title: 'name',
                                        value: model.data[index]['name']
                                            .toString()),
                                    ReusableRow(
                                        title: 'username',
                                        value: model.data[index]['username']
                                            .toString()),
                                    ReusableRow(
                                        title: 'email',
                                        value: model.data[index]['email']
                                            .toString()),
                                    ReusableRow(
                                        title: 'address',
                                        value: model.data[index]['address']
                                                ['street']
                                            .toString()),
                                    ReusableRow(
                                        title: 'suite',
                                        value: model.data[index]['address']
                                                ['suite']
                                            .toString()),
                                    ReusableRow(
                                        title: 'city',
                                        value: model.data[index]['address']
                                                ['city']
                                            .toString()),
                                    ReusableRow(
                                        title: 'zipcode',
                                        value: model.data[index]['address']
                                                ['zipcode']
                                            .toString()),
                                    ReusableRow(
                                        title: 'geo',
                                        value: model.data[index]['address']
                                                ['geo']['lat']
                                            .toString()),
                                    ReusableRow(
                                        title: 'lng',
                                        value: model.data[index]['address']
                                                ['geo']['lng']
                                            .toString()),
                                    ReusableRow(
                                        title: 'phone',
                                        value: model.data[index]['phone']
                                            .toString()),
                                    ReusableRow(
                                        title: 'website',
                                        value: model.data[index]['website']
                                            .toString()),
                                    ReusableRow(
                                        title: 'company',
                                        value: model.data[index]['company']
                                                ['name']
                                            .toString()),
                                    ReusableRow(
                                        title: 'catchPhrase',
                                        value: model.data[index]['company']
                                                ['catchPhrase']
                                            .toString()),
                                    ReusableRow(
                                        title: 'bs',
                                        value: model.data[index]['company']
                                                ['bs']
                                            .toString()),
                                  ],
                                ),
                              );
                            }),
                      );
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
