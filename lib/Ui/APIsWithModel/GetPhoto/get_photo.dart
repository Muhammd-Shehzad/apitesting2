import 'package:apitesting2/Model/photo_model.dart';
import 'package:apitesting2/Ui/APIsWithModel/GetPhoto/photo_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GetPhoto extends StatefulWidget {
  const GetPhoto({super.key});

  @override
  State<GetPhoto> createState() => _GetPhotoState();
}

class _GetPhotoState extends State<GetPhoto> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PhotoProvider(),
      child: Consumer<PhotoProvider>(
        builder: (context, model, child) => Scaffold(
          appBar: AppBar(
            title: const Text('Get Photo from API'),
            centerTitle: true,
          ),
          body: Column(
            children: [
              FutureBuilder(
                future: model.getPhoto(),
                builder: (context, AsyncSnapshot<List<PhotoModel>> snapshot) {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: model.photoList.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(
                                snapshot.data![index].thumbnailUrl.toString()),
                          ),
                          title: Text('Id::${snapshot.data![index].id}'),
                          subtitle:
                              Text(snapshot.data![index].title.toString()),
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
