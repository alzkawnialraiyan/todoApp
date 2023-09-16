import 'package:flutter/material.dart';

class DefaultShape extends StatelessWidget {
  DefaultShape({super.key, required this.text, required this.time, required this.date});

  String text;
  String date;
  String time;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        gradient: LinearGradient(colors: [
          Colors.deepOrange,
          Colors.deepOrangeAccent,
          Colors.deepOrangeAccent
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter),
        borderRadius: BorderRadius.all(Radius.circular(10))
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(text, style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white
              ),),
              IconButton(onPressed: (){
                showModalBottomSheet(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)), //for the round edges
                    builder: (context) {
                      return SizedBox(
                        height: MediaQuery.sizeOf(context).height*0.35,
                        child: Column(children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.blueAccent
                            ),
                            margin: const EdgeInsets.all(10),
                            padding: const EdgeInsets.all(5),
                            width: MediaQuery.sizeOf(context).width,
                            height: MediaQuery.sizeOf(context).height*0.08,
                            alignment: Alignment.center,
                            child: const Text("Done", style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold
                            ),),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.grey
                            ),
                            margin: const EdgeInsets.all(10),
                            padding: const EdgeInsets.all(5),
                            width: MediaQuery.sizeOf(context).width,
                            height: MediaQuery.sizeOf(context).height*0.08,
                            alignment: Alignment.center,
                            child: const Text("Archive", style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold
                            ),),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.red
                            ),
                            margin: const EdgeInsets.all(10),
                            padding: const EdgeInsets.all(5),
                            width: MediaQuery.sizeOf(context).width,
                            height: MediaQuery.sizeOf(context).height*0.08,
                            alignment: Alignment.center,
                            child: const Text("Delete", style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold
                            ),),
                          )
                        ]),
                      );
                    },
                    context: context,
                    isDismissible: true,//boolean if you want to be able to dismiss it
                );
              },
                  icon: const Icon(Icons.more_horiz, color: Colors.white,))
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            children: [
              const Icon(Icons.calendar_month, color: Colors.white,),
              Text(date, style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.white
              ),)
            ],
          ),
          Row(
            children: [
              const Icon(Icons.watch_later_outlined, color: Colors.white,),
              Text(time, style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.white
              ),)
            ],
          )
        ],
      ),
    );
  }
}
