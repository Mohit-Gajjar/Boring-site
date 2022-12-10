import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class GetAdvice extends StatefulWidget {
  const GetAdvice({Key? key}) : super(key: key);

  @override
  State<GetAdvice> createState() => _GetAdviceState();
}

class _GetAdviceState extends State<GetAdvice> {
  @override
  void initState() {
    getData();
    super.initState();
  }

  String advice = "";
  getData() async {
    String url = "https://api.adviceslip.com/advice";
    final response = await http.get(Uri.parse(url));
    var jsonData = jsonDecode(response.body);
    setState(() {
      advice = jsonData['slip']["advice"].toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 30),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                advice,
                textAlign: TextAlign.center,
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
                    onPressed: getData,
                    style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all(Colors.green),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0))),
                    ),
                    child: const Text("Umm!!, Another")),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
