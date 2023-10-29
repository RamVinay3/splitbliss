import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:splitbliss/colors.dart';
import 'package:splitbliss/navigations/app_top_navigation.dart';
import 'package:splitbliss/widgets/svg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  //that single thing will give us animation and seconds
  late bool _isMounted;

  @override
  void initState() {
    super.initState();
    _isMounted = true;
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    Future.delayed(Duration(seconds: 3), () {
      if (_isMounted) {
        Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (context) {
          return AppTopNavigation();
        }));
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _isMounted = false;
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appColors.primary,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          // mainAxisSize: MainAxisSize.min,
          children: [
            const SVG(svgPath: 'lib/svg/splashIcon.svg'),
            const SizedBox(
              height: 15,
            ),
            Text(
              'SplitBliss',
              style: GoogleFonts.robotoSerif(
                fontSize: 34,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
