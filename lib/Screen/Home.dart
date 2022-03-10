import 'package:carousel_slider/carousel_slider.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:property/Api/ApiService.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  ApiService api = ApiService();

  int currentPos = 0;

  late Position _currentPosition;
  dynamic _currentAddress;

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  _getCurrentLocation() async {
    await Permission.location.request();

    Geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best, forceAndroidLocationManager: true)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
        _getAddressFromLatLng();
      });
    }).catchError((e) {
      if (kDebugMode) {
        print(e);
      }
    });
  }

  _getAddressFromLatLng() async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
          _currentPosition.latitude,
          _currentPosition.longitude
      );

      Placemark place = placemarks[0];

      setState(() {
        _currentAddress = "${place.subLocality}";
      });
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    _getCurrentLocation();
    return FutureBuilder(
      future: api.getData(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        CarouselSlider.builder(
                          itemCount: snapshot.data.backgroundImages.length,
                          options:
                              CarouselOptions(aspectRatio: 1.6, autoPlay: true),
                          itemBuilder: (ctx, index, realIdx) {
                            return Image.network(
                              snapshot.data.backgroundImages[index].image,
                              fit: BoxFit.fill,
                            );
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 100, 0, 0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 1.5,
                                    height: 50,
                                    child: TextFormField(
                                      enabled: false,
                                      decoration: const InputDecoration(
                                        hintText: "What you are searching for?",
                                        fillColor: Colors.white,
                                        filled: true,
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(25),
                                              bottomLeft: Radius.circular(25)),
                                          borderSide: BorderSide(),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 50,
                                    width: 90,
                                    child: TextField(
                                      enabled: false,
                                      decoration: InputDecoration(
                                        hintText: "Search",
                                        hintStyle:
                                            TextStyle(color: Colors.white),
                                        fillColor: Colors.orange,
                                        filled: true,
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(25),
                                              bottomRight: Radius.circular(25)),
                                          borderSide: BorderSide(),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {},
                                      child: const Text("Find Property"),
                                      style: ElevatedButton.styleFrom(
                                          primary: Colors.orange,
                                          textStyle: const TextStyle(
                                              color: Colors.white)),
                                    ),
                                    ElevatedButton(
                                      onPressed: () {},
                                      child: const Text("Post a Property"),
                                      style: ElevatedButton.styleFrom(
                                          primary: Colors.orange,
                                          textStyle: const TextStyle(
                                              color: Colors.white)),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 200,
                        child: CarouselSlider.builder(
                          itemCount: snapshot.data.data[0]?.items?.length,
                          options:
                              CarouselOptions(onPageChanged: (index, reason) {
                            setState(() {
                              currentPos = index;
                            });
                          }),
                          itemBuilder: (ctx, index, realIdx) {
                            return Image.network(
                              snapshot.data.data[0]?.items[index].image,
                              height: 400,
                              width: 300,
                              fit: BoxFit.cover,
                            );
                          },
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "Top Picks",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Row(
                          children: const [
                            Text(
                              "SEE ALL",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.orange),
                            ),
                            Icon(
                              Icons.arrow_right,
                              color: Colors.orange,
                            )
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 340,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: snapshot.data.data[1].items.length,
                        itemBuilder: (BuildContext context, int index) {
                          var toppic = snapshot.data.data[1].items[index];
                          return SizedBox(
                            width: 280,
                            child: Card(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                        height: 200,
                                        width: 270,
                                        child: Image.network(toppic.thumbnail,
                                            fit: BoxFit.fill)),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          NumberFormat.compactLong(
                                                  locale: 'en_IN')
                                              .format(toppic.price),
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16),
                                        ),
                                        // SizedBox(
                                        //   width: 125,
                                        // ),
                                        FavoriteButton(
                                          iconColor: Colors.red,
                                          iconSize: 40,
                                          valueChanged: (_) {},
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: SizedBox(
                                          width: 190,
                                          child: Text(
                                            toppic.title,
                                            overflow: TextOverflow.ellipsis,
                                          )),
                                    ),
                                    Row(
                                      children: [
                                        for (var item in toppic.attributes)
                                          Padding(
                                            padding: const EdgeInsets.all(3.0),
                                            child: Container(
                                                width: 78,
                                                color: Colors.grey[100],
                                                child: Text(
                                                  "${item.value}"
                                                      " "
                                                      "${item.unit}",
                                                  overflow:
                                                  TextOverflow.ellipsis,
                                                )),
                                          )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        const Icon(Icons.location_on),
                                        Text("${toppic.locality}")
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "Latest",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Row(
                          children: const [
                            Text(
                              "SEE ALL",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.orange),
                            ),
                            Icon(
                              Icons.arrow_right,
                              color: Colors.orange,
                            )
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 340,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: snapshot.data.data[2].items.length,
                        itemBuilder: (BuildContext context, int index) {
                          var toppic = snapshot.data.data[2].items[index];
                          return SizedBox(
                            width: 280,
                            child: Card(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                        height: 200,
                                        width: 270,
                                        child: toppic.thumbnail != null
                                            ? Image.network(
                                                toppic.thumbnail,
                                                fit: BoxFit.fill,
                                              )
                                            : const Center(
                                                child: Text("No Image Data"),
                                              )),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          NumberFormat.compactLong(
                                                  locale: 'en_IN')
                                              .format(toppic.price),
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16),
                                        ),
                                        FavoriteButton(
                                          iconColor: Colors.red,
                                          iconSize: 40,
                                          valueChanged: (_) {},
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: SizedBox(
                                          width: 190,
                                          child: Text(
                                            toppic.title,
                                            overflow: TextOverflow.ellipsis,
                                          )),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        for (var item in toppic.attributes)
                                          Padding(
                                            padding: const EdgeInsets.all(3.0),
                                            child: Container(
                                                width: 78,
                                                color: Colors.grey[100],
                                                child: Text(
                                                  "${item.value}"
                                                  " "
                                                  "${item.unit}",
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                )),
                                          )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        const Icon(Icons.location_on),
                                        Text("${toppic.locality}")
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                left: 20,
                top: 30,
                child: IconButton(
                  iconSize: 30,
                  color: Colors.white,
                  onPressed: () {
                    scaffoldKey.currentState?.openDrawer();
                  },
                  icon: const Icon(Icons.menu),
                ),
              ),
              Positioned(
                top: 30,
                right: 20,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      iconSize: 25,
                      color: Colors.white,
                      onPressed: () {},
                      icon: const Icon(Icons.location_on),
                    ),
                    _currentAddress != null ?Text(
                      _currentAddress,
                      style: const TextStyle(color: Colors.white),
                    ) : const Text(
                      "loading...",
                      style: TextStyle(color: Colors.white)),
                    const Icon(
                      Icons.arrow_drop_down_outlined,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
            ],
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
