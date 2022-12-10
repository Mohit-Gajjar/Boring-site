import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class GetDemotivated extends StatefulWidget {
  const GetDemotivated({Key? key}) : super(key: key);

  @override
  State<GetDemotivated> createState() => _GetDemotivatedState();
}

class _GetDemotivatedState extends State<GetDemotivated> {
  void showAlert(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => const AlertDialog(
              content: Text(
                "Caution: Content on this is page can be abusive, Get Demotivated at your own risk.",
                style: TextStyle(fontSize: 30),
              ),
            ));
  }

  // @override
  // void initState() {
  //   getData();
  //   super.initState();
  // }

  String insult = "";
  getData() async {
    // ignore: prefer_typing_uninitialized_variables
    var response;
    String url = "http://evilinsult.com/generate_insult.php?lang=en&type=json";
    try {
      response = await Dio().get(url);
      print(response);
    } catch (e) {
      print(e);
    }
    setState(() {
      insult = response["insult"].toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    // Future.delayed(Duration.zero, () => showAlert(context));
    return const Scaffold(
      body: Center(
        child: Text("Coming Soon"),
      ),
    );
  }
}
// Scaffold(
//       body: Container(
//         margin: const EdgeInsets.symmetric(horizontal: 30),
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text(
//                 insult,
//                 textAlign: TextAlign.center,
//                 style:
//                     TextStyle(fontSize: MediaQuery.of(context).size.width / 20),
//               ),
//               const SizedBox(
//                 height: 10,
//               ),
//               SizedBox(
//                 height: 50,
//                 width: 200,
//                 child: OutlinedButton(
//                     onPressed: getData,
//                     style: ButtonStyle(
//                       foregroundColor: MaterialStateProperty.all(Colors.green),
//                       shape: MaterialStateProperty.all(RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(30.0))),
//                     ),
//                     child: const Text("Nice Try!!, One More")),
//               ),
//             ],
//           ),
//         ),
//       ),
//       bottomSheet: Text(
//         "Caution: The Content is displayed is not meant to insult, defame, abuse anyone, This is only for fun!! purpose, Please don't take this seriously!!!!!....",
//         textAlign: TextAlign.center,
//         style: TextStyle(fontSize: MediaQuery.of(context).size.width / 40),
//       ),
//     );