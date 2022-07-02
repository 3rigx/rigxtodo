import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class TaskList extends StatefulWidget {
  String button;
  TaskList(this.button, {Key? key}) : super(key: key);

  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  final List<String> _title = [
    'Get Inspiration',
    'Create UI',
    'Code FrontEnd',
    'Code BackEnd',
    'Hook Firebase',
  ];
  final List<String> _date = [
    '30 Jun 2022',
    '01 Jul 2022',
    '02 Jul 2022',
    '03 Jul 2022',
    '03 Jul 2022',
  ];

  final List<double> _status = [
    30.0,
    10.2,
    5.4,
    90.0,
    100.0,
  ];
  int _currentIndex = 0;

  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.transparent,
      ),
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        controller: _scrollController,
        scrollDirection: Axis.vertical,
        itemCount: _title.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
              padding: const EdgeInsets.all(6.0),
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Colors.white.withOpacity(1.0),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircularPercentIndicator(
                            radius: 40,
                            lineWidth: 10.0,
                            animation: true,
                            percent: _status[index] / 100,
                            center: _status[index] != 100.0
                                ? Text(
                                    _status[index].toString() + "%",
                                    style: const TextStyle(
                                        color: Colors.blueAccent, fontSize: 16),
                                  )
                                : const Icon(
                                    Icons.check,
                                    color: Colors.greenAccent,
                                  ),
                            backgroundColor: _status[index] != 100.0
                                ? Colors.blue.withOpacity(0.4)
                                : Colors.green.withOpacity(0.4),
                            circularStrokeCap: CircularStrokeCap.round,
                            progressColor: _status[index] != 100.0
                                ? Colors.blueAccent
                                : Colors.greenAccent,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                _title[index],
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500),
                              ),
                              const SizedBox(
                                height: 6,
                              ),
                              Text(
                                _date[index],
                                style: TextStyle(
                                  color: Colors.grey.withOpacity(0.7),
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.grey.withOpacity(0.7),
                      )
                    ],
                  ),
                ),
              ));
        },
      ),
    );
  }
}
