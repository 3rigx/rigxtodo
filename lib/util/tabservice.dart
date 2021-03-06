/*  Padding(
                padding: const EdgeInsets.only(
                  left: 12.0,
                  right: 12.0,
                  top: 30.0,
                  bottom: 8.0,
                ),
                child: Column(mainAxisSize: MainAxisSize.min, children: [
                  SizedBox(
                    height: 49.0,
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
                              onPressed: () {
                                setState(() {
                                  _buttonTap = true;
          
                                  _controller.animateTo(index);
                                  _setCurrentIndex(index);
                                  _scrollTo(index);
                                });
                              },
                              child: Text(_tabName[index],
                                  style: const TextStyle(
                                    color: Colors.white,
                                  )),
                              style: TextButton.styleFrom(
                                  primary: Colors.blueAccent),
                            ),
                          )),
                        );
                      },
                    ),
                  ),
                  Flexible(
                    child:
                  ),
                ]),
              ), */

import 'package:flutter/cupertino.dart';

/*
//leaner progress bar
LinearPercentIndicator(
  animation: true,
  animationDuration: 1000,
  lineHeight: 20.0,
  percent: 10/100,
  center:Text("100" + "%", style: TextStyle(
    fontSize: 12.0,
    fontWeight: FontWeight.w600,
    color: Colors.black,

  ),),
  linearStrokeCap: LinearStrokeCap.roundAll,
  progressColor: Colors.blue,
  backgroudColor: Colors.grey,
),
      */      