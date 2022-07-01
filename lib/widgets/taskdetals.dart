import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:rigxtodo/widgets/memberswidget.dart';
import 'package:rigxtodo/widgets/tasklist.dart';

class TaskDetails extends StatefulWidget {
  String title, images;
  TaskDetails(this.images, this.title, {Key? key}) : super(key: key);

  @override
  State<TaskDetails> createState() => _TaskDetailsState();
}

class _TaskDetailsState extends State<TaskDetails>
    with TickerProviderStateMixin {
  //TickerProviderStateMixin allows the fade out/ fade in animation when changing the active tab button

  //this will control the button clicks and tab changing
  late TabController _controller;

  //this will control the animation when a button changes from an off state to an on state
  late AnimationController _animationControllerOn;
  late AnimationController _animationControllerOff;

  //this will give the background color values of a button when it changes to an on state
  late Animation _colorTweenBackgroundOn;
  late Animation _colorTweenBackgroundoff;

  //this will give the foreground color values of a button when it changes to an on state
  late Animation _colorTweenForegroundOn;
  late Animation _colorTweenForegroundoff;

  late Animation _tweenFontSizeOn;
  late Animation _twenFontSizeOff;

//when swapping, the _controller.index value only changes after the animation, therefor, we need this to trigger the animations and save the current index
  int _currentIndex = 0;

  // saves the previous active tab
  int _prevControllerIndex = 0;

  //saves the value of the tab animation.  it's used to figure the direction of the animation
  double _aniValue = 0.0;

  double _prevAniValue = 0.0;

  final List _tabName = [
    'Task',
    'Team Members',
  ];

  //active button's foreground color
  final Color _foregroundOn = Colors.white;
  final Color _foregroundOff = Colors.black;

  //active button's Background color
  final Color _backgroundOn = Colors.blueAccent;
  final Color _backgroundOff = Colors.white;

  final double _fontsizeOn = 16;
  final double _fontSizeOff = 20;

  //scroll controller for the TabBar
  final ScrollController _scrollController = ScrollController();

  //this will save the key for each tab
  final List _keys = [];

  //regist if the button was tapped
  bool _buttonTap = false;

  @override
  void initState() {
    super.initState();
    for (int index = 0; index < _tabName.length; index++) {
      //create a globalky for each tab
      _keys.add(GlobalKey());
    }
//this creates the controllers for each tab
    _controller = TabController(length: _tabName.length, vsync: this);
    //this execute the  fnction every time there's a swipe animation
    _controller.animation!.addListener(_handleTabAnimation);
    // this will execute the function very time the _controller.index values chages

    _controller.addListener(_handleTabChange);

    _animationControllerOff = AnimationController(
        vsync: this, duration: const Duration(microseconds: 75));

    //so the inactive buttons start in their final state
    _animationControllerOff.value = 1.0;
    _colorTweenForegroundoff =
        ColorTween(begin: _foregroundOn, end: _foregroundOff)
            .animate(_animationControllerOff);
    _colorTweenBackgroundoff =
        ColorTween(begin: _backgroundOn, end: _backgroundOff)
            .animate(_animationControllerOff);
    _twenFontSizeOff = Tween<double>(begin: _fontsizeOn, end: _fontSizeOff)
        .animate(_animationControllerOff);

    _animationControllerOn = AnimationController(
        vsync: this, duration: const Duration(microseconds: 150));

    //so the inactive buttons start in their final state
    _animationControllerOn.value = 1.0;
    _colorTweenForegroundOn =
        ColorTween(begin: _foregroundOff, end: _foregroundOn)
            .animate(_animationControllerOn);
    _colorTweenBackgroundOn =
        ColorTween(begin: _backgroundOff, end: _backgroundOn)
            .animate(_animationControllerOn);
    _tweenFontSizeOn = Tween<double>(begin: _fontSizeOff, end: _fontsizeOn)
        .animate(_animationControllerOn);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  _handleTabAnimation() {
    _aniValue = _controller.animation!.value;

    if (!_buttonTap && ((_aniValue - _prevAniValue).abs() < 1)) {
      _setCurrentIndex(_aniValue.round());
    }

    _prevAniValue = _aniValue;
  }

  _handleTabChange() {
    if (_buttonTap) _setCurrentIndex(_controller.index);

    if ((_controller.index == _prevControllerIndex) ||
        (_controller.index == _aniValue.round())) _buttonTap = false;

    _prevControllerIndex = _controller.index;
  }

  _setCurrentIndex(int index) {
    if (index != _currentIndex) {
      setState(() {
        _currentIndex = index;
      });

      _triggerAnimation();

      _scrollTo(index);
    }
  }

  _scrollTo(int index) {
    double screenwidth = MediaQuery.of(context).size.width;

    RenderBox renderBox = _keys[index].currentContext.findRenderObject();

    double size = renderBox.size.width;

    double position = renderBox.localToGlobal(Offset.zero).dx;

    double offset = (position + size / 2) - screenwidth / 2;

    if (offset < 0) {
      renderBox = _keys[0].currentContext.findRenderObject();

      position = renderBox.localToGlobal(Offset.zero).dx;

      if (position > offset) offset = position;
    } else {
      renderBox = _keys[_tabName.length - 1].currentContext.findRenderObject();

      position = renderBox.localToGlobal(Offset.zero).dx;

      size = renderBox.size.width;

      if (position + size < screenwidth) screenwidth = position + size;

      if (position + size - offset < screenwidth) {
        offset = position + size - screenwidth;
      }
    }

    _scrollController.animateTo(offset + _scrollController.offset,
        duration: const Duration(microseconds: 150), curve: Curves.easeInOut);
  }

  _triggerAnimation() {
    _animationControllerOn.reset();
    _animationControllerOff.reset();

    _animationControllerOn.forward();
    _animationControllerOff.forward();
  }

  _getBackgroundColor(int index) {
    if (index == _currentIndex) {
      return _colorTweenBackgroundOn.value;
    } else if (index == _prevControllerIndex) {
      return _colorTweenBackgroundoff.value;
    } else {
      return _backgroundOff;
    }
  }

  _getFontSize(int index) {
    if (index == _currentIndex) {
      return _tweenFontSizeOn.value;
    } else if (index == _prevControllerIndex) {
      return _twenFontSizeOff.value;
    } else {
      return _fontSizeOff;
    }
  }

  _getForegroundColor(int index) {
    if (index == _currentIndex) {
      return _colorTweenForegroundOn.value;
    } else if (index == _prevControllerIndex) {
      return _colorTweenForegroundoff.value;
    } else {
      return _foregroundOff;
    }
  }

  @override
  Widget build(BuildContext context) {
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
            child: Column(children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(
                  left: 12.0,
                  right: 12.0,
                  top: 30.0,
                  bottom: 8.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                        size: 20.0,
                      ),
                    ),
                    const Text(
                      'Task Detail',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                      ),
                    ),
                    Container(),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 12.0,
                  right: 12.0,
                  top: 30.0,
                  bottom: 8.0,
                ),
                child: Container(
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    image: DecorationImage(
                      opacity: 0.4,
                      image: AssetImage(
                        widget.images,
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 30,
                      bottom: 30,
                      left: 12,
                      right: 12,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.title,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            Row(
                              children: const [
                                Icon(
                                  Icons.timer,
                                  color: Colors.grey,
                                  size: 12,
                                ),
                                SizedBox(
                                  width: 6.0,
                                ),
                                Text(
                                  '3 days left',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Container(
                          height: 30,
                          decoration: BoxDecoration(
                            color: Colors.yellow.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: const Center(
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 22.0, vertical: 6.0),
                              child: Text(
                                "In Progress",
                                style: TextStyle(
                                  color: Colors.yellow,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 12.0,
                  right: 12.0,
                  top: 20.0,
                  bottom: 8.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Note:",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: const Text(
                        "Edit",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(
                  left: 12.0,
                  right: 12.0,
                  // top: 30.0,
                  bottom: 5.0,
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                    top: 5,
                    bottom: 5,
                  ),
                  child: Text(
                    "This is the note for this particular task. i hope this gose well just aeubuid udhdiffd dfgu gfdigfdgg fdgfdgfgfg dfgfdgfdgu dfgfdgfdg dfgfdgh.",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 8.0,
                  right: 8.0,
                  top: 10.0,
                  bottom: 8.0,
                ),
                child: SizedBox(
                  height: 60.0,
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    controller: _scrollController,
                    scrollDirection: Axis.horizontal,
                    itemCount: _tabName.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        key: _keys[index],
                        padding: const EdgeInsets.all(6.0),
                        child: ButtonTheme(
                            child: AnimatedBuilder(
                          animation: _colorTweenBackgroundOn,
                          builder: (context, child) => TextButton(
                            style: TextButton.styleFrom(
                                fixedSize: const Size(160, 60),
                                // primary: Colors.white,
                                backgroundColor: _getBackgroundColor(index)),
                            onPressed: () {
                              setState(() {
                                _buttonTap = true;

                                _controller.animateTo(index);
                                _setCurrentIndex(index);
                                _scrollTo(index);
                              });
                            },
                            child: Text(_tabName[index],
                                style: TextStyle(
                                  color: _getForegroundColor(index),
                                  fontSize: _getFontSize(index),
                                )),
                          ),
                        )),
                      );
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 10.0,
                  right: 10.0,
                  top: 5.0,
                  bottom: 5.0,
                ),
                child: SizedBox(
                  width: double.maxFinite,
                  height: 300,
                  child: TabBarView(
                      dragStartBehavior: DragStartBehavior.down,
                      physics: const BouncingScrollPhysics(),
                      controller: _controller,
                      children: <Widget>[
                        TaskList(_tabName[0]),
                        MembersWidget(_tabName[1])
                      ]),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 12.0,
                  right: 12.0,
                  top: 10.0,
                  bottom: 8.0,
                ),
                child: TextButton(
                  style: TextButton.styleFrom(
                      // fixedSize: const Size(150, 50),
                      // primary: Colors.white,
                      backgroundColor: Colors.blueAccent),
                  onPressed: () {
                    setState(() {});
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 22,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text('Add new task',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                            )),
                      ],
                    ),
                  ),
                ),
              )
            ]),
          ),
        ));
  }
}
