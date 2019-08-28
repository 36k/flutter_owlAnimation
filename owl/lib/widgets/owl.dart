import 'package:flutter/material.dart';
import 'dart:math' as math;

class _Owl extends StatelessWidget {
  Animation<double> leftTransfrom;
  Animation<double> rightTransform;
  Animation<double> show;
  final AnimationController controller;
  _Owl({Key key, this.controller}) : super(key: key) {
    leftTransfrom = Tween<double>(begin: -math.pi / 2, end: 0).animate(
        CurvedAnimation(
            parent: controller, curve: Interval(0.1, 1, curve: Curves.ease)));
    rightTransform = Tween<double>(begin: math.pi / 2, end: 0).animate(
        CurvedAnimation(
            parent: controller, curve: Interval(0.1, 1, curve: Curves.ease)));
    show = Tween<double>(begin: 1, end: 0).animate(CurvedAnimation(
        parent: controller, curve: Interval(0, 0.1, curve: Curves.ease)));
  }
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      builder: (buildContext, widget) {
        return ClipRect(
          child: Align(
            heightFactor: .85,
            child: Stack(
              children: <Widget>[
                Image(
                  image: AssetImage("assets/images/owl-login.png"),
                ),
                Positioned(
                  bottom: -16,
                  child: Opacity(
                      opacity: show.value,
                      child: Image(
                        image: AssetImage("assets/images/icon_hand.png"),
                        width: 48,
                      )),
                ),
                Positioned(
                  right: 0,
                  bottom: -16,
                  child: Opacity(
                      opacity: show.value,
                      child: Image(
                        image: AssetImage("assets/images/icon_hand.png"),
                        width: 48,
                      )),
                ),
                Positioned(
                  bottom: -22,
                  left: 58,
                  child: Transform.rotate(
                    angle: leftTransfrom.value,
                    alignment: Alignment.bottomRight,
                    child: Image(
                      image: AssetImage("assets/images/owl-login-arm-left.png"),
                      width: 48.0,
                    ),
                  ),
                ),
                Positioned(
                  right: 50,
                  bottom: -22,
                  child: Transform.rotate(
                    angle: rightTransform.value,
                    alignment: Alignment.bottomLeft,
                    child: Image(
                        image:
                            AssetImage("assets/images/owl-login-arm-right.png"),
                        width: 48.0),
                  ),
                ),
              ],
            ),
          ),
        );
      },
      animation: controller,
    );
  }
}

class OwlAnimation extends StatefulWidget {
  OwlAnimation({Key key}) : super(key: key);
  final _OwlAnimationState _owlAnimationState = _OwlAnimationState();
  _OwlAnimationState createState() => _owlAnimationState;
  void openEye() {
    _owlAnimationState._controller.reverse();
  }

  void closeEye() {
    _owlAnimationState._controller.forward();
  }
}

class _OwlAnimationState extends State<OwlAnimation>
    with TickerProviderStateMixin {
  AnimationController _controller;
  @override
  void initState() {
    _controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1500));
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _Owl(
      controller: _controller,
    );
  }
}
