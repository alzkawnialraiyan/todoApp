import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../components/defult_shape_con.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  bool change = true;
  DateTime selectedDate = DateTime.now();

  void _showDatePicker() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null && pickedDate != selectedDate) {
      setState(() {
        selectedDate = pickedDate;
      });
    }
  }

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
                   Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        DateFormat('dd MMM, yyyy').format(selectedDate),
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey
                      ),),
                      const SizedBox(
                        height: 3,
                      ),
                      const Text("Today", style: TextStyle(
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
                // DateTime.now(),
                selectedDate,
                initialSelectedDate: DateTime.now(),
                selectionColor: Colors.deepOrange,
                selectedTextColor: Colors.white,
                onDateChange: (date) {
                  setState(() {
                    selectedDate = date;
                  });
                },
              ),
              DefaultShape(
                  text: "Watch Youtube",
                  time: " 1:47 PM - 3:47 PM",
                  date: DateFormat('dd MMM, yyyy').format(selectedDate),),
              DefaultShape(
                  text: "Go to Gym",
                  time: " 3:47 PM - 6:00 PM",
                  date: DateFormat('dd MMM, yyyy').format(selectedDate),),
              DefaultShape(
                  text: "Play Football",
                  time: " 9:45 PM - 11:00 PM",
                  date: DateFormat('dd MMM, yyyy').format(selectedDate),),
            ],
          ),
        ),
      ),
    );
  }
}
