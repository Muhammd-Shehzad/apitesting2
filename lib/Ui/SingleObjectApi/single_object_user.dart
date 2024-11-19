import 'package:apitesting2/Ui/SingleObjectApi/single_object_user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SingleObjectUser extends StatefulWidget {
  const SingleObjectUser({super.key});

  @override
  State<SingleObjectUser> createState() => _SingleObjectUserState();
}

class _SingleObjectUserState extends State<SingleObjectUser> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SingleObjectUserProvider(),
      child: Consumer<SingleObjectUserProvider>(
        builder: (context, model, child) => Scaffold(
          appBar: AppBar(
            title: Text('Signal Object User'),
          ),
        ),
      ),
    );
  }
}
