import 'package:flutter/material.dart';
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
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    gradient: const LinearGradient(
                        colors: [
                          Color(0xFF1b1e44),
                          Color.fromARGB(255, 34, 37, 83),
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        tileMode: TileMode.clamp)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        //  crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.blueAccent,
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                child: const Center(
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 22.0, vertical: 6.0),
                                    child: Text('Total task created',
                                        //TODO:: add current date to above
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 10,
                                        )),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20),
                              const Center(
                                child: Padding(
                                  padding: EdgeInsets.all(6.0),
                                  child: Text('20',
                                      style: TextStyle(
                                        color: Colors.white,
                                        //   fontSize: 18,
                                      )),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.blueAccent,
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                child: const Center(
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 22.0, vertical: 6.0),
                                    child: Text('Total task due',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 10,
                                        )),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20),
                              const Center(
                                child: Padding(
                                  padding: EdgeInsets.all(6.0),
                                  child: Text('6',
                                      style: TextStyle(
                                        color: Colors.white,
                                        //   fontSize: 18,
                                      )),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.blueAccent,
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                child: const Center(
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 22.0, vertical: 6.0),
                                    child: Text('Total task completed',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 10,
                                        )),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20),
                              const Center(
                                child: Padding(
                                  padding: EdgeInsets.all(6.0),
                                  child: Text('14',
                                      style: TextStyle(
                                        color: Colors.white,
                                        //   fontSize: 18,
                                      )),
                                ),
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
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
