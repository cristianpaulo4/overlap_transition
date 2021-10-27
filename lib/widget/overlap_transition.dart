import 'dart:async';
import 'package:flutter/material.dart';
import '../controller/orverlap_transition_controller.dart';

class OverlapTransition extends StatefulWidget {
  final Widget primary;
  final Widget secundary;
  final Duration duration;
  final Curve curves;
  final OverlapTransitionController overlapTransitionController;
  bool? barrierDismissible;
  Color? backgroundColor;
  OverlapTransition({
    required this.primary,
    required this.secundary,
    required this.duration,
    required this.curves,
    required this.overlapTransitionController,
    this.backgroundColor,
    this.barrierDismissible,
  }) {
    backgroundColor = this.backgroundColor ?? Colors.black;
    barrierDismissible = this.barrierDismissible ?? true;
  }

  @override
  _OverlapTransitionState createState() => _OverlapTransitionState();
}

class _OverlapTransitionState extends State<OverlapTransition>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: widget.duration,
    );

    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: widget.backgroundColor,
      body: ValueListenableBuilder(
        valueListenable: widget.overlapTransitionController,
        builder: (context, value, _) {
          bool efeito = value as bool;

          if (efeito) {
            animationController.reverse();
          } else {
            animationController.forward();
          }

          return AnimatedBuilder(
            animation: animationController,
            builder: (context, snapshot) {
              var offset1 = Tween<Offset>(
                begin: Offset.zero,
                end: Offset(
                  0,
                  20,
                ),
              )
                  .animate(CurvedAnimation(
                      parent: animationController, curve: widget.curves))
                  .value;
              var offset2 = Tween<Offset>(
                begin: Offset(0, size.height),
                end: Offset(
                  0,
                  75,
                ),
              )
                  .animate(CurvedAnimation(
                      parent: animationController, curve: widget.curves))
                  .value;

              double scale = Tween<double>(begin: 1, end: .9)
                  .animate(animationController)
                  .value;

              double blur = Tween<double>(begin: 0, end: 40)
                  .animate(animationController)
                  .value;

              return Stack(
                children: [
                  IgnorePointer(
                    ignoring: animationController.isCompleted,
                    child: Transform.translate(
                      offset: offset1,
                      child: Transform.scale(
                        scale: scale,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(
                            10 * animationController.value,
                          ),
                          child: widget.primary,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onVerticalDragUpdate: (details) {
                      double up = details.primaryDelta! / 300;
                      if (widget.barrierDismissible!) {
                        animationController.value -= up;
                        if (animationController.value < .5) {
                          animationController.reverse();
                          widget.overlapTransitionController.reverse();
                        } else {
                          animationController.forward();
                          widget.overlapTransitionController.forward();
                        }
                      }
                    },
                    child: Transform.translate(
                      offset: offset2,
                      child: Container(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(
                            10 * animationController.value,
                          ),
                          child: widget.secundary,
                        ),
                        margin: EdgeInsets.only(bottom: 70),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black45,
                              blurRadius: blur,
                              spreadRadius: blur,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
