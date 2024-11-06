import 'package:apitesting2/Ui/HomwScreen/ZaheenApp/home_provider.dart';
import 'package:apitesting2/main.dart';
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
        builder: (context, modle, child) => Scaffold(
          appBar: AppBar(
            title: Text('Home Screen'),
            centerTitle: true,
          ),
          body: Column(
            children: [
              FutureBuilder(
                  future: modle.getData(),
                  builder: (context, snapshot) {
                    return Expanded(
                      child: ListView.builder(
                          itemCount: modle.appList.length,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    height: 100.h,
                                    width: 180.w,
                                    child: Image.network(
                                      '${modle.appList[index].thumbnailUrl}',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Text('${modle.appList[index].thumbnail}'),
                                Text('${modle.appList[index].name}'),
                              ],
                            );
                          }),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
