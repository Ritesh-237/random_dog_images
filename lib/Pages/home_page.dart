import 'package:dog_api_project/Pages/login.dart';
import 'package:dog_api_project/models/dog_image_model.dart';
import 'package:dog_api_project/repository/dog_image_api.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // List<String> images = [];
  DogResponseModel? dogResponseModel;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      isLoading = false;
      retry();
    });
  }

  retry() {
    RepositoryImpl().getDogImageResponse().then((data) {
      setState(() {
        dogResponseModel = data;
        // isLoading = true;
      });
    }).onError((error, stackTrace) {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color.fromARGB(255, 120, 103, 51),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        // elevation: 20,
        // backgroundColor: Colors.white,
        title: const Text(
          "Random Images",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: dogResponseModel?.message != null
          ? Column(
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: SizedBox(
                            height: 400,
                            width: 500,
                            child: isLoading
                                ? const Center(
                                    child: CircularProgressIndicator())
                                : Card(
                                    elevation: 1,
                                    child: Padding(
                                      padding: const EdgeInsets.all(24.0),
                                      child: Image.network(
                                          dogResponseModel!.message),
                                    )))),
                  ),
                ),
                // Text(dogResponseModel!.status),
                Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                          child: const Text("Next"),
                          onPressed: () {
                            setState(() {
                              // HistoryImage.instance.nextButtonData
                              //     .add(dogResponseModel!.message);
                              HistoryPageImages.instance.historyPageImages
                                  .add(dogResponseModel!.message);
                              retry();
                            });
                          }),
                      ElevatedButton(
                          onPressed: () {
                            setState(() {
                              ImageData._instance.cartButtonData
                                  .add(dogResponseModel!.message);
                              HistoryPageImages.instance.historyPageImages
                                  .add(dogResponseModel!.message);

                              retry();
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  backgroundColor: Colors.blue,
                                  duration: Duration(
                                    seconds: 1,
                                  ),
                                  content: Text("Added To Your Cart"),
                                ),
                              );
                            });
                          },
                          child: const Text("Add To Cart")),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LogIn()),
                              (route) => false);
                        },
                        child: const Text("Log Out"),
                      )
                    ],
                  ),
                )
              ],
            )
          : const Center(child: CircularProgressIndicator()),
    );
  }
}

class ImageData {
  List<String> cartButtonData = [];
  static final _instance = ImageData._internal();

  static ImageData get instance => _instance;

  ImageData._internal();
}

// class HistoryImage {
//   List<String> nextButtonData = [];
//   static final _instance = HistoryImage._internal();

//   static HistoryImage get instance => _instance;

//   HistoryImage._internal();
// }

class HistoryPageImages {
  List<String> historyPageImages = [];
  static final _instance = HistoryPageImages._internal();

  static HistoryPageImages get instance => _instance;

  HistoryPageImages._internal();
}
