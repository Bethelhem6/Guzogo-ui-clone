import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:guzo_go_clone/bloc/update_trip_info_bloc/update_trip_info_bloc.dart';
import 'package:guzo_go_clone/screens/screens.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, screenType) {
      return MultiBlocProvider(
       providers: [
          BlocProvider(
                create: (context) => UpdateTripInfoBloc(
                  ),
              ),
       ],
        child: MaterialApp(
            title: 'Guzogo clone',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
                textTheme: GoogleFonts.leagueSpartanTextTheme(
                          Theme.of(context).textTheme),
            ),
            home: const OnboardingScreen()),
      );
    });
  }
}
