import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:rigxtodo/util/customIcons.dart';
import 'package:rigxtodo/util/data.dart';
import 'package:rigxtodo/widgets/cardscrollwidget.dart';

class HomeTodo extends StatefulWidget {
  const HomeTodo({Key? key}) : super(key: key);

  @override
  State<HomeTodo> createState() => _HomeTodoState();
}

var cardAspectRatio = 12.0 / 16.0;
var widgetAspectRatio = cardAspectRatio * 1.2;

class _HomeTodoState extends State<HomeTodo> {
  var currentPage = images.length - 1.0;
  var currentTaskDuePage = images.length - 1.0;
  @override
  Widget build(BuildContext context) {
    PageController controller = PageController(initialPage: images.length - 1);
    controller.addListener(() {
      setState(() {
        currentPage = controller.page!;
      });
    });
    PageController controllerTaskDue =
        PageController(initialPage: images.length - 1);
    controllerTaskDue.addListener(() {
      setState(() {
        currentTaskDuePage = controllerTaskDue.page!;
      });
    });
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [
            Color(0xFF1b1e44),
            Color(0xFF2d3447),
          ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              tileMode: TileMode.clamp)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(
                    left: 12.0, right: 12.0, top: 30.0, bottom: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                      icon: const Icon(
                        CustomIcons.menu,
                        color: Colors.white,
                        size: 30.0,
                      ),
                      onPressed: () {},
                    ),
                    //change to profile image
                    IconButton(
                      icon: const Icon(
                        Icons.person,
                        color: Colors.white,
                        size: 30.0,
                      ),
                      onPressed: () {},
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    const Text("Tasks Todo",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 46.0,
                          fontFamily: "Calibre-Semibold",
                          letterSpacing: 1.0,
                        )),
                    //TODO:: add a button to change list based on todays task or all tasks
                    IconButton(
                      icon: const Icon(
                        CustomIcons.option,
                        size: 12.0,
                        color: Colors.white,
                      ),
                      onPressed: () {},
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Row(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFFff6e6e),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: const Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 22.0, vertical: 6.0),
                          child: Text("All tasks",
                              style: TextStyle(color: Colors.white)),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 15.0,
                    ),
                    //TODO:: add total numbers gotten
                    const Text("25+ tasks",
                        style: TextStyle(color: Colors.blueAccent))
                  ],
                ),
              ),
              Stack(
                children: <Widget>[
                  CardScrollWidget(currentPage),
                  Positioned.fill(
                    bottom: 50.0,
                    child: PageView.builder(
                      itemCount: images.length,
                      controller: controller,
                      reverse: true,
                      itemBuilder: (context, index) {
                        return Container();
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    const Text("Due",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 46.0,
                          fontFamily: "Calibre-Semibold",
                          letterSpacing: 1.0,
                        )),
                    IconButton(
                      icon: const Icon(
                        Icons.notifications,
                        size: 12.0,
                        color: Colors.white,
                      ),
                      onPressed: () {},
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Row(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: const Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 22.0, vertical: 6.0),
                          child: Text("As of today ",
                              //TODO:: add current date to above
                              style: TextStyle(color: Colors.white)),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 15.0,
                    ),
                    //TODO:: add number to task due
                    const Text("9+ tasks",
                        style: TextStyle(color: Colors.blueAccent))
                  ],
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 18.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: Image.asset("assets/image_02.jpg",
                          width: 296.0, height: 222.0),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Stack(
                children: <Widget>[
                  CardScrollWidget(currentTaskDuePage),
                  Positioned.fill(
                    child: PageView.builder(
                      itemCount: images.length,
                      controller: controllerTaskDue,
                      reverse: true,
                      itemBuilder: (context, index) {
                        return Container();
                      },
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 20.0, right: 20.0, bottom: 50.0),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.blueAccent.withOpacity(0.2)),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                'Evaluation',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 20,
                                ),
                              ),
                              Text(
                                'July, 2022',
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                CircularPercentIndicator(
                                  radius: 25,
                                  lineWidth: 5.0,
                                  animation: true,
                                  percent: (10 - 5) / 100,
                                  center: const Text(
                                    "5",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16),
                                  ),
                                  backgroundColor: Colors.blue.withOpacity(0.4),
                                  circularStrokeCap: CircularStrokeCap.round,
                                  progressColor: Colors.blueAccent,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text(
                                      'Completed',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 6,
                                    ),
                                    Text(
                                      "Activites",
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                CircularPercentIndicator(
                                  radius: 25,
                                  lineWidth: 6.0,
                                  animation: true,
                                  percent: (10 - 2) / 100,
                                  center: const Text(
                                    "2",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16),
                                  ),
                                  backgroundColor:
                                      Colors.green.withOpacity(0.4),
                                  circularStrokeCap: CircularStrokeCap.round,
                                  progressColor: Colors.greenAccent,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text(
                                      'Pending',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 6,
                                    ),
                                    Text(
                                      "Activites",
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.blueAccent,
          child: const Icon(
            Icons.new_label_sharp,
          ),
        ),
      ),
    );
  }
}
