import 'package:flutter/material.dart';
import 'package:pet_app/Constant/Constand.dart';
import 'package:pet_app/Core/Services/pet/Get_User_pet.dart';
import 'package:pet_app/Screens/Widget/CardItem.dart';
import 'package:pet_app/Screens/Widget/CardItemDetails.dart';

class MyAdsPage extends StatefulWidget {
  @override
  _MyAdsPageState createState() => _MyAdsPageState();
}

class _MyAdsPageState extends State<MyAdsPage> {
  final GetUserPet getUserPet = GetUserPet();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2.8;
    final double itemWidth = size.width / 2;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey[200],
          title: Text(
            'My Ads',
            style: appHead,
          ),
        ),
        body: FutureBuilder(
          future: getUserPet.getUserPet(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return Center(
                  child: Text(
                    "Check Net Connection",
                    // style: head1,
                  ),
                );
              case ConnectionState.active:
              case ConnectionState.waiting:
                return Center(
                  child: CircularProgressIndicator(),
                );
              case ConnectionState.done:
                if (!snapshot.hasData || snapshot.hasError) {
                  print('Error data ${snapshot.data} ${snapshot.error}');
                  print("snapshot.data");
                  print(snapshot.data.toString());
                  return Center(
                    child: Text(
                      "404 Not Found",
                      // style: head1,
                    ),
                  );
                }

                return GridView.count(
                  crossAxisCount: 2,
                  childAspectRatio: (itemWidth / itemHeight),
                  controller: new ScrollController(keepScrollOffset: false),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  children: List.generate(snapshot.data.length, (index) {
                    return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CardItemDetails(
                                        age: snapshot.data[index].age,
                                        amount: snapshot.data[index].amount,
                                        createddate:
                                            snapshot.data[index].createddate,
                                        description:
                                            snapshot.data[index].description,
                                        location: snapshot.data[index].location,
                                        petCategory:
                                            snapshot.data[index].petCategory,
                                        petName: snapshot.data[index].petName,
                                        photo1: snapshot.data[index].photo1,
                                        photo2: snapshot.data[index].photo2,
                                        photo3: snapshot.data[index].photo3,
                                        photo4: snapshot.data[index].photo4,
                                        saled: snapshot.data[index].saled,
                                        video: snapshot.data[index].video,
                                      )));
                        },
                        child: CardItem(
                          amount: snapshot.data[index].amount,
                          image: snapshot.data[index].photo1,
                          location: snapshot.data[index].location,
                          petName: snapshot.data[index].petName,
                        ));
                  }),
                );

                break;
              default:
                return Container();
            }
          },
        ));
  }
}
