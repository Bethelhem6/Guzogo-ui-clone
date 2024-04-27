import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:guzo_go_clone/bloc/update_trip_info_bloc/update_trip_info_bloc.dart';
import 'package:guzo_go_clone/constants/constants.dart';
import 'package:guzo_go_clone/routes/custom_route.dart';
import 'package:guzo_go_clone/screens/screens.dart';
import 'package:guzo_go_clone/util/helper.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isRound = true;
  bool swapped = false;
  String selectedCabin = "Economy";
  int adult = 1;
  int children = 0;
  int infant = 0;
  Map infos = {};
  @override
  void initState() {
    super.initState();

    var src = getDayAndMonthName(DateTime.now().toString());
    List<String> days = src.split(",");
    tripInfo["date"] = days[0];
    tripInfo["day"] = days[1];
    tripInfo["month"] = days[2];
    var res = getDayAndMonthName(
        DateTime.now().add(const Duration(days: 15)).toString());
    List<String> words = res.split(",");
    tripInfo["return"]["date"] = words[0];
    tripInfo["return"]["day"] = words[1];
    tripInfo["return"]["month"] = words[2];

    BlocProvider.of<UpdateTripInfoBloc>(context)
        .add(UpdateTripInfo(source: const {}, destination: const {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: BlocConsumer<UpdateTripInfoBloc, UpdateTripInfoState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is UpdateTripInfoSuccess) {
              infos = state.tripInfo;
            }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    Container(
                      height: 40.h,
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                              "assets/images/background.jpg",
                            ),
                            fit: BoxFit.cover),
                      ),
                    ),
                    Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        height: 20.h,
                        // padding: const EdgeInsets.only(left: 15, top: 25),
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                const Color.fromARGB(255, 12, 13, 83)
                                    .withOpacity(.8),
                                const Color.fromARGB(255, 12, 13, 83)
                                    .withOpacity(.6),
                                const Color.fromARGB(255, 12, 13, 83)
                                    .withOpacity(.4),
                                // AppConstants.primaryColor,
                              ],
                              stops: const [0.0, 0.1, 1.0],
                            ),
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              topLeft: Radius.circular(10),
                            )),
                      ),
                    ),
                    Container(
                      height: 40.h,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 3, 5, 88)
                              .withOpacity(.8)),
                      child: Container(
                        alignment: Alignment.center,
                        // color: Colors.amber,
                        width: MediaQuery.of(context).size.width,
                        margin:
                            EdgeInsets.only(top: 15.h, left: 2.w, right: 2.w),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(bottom: 20),
                              height: 40,
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.white),
                                borderRadius: BorderRadius.circular(
                                  40,
                                ),
                              ),
                              child: TabBar(
                                  onTap: (index) {
                                    if (index == 0) {
                                      setState(() {
                                        isRound = true;
                                      });
                                    } else {
                                      setState(() {
                                        isRound = false;
                                      });
                                    }
                                  },
                                  isScrollable: false,
                                  indicatorSize: TabBarIndicatorSize.tab,
                                  labelPadding: const EdgeInsets.symmetric(
                                      horizontal: 25),
                                  labelStyle: const TextStyle(
                                      color: AppConstants.primaryColor,
                                      fontWeight: FontWeight.bold),
                                  unselectedLabelColor: Colors.white,
                                  indicator: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(
                                      40,
                                    ),
                                  ),
                                  dividerHeight: 0,
                                  unselectedLabelStyle: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                  // ignore: prefer_const_literals_to_create_immutables
                                  tabs: [
                                    const Tab(
                                      child: Text("Return"),
                                    ),
                                    const Tab(
                                      child: Text("One-Way"),
                                    )
                                  ]),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                swapped
                                    ? _destinationSelectWidget(context)
                                    : _sourceSelectWidget(context),
                                InkWell(
                                    onTap: () {
                                      swapped = !swapped;
                                      setState(() {});
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.all(3),
                                      decoration: const BoxDecoration(
                                          color: Colors.white,
                                          shape: BoxShape.circle),
                                      child: const Icon(
                                        Icons.connecting_airports,
                                        size: 20,
                                        color: AppConstants.primaryColor,
                                      ),
                                    )),
                                swapped
                                    ? _sourceSelectWidget(context)
                                    : _destinationSelectWidget(context),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: 3.h,
                      left: 0,
                      right: 0,
                      child: Image.asset(
                        "assets/images/yellow-logo.png",
                        height: 100,
                      ),
                    ),
                    Positioned(
                      right: 2.w,
                      top: 7.h,
                      child: InkWell(
                        onTap: () {
                          selectedIndex = 2;
                          BlocProvider.of<UpdateTripInfoBloc>(context)
                              .add(NavigateEvent());
                          // Navigator.push(context,
                          //     customPageRoute(const NotificationScreen()));
                        },
                        child: Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.white),
                              borderRadius: BorderRadius.circular(5)),
                          child: const Icon(
                            Icons.notifications,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Expanded(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                InkWell(
                                  onTap: () {
                                    DatePicker.showDatePicker(context,
                                        showTitleActions: true,
                                        minTime: DateTime.now(),
                                        maxTime: DateTime.now()
                                            .add(const Duration(days: 700)),
                                        onChanged: (date) {},
                                        onConfirm: (date) {
                                      var res =
                                          getDayAndMonthName(date.toString());
                                      List<String> words = res.split(",");
                                      tripInfo["date"] = words[0];
                                      tripInfo["day"] = words[1];
                                      tripInfo["month"] = words[2];

                                      BlocProvider.of<UpdateTripInfoBloc>(
                                              context)
                                          .add(UpdateTripInfo(
                                              source: const {},
                                              destination: const {}));
                                    }, currentTime: DateTime.now());
                                  },
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.symmetric(
                                          horizontal: 15,
                                        ),
                                        child: const Text(
                                          "Departure Date",
                                          style: TextStyle(
                                              color: AppConstants.textGrey,
                                              fontSize:
                                                  AppConstants.mediumFont),
                                        ),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.symmetric(
                                          horizontal: 15,
                                        ),
                                        child: Row(children: [
                                          Text(
                                            tripInfo["date"] ?? "",
                                            style: const TextStyle(
                                                color:
                                                    AppConstants.primaryColor,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 56),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                tripInfo["month"] != null
                                                    ? tripInfo["month"]
                                                        .substring(0, 3)
                                                    : "",
                                                style: const TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize:
                                                        AppConstants.largeFont),
                                              ),
                                              Text(
                                                tripInfo["day"] ?? "",
                                                style: const TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: AppConstants
                                                        .mediumFont),
                                              ),
                                            ],
                                          ),
                                        ]),
                                      ),
                                      Container(
                                        width: 50.w,
                                        height: 1,
                                        color: AppConstants.grey300,
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(left: 15),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      InkWell(
                                        onTap: () => _showCabinClass(),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            const Text(
                                              "Cabin Class",
                                              style: TextStyle(
                                                  color: AppConstants.textGrey,
                                                  fontSize:
                                                      AppConstants.mediumFont),
                                            ),
                                            Text(
                                              selectedCabin,
                                              style: const TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize:
                                                      AppConstants.largeFont),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              width: 1,
                              height: 25.h,
                              color: AppConstants.grey300,
                            ),
                            InkWell(
                              onTap: !isRound
                                  ? null
                                  : () {
                                      DatePicker.showDatePicker(context,
                                          showTitleActions: true,
                                          minTime: DateTime.now(),
                                          maxTime: DateTime.now()
                                              .add(const Duration(days: 700)),
                                          onChanged: (date) {},
                                          onConfirm: (date) {
                                        var res =
                                            getDayAndMonthName(date.toString());
                                        List<String> words = res.split(",");
                                        tripInfo["return"]["date"] = words[0];
                                        tripInfo["return"]["day"] = words[1];
                                        tripInfo["return"]["month"] = words[2];

                                        BlocProvider.of<UpdateTripInfoBloc>(
                                                context)
                                            .add(UpdateTripInfo(
                                                source: const {},
                                                destination: const {}));
                                      }, currentTime: DateTime.now());
                                    },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  !isRound
                                      ? Container()
                                      : Container(
                                          margin: const EdgeInsets.symmetric(
                                            horizontal: 15,
                                          ),
                                          child: const Text(
                                            "Return Date",
                                            style: TextStyle(
                                                color: AppConstants.textGrey,
                                                fontSize:
                                                    AppConstants.mediumFont),
                                          ),
                                        ),
                                  !isRound
                                      ? Container(
                                          height: 13.h,
                                        )
                                      : Container(
                                          margin: const EdgeInsets.symmetric(
                                            horizontal: 15,
                                          ),
                                          child: Row(children: [
                                            Text(
                                              tripInfo["return"] == null
                                                  ? ""
                                                  : tripInfo["return"]
                                                          ["date"] ??
                                                      "",
                                              style: const TextStyle(
                                                  letterSpacing: 0,
                                                  color:
                                                      AppConstants.primaryColor,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 56),
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            !isRound
                                                ? Container()
                                                : Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        tripInfo["return"] ==
                                                                null
                                                            ? ""
                                                            : tripInfo["return"]
                                                                    ["month"] ??
                                                                "",
                                                        style: const TextStyle(
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize:
                                                                AppConstants
                                                                    .largeFont),
                                                      ),
                                                      Text(
                                                        tripInfo["return"] ==
                                                                null
                                                            ? ""
                                                            : tripInfo["return"]
                                                                    ["day"] ??
                                                                "",
                                                        style: const TextStyle(
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontSize:
                                                                AppConstants
                                                                    .mediumFont),
                                                      ),
                                                    ],
                                                  ),
                                          ]),
                                        ),
                                  Container(
                                    width: 49.6.w,
                                    height: 1,
                                    color: AppConstants.grey300,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      _showPassengers();
                                    },
                                    child: Container(
                                      margin: const EdgeInsets.symmetric(
                                        horizontal: 15,
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          const Text(
                                            "Passengers",
                                            style: TextStyle(
                                                color: AppConstants.textGrey,
                                                fontSize:
                                                    AppConstants.mediumFont),
                                          ),
                                          Row(
                                            children: [
                                              const Icon(
                                                Icons.man,
                                                color: AppConstants.iconGrey,
                                              ),
                                              Text(
                                                adult.toString(),
                                                style: const TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize:
                                                        AppConstants.largeFont),
                                              ),
                                              const SizedBox(
                                                width: 1,
                                              ),
                                              const Icon(
                                                Icons.man,
                                                size: 18,
                                                color: AppConstants.iconGrey,
                                              ),
                                              Text(
                                                children.toString(),
                                                style: const TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize:
                                                        AppConstants.largeFont),
                                              ),
                                              const SizedBox(
                                                width: 15,
                                              ),
                                              const Icon(
                                                Icons.girl,
                                                size: 20,
                                                color: AppConstants.iconGrey,
                                              ),
                                              Text(
                                                infant.toString(),
                                                style: const TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize:
                                                        AppConstants.largeFont),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Container(
                          width: 100.w,
                          height: 1,
                          color: AppConstants.grey300,
                        ),
                      ]),
                ),
                Container(
                  height: 50,
                  width: 80.w,
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(vertical: 5.h),
                  decoration: BoxDecoration(
                    color: AppConstants.secondaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Text(
                    "Search Flights",
                    style: TextStyle(
                        color: AppConstants.primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: AppConstants.largeFont),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }

  InkWell _destinationSelectWidget(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            CustomPageRoute(
                child: const SearchAirportScreen(
              isSource: false,
            )));
      },
      child: SizedBox(
        width: 40.w,
        height: 130,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              swapped ? "From" : "To",
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: AppConstants.smallFont,
                  fontWeight: FontWeight.normal),
            ),
            infos["destination"] == null
                ? Container(
                    height: 35,
                  )
                : Text(
                    infos["destination"] == null
                        ? ""
                        : infos["destination"]["code"] ?? "",
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 34,
                        fontWeight: FontWeight.w900),
                  ),
            Text(
              infos["destination"] == null
                  ? swapped
                      ? "destination"
                      : "Select Destination"
                  : infos["destination"]["city"] ?? "",
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: AppConstants.smallFont,
                  fontWeight: FontWeight.normal),
            ),
            Text(
              infos["destination"] == null
                  ? ""
                  : infos["destination"]["airport"] ?? "",
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: AppConstants.smallFont,
                  fontWeight: FontWeight.normal),
            ),
          ],
        ),
      ),
    );
  }

  InkWell _sourceSelectWidget(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            CustomPageRoute(
                child: const SearchAirportScreen(
              isSource: true,
            )));
      },
      child: Container(
        width: 40.w,
        height: 130,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              swapped ? "To" : "From",
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: AppConstants.smallFont,
                  fontWeight: FontWeight.normal),
            ),
            Text(
              infos["source"] == null
                  ? airports[0]["code"]!
                  : infos["source"]["code"] ?? "",
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 34,
                  fontWeight: FontWeight.w900),
            ),
            Text(
              infos["source"] == null
                  ? airports[0]["city"]!
                  : infos["source"]["city"] ?? "",
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: AppConstants.smallFont,
                  fontWeight: FontWeight.normal),
            ),
            Text(
              infos["source"] == null
                  ? airports[0]["airport"]!
                  : infos["source"]["airport"] ?? "",
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: AppConstants.smallFont,
                  fontWeight: FontWeight.normal),
            ),
          ],
        ),
      ),
    );
  }

  _showCabinClass() {
    return showModalBottomSheet(
        backgroundColor: Colors.transparent,
        isScrollControlled: true,
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(builder: (context, setState) {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              height: 25.h,
              decoration: const BoxDecoration(
                color: Colors.white,
                // borderRadius: BorderRadius.only(
                //     topLeft: Radius.circular(40),
                //     topRight: Radius.circular(40)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Cabin Class",
                        style: TextStyle(
                            color: AppConstants.grey700,
                            fontWeight: FontWeight.bold,
                            fontSize: AppConstants.largeFont),
                      ),
                      Text(
                        "Cancel",
                        style: TextStyle(
                            color: AppConstants.primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: AppConstants.mediumFont),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        selectedCabin = "Economy";
                        tripInfo["selectedCabin"] = "Economy";
                        BlocProvider.of<UpdateTripInfoBloc>(context).add(
                            UpdateTripInfo(
                                source: const {}, destination: const {}));
                      });
                      Navigator.pop(context);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Economy",
                          style: TextStyle(
                              color: AppConstants.black,
                              fontWeight: FontWeight.bold,
                              fontSize: AppConstants.mediumFont),
                        ),
                        selectedCabin != "Economy"
                            ? Container()
                            : const Icon(Icons.check)
                      ],
                    ),
                  ),
                  const Divider(),
                  const SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        selectedCabin = "Bussiness";
                      });
                      tripInfo["selectedCabin"] = "Economy";
                      BlocProvider.of<UpdateTripInfoBloc>(context).add(
                          UpdateTripInfo(
                              source: const {}, destination: const {}));
                      Navigator.pop(context);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Bussiness",
                          style: TextStyle(
                              color: AppConstants.black,
                              fontWeight: FontWeight.bold,
                              fontSize: AppConstants.mediumFont),
                        ),
                        selectedCabin != "Bussiness"
                            ? Container()
                            : const Icon(Icons.check)
                      ],
                    ),
                  ),
                  const Divider(),
                  const SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        selectedCabin = "First";
                      });
                      tripInfo["selectedCabin"] = "First";
                      BlocProvider.of<UpdateTripInfoBloc>(context).add(
                          UpdateTripInfo(
                              source: const {}, destination: const {}));
                      Navigator.pop(context);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "First",
                          style: TextStyle(
                              color: AppConstants.black,
                              fontWeight: FontWeight.bold,
                              fontSize: AppConstants.mediumFont),
                        ),
                        selectedCabin != "First"
                            ? Container()
                            : const Icon(Icons.check)
                      ],
                    ),
                  ),
                  const Divider()
                ],
              ),
            );
          });
        });
  }

  _showPassengers() {
    return showModalBottomSheet(
        backgroundColor: Colors.transparent,
        isScrollControlled: true,
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(builder: (context, setState) {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              height: 25.h,
              decoration: const BoxDecoration(
                color: Colors.white,
                // borderRadius: BorderRadius.only(
                //     topLeft: Radius.circular(40),
                //     topRight: Radius.circular(40)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Passengers",
                        style: TextStyle(
                            color: AppConstants.grey700,
                            fontWeight: FontWeight.bold,
                            fontSize: AppConstants.largeFont),
                      ),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: const Text(
                              "Cancel",
                              style: TextStyle(
                                  color: AppConstants.primaryColor,
                                  fontWeight: FontWeight.normal,
                                  fontSize: AppConstants.mediumFont),
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          InkWell(
                            onTap: () {
                              BlocProvider.of<UpdateTripInfoBloc>(context).add(
                                  UpdateTripInfo(
                                      source: const {}, destination: const {}));
                              Navigator.pop(context);
                            },
                            child: const Text(
                              "Done",
                              style: TextStyle(
                                  color: AppConstants.primaryColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: AppConstants.mediumFont),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Adult",
                        style: TextStyle(
                            color: AppConstants.primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: AppConstants.mediumFont),
                      ),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              if (adult > 0) {
                                setState(() {
                                  adult -= 1;
                                });
                              }
                            },
                            child: const Icon(
                              Icons.remove_circle_outline,
                              size: 20,
                              color: AppConstants.primaryColor,
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            adult.toString(),
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: AppConstants.mediumFont),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                adult += 1;
                              });
                            },
                            child: const Icon(
                              Icons.add_circle_outline,
                              size: 20,
                              color: AppConstants.primaryColor,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Row(
                        children: [
                          Text(
                            "Children",
                            style: TextStyle(
                                color: AppConstants.primaryColor,
                                fontWeight: FontWeight.bold,
                                fontSize: AppConstants.mediumFont),
                          ),
                          Text(
                            "  2-12 Years",
                            style: TextStyle(
                                color: AppConstants.textGrey,
                                fontWeight: FontWeight.bold,
                                fontSize: AppConstants.smallFont),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              if (children > 0) {
                                setState(() {
                                  children -= 1;
                                });
                              }
                            },
                            child: const Icon(
                              Icons.remove_circle_outline,
                              size: 20,
                              color: AppConstants.primaryColor,
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            children.toString(),
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: AppConstants.mediumFont),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                children += 1;
                              });
                            },
                            child: const Icon(
                              Icons.add_circle_outline,
                              size: 20,
                              color: AppConstants.primaryColor,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Row(
                        children: [
                          Text(
                            "Infant",
                            style: TextStyle(
                                color: AppConstants.primaryColor,
                                fontWeight: FontWeight.bold,
                                fontSize: AppConstants.mediumFont),
                          ),
                          Text(
                            "  <2 Years",
                            style: TextStyle(
                                color: AppConstants.textGrey,
                                fontWeight: FontWeight.bold,
                                fontSize: AppConstants.smallFont),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              if (infant > 0) {
                                setState(() {
                                  infant -= 1;
                                });
                              }
                            },
                            child: const Icon(
                              Icons.remove_circle_outline,
                              size: 20,
                              color: AppConstants.primaryColor,
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            infant.toString(),
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: AppConstants.mediumFont),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                infant += 1;
                              });
                            },
                            child: const Icon(
                              Icons.add_circle_outline,
                              size: 20,
                              color: AppConstants.primaryColor,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            );
          });
        });
  }
}
