import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guzo_go_clone/bloc/update_trip_info_bloc/update_trip_info_bloc.dart';
import 'package:guzo_go_clone/constants/constants.dart';

class SearchAirportScreen extends StatefulWidget {
  final bool isSource;
  const SearchAirportScreen({super.key, required this.isSource});

  @override
  State<SearchAirportScreen> createState() => _SearchAirportScreenState();
}

class _SearchAirportScreenState extends State<SearchAirportScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20, top: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Select Airport",
                    style: TextStyle(
                        color: AppConstants.primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      "Cancel",
                      style: TextStyle(
                          color: AppConstants.primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(vertical: 10),
                  prefixIcon: const Icon(
                    Icons.search,
                    color: AppConstants.primaryColor,
                  ),
                  fillColor: AppConstants.grey200,
                  filled: true,
                  hintText: "Search",
                  hintStyle: const TextStyle(
                    color: AppConstants.textGrey,
                    fontWeight: FontWeight.normal,
                    fontSize: AppConstants.mediumFont,
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(15)),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(
              height: 5,
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: const Text(
                "Direct Airports",
                style: TextStyle(
                    color: AppConstants.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
            ),
            Expanded(
                child: ListView.builder(
                    itemCount: airports.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          widget.isSource
                              ? BlocProvider.of<UpdateTripInfoBloc>(context)
                                  .add(UpdateTripInfo(
                                      source: airports[index], destination: {}))
                              : BlocProvider.of<UpdateTripInfoBloc>(context)
                                  .add(UpdateTripInfo(
                                      source: {},
                                      destination: airports[index]));
                          Navigator.pop(context);
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          margin: const EdgeInsets.only(left: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  const Icon(Icons.airplanemode_on_rounded),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Expanded(
                                    child: Text(
                                      "${airports[index]["city"]}, ${airports[index]["airport"]} (${airports[index]["code"]})",
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: AppConstants.mediumFont,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                              const Divider()
                            ],
                          ),
                        ),
                      );
                    }))
          ],
        ),
      ),
    );
  }
}
