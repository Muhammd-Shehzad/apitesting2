import 'package:apitesting2/Ui/APIsWithModel/Model/zaheenapp_model.dart';
import 'package:apitesting2/Ui/APIsWithModel/ZaheenApp/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeProvider(),
      child: Consumer<HomeProvider>(
        builder: (context, model, child) => Scaffold(
          appBar: AppBar(
            title: const Text('Home Screen'),
            centerTitle: true,
          ),
          body: Column(
            children: [
              FutureBuilder(
                future: model.getData(),
                builder: (context, AsyncSnapshot<List<ZaheenApp>> snapshot) {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: model.appList.length,
                      itemBuilder: (context, index) {
                        return Row(
                          children: [
                            CircleAvatar(
                              backgroundImage: NetworkImage(snapshot
                                  .data![index].thumbnailUrl
                                  .toString()),
                            ),
                            Text(
                              snapshot.data![index].name.toString(),
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
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
