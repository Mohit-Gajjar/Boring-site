import 'package:boaring_application/Screens/bored.dart';
import 'package:boaring_application/Screens/advice.dart';
import 'package:boaring_application/Screens/demotivate.dart';
import 'package:boaring_application/Screens/motivate.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => HomeState();
}

class HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "How's it feeling?",
              style:
                  TextStyle(fontSize: MediaQuery.of(context).size.width / 20),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 50,
              width: 170,
              child: OutlinedButton(
                  onPressed: (() => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const GettingBored()))),
                  style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all(Colors.green),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0))),
                  ),
                  child: const Text("Getting Bored")),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 50,
              width: 170,
              child: OutlinedButton(
                  onPressed: (() => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const GetAdvice()))),
                  style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all(Colors.green),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0))),
                  ),
                  child: const Text("Get Advice")),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 50,
              width: 170,
              child: OutlinedButton(
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const GetDemotivated())),
                  style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all(Colors.green),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0))),
                  ),
                  child: const Text("Get Demotivated")),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 50,
              width: 170,
              child: OutlinedButton(
                  onPressed: (() => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const GetMotivated()))),
                  style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all(Colors.green),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0))),
                  ),
                  child: const Text("Get Motivated")),
            ),
          ],
        ),
      ),
    );
  }
}
