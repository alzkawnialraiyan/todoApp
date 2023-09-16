import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';

import '../components/defult_shape_con.dart';

// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});
//
//   get theme => null;
//
//   get darkTheme => null;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       drawer: const Drawer(),
//       appBar: AppBar(
//         elevation: 0,
//         backgroundColor: Colors.white,
//         title: const Text("My Events", style: TextStyle(
//           color: Colors.black
//         ),),
//         actions: [
//           const Icon(Icons.search),
//           IconButton(onPressed: (){
//             AdaptiveTheme(light: ThemeData(
//               brightness: Brightness.light,
//               primarySwatch: Colors.deepOrange,
//               hintColor: Colors.white,
//             ),
//                 initial: AdaptiveThemeMode.light,
//                 builder: (light, dark) => MaterialApp(
//                   theme: theme,
//                   darkTheme: darkTheme,
//                 ),);
//           },
//               icon: const Icon(Icons.nightlight))
//           // Icon(Icons.nightlight, color: Colors.black,)
//         ],
//         iconTheme: const IconThemeData(color: Colors.black),
//       ),
//       body: Container(
//         margin: const EdgeInsets.all(15),
//         child: Column(
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 const Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text("June 11, 2022", style: TextStyle(
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.grey
//                     ),),
//                     SizedBox(
//                       height: 3,
//                     ),
//                     Text("Today", style: TextStyle(
//                       fontSize: 25,
//                       fontWeight: FontWeight.bold
//                     ),)
//                   ],
//                 ),
//                 ElevatedButton(onPressed: (){},style:
//                 ButtonStyle(
//                     shape: MaterialStatePropertyAll(RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10)
//                     )),
//                     backgroundColor: const MaterialStatePropertyAll(
//                       Colors.deepOrange
//                     ),
//                   ),
//                     child: const Text("Add Event"),)
//               ],
//             ),
//             DatePicker(
//               DateTime.now(),
//               initialSelectedDate: DateTime.now(),
//               selectionColor: Colors.deepOrange,
//               selectedTextColor: Colors.white,
//               onDateChange: (date) {
//               },
//             ),
//             DefaultShape(
//                 text: "Watch Youtube",
//                 time: " 1:47 PM - 3:47 PM",
//                 date: "11 Jun, 2022"),
//             DefaultShape(
//                 text: "Go to Gym",
//                 time: " 3:47 PM - 6:00 PM",
//                 date: "11 Jun, 2022"),
//             DefaultShape(
//                 text: "Play Football",
//                 time: " 9:45 PM - 11:00 PM",
//                 date: "11 Jun, 2022"),
//           ],
//         ),
//       ),
//     );
//   }

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  bool change = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text("My Events", style: TextStyle(
            color: Colors.black
        ),),
        actions: [
          const Icon(Icons.search),
          IconButton(onPressed: (){
            setState(() {
              change = !change;
              // AdaptiveTheme.of(context).setLight();
            });
            change // call the functions
                ? AdaptiveTheme.of(context).setLight()
                : AdaptiveTheme.of(context).setDark();
          },
              icon: Icon( change ? Icons.nightlight : Icons.sunny)),
              // Icon(Icons.nightlight))
          // Icon(Icons.nightlight, color: Colors.black,)
        ],
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(15),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("June 11, 2022", style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey
                      ),),
                      SizedBox(
                        height: 3,
                      ),
                      Text("Today", style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold
                      ),)
                    ],
                  ),
                  ElevatedButton(onPressed: (){},style:
                  ButtonStyle(
                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                    )),
                    backgroundColor: const MaterialStatePropertyAll(
                        Colors.deepOrange
                    ),
                  ),
                    child: const Text("Add Event"),)
                ],
              ),
              DatePicker(
                DateTime.now(),
                initialSelectedDate: DateTime.now(),
                selectionColor: Colors.deepOrange,
                selectedTextColor: Colors.white,
                onDateChange: (date) {
                },
              ),
              DefaultShape(
                  text: "Watch Youtube",
                  time: " 1:47 PM - 3:47 PM",
                  date: "11 Jun, 2022"),
              DefaultShape(
                  text: "Go to Gym",
                  time: " 3:47 PM - 6:00 PM",
                  date: "11 Jun, 2022"),
              DefaultShape(
                  text: "Play Football",
                  time: " 9:45 PM - 11:00 PM",
                  date: "11 Jun, 2022"),
            ],
          ),
        ),
      ),
    );
  }
}
