import 'package:flutter/material.dart';

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

  final List<String> _status = [
    '30%',
    '10%',
    '5%',
    '90%',
    '100%',
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
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.blue.withOpacity(0.4),
                            ),
                            child: Center(
                                child: Text(
                              _status[index],
                              style: const TextStyle(
                                  color: Colors.blueAccent, fontSize: 16),
                            )),
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
