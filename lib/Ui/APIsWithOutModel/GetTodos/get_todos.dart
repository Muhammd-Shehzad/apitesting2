import 'package:apitesting2/Ui/APIsWithModel/NestedApiObject/UserModel1/reusable_row.dart';
import 'package:apitesting2/Ui/APIsWithOutModel/GetTodos/todos_provider.dart';
import 'package:apitesting2/Ui/APIsWithOutModel/GetUser/reused_row.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GetTodos extends StatefulWidget {
  const GetTodos({super.key});

  @override
  State<GetTodos> createState() => _GetTodosState();
}

class _GetTodosState extends State<GetTodos> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TodosProvider(),
      child: Consumer<TodosProvider>(
        builder: (context, model, child) => Scaffold(
          appBar: AppBar(
            title: Text('ToDos APIs'),
          ),
          body: FutureBuilder(
            future: model.getTodosData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              } else {
                return Expanded(
                  child: ListView.builder(
                      itemCount: model.data.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: Column(
                            children: [
                              ReusableRow(
                                  title: 'userid',
                                  value:
                                      model.data[index]['userId'].toString()),
                              ReusableRow(
                                  title: 'id',
                                  value: model.data[index]['id'].toString()),
                              ReusableRow(
                                  title: 'title',
                                  value: model.data[index]['title'].toString()),
                              ReusableRow(
                                  title: 'completed',
                                  value: model.data[index]['completed']
                                      .toString()),
                            ],
                          ),
                        );
                      }),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
