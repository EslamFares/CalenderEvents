import 'package:flutter/material.dart';

class MonthTitle extends StatelessWidget {
  final DateTime date;
  final DateTime previousDate;
  final String text;
  final bool isActive;
  final Function()? onTap;

  const MonthTitle({
    super.key,
    required this.date,
    required this.previousDate,
    required this.isActive,
    this.onTap,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    final isDateAfter = date.isAfter(previousDate);

    return InkWell(
      onTap: onTap,
      child: Container(
        height: 55,
        margin: EdgeInsets.only(
          right: isActive ? 10 : 0,
          left: isActive ? 10 : 0,
          top: isActive ? 0 : 10,
        ),
        decoration: BoxDecoration(
          color: isActive ? Colors.amber : Colors.grey,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
        child: Center(
          child: date.month != previousDate.month
              ? AnimatedSwitcher(
                  duration: const Duration(milliseconds: 500),
                  switchInCurve: Curves.easeInOut,
                  switchOutCurve: Curves.easeInOut,
                  transitionBuilder:
                      (Widget child, Animation<double> animation) {
                    final slideInAnimation = Tween<Offset>(
                      begin: isDateAfter
                          ? const Offset(1.0, 0.0)
                          : const Offset(-1.0, 0.0),
                      end: Offset.zero,
                    ).animate(animation);

                    if (child.key == ValueKey(date.toString())) {
                      return SlideTransition(
                        position: slideInAnimation,
                        child: FadeTransition(opacity: animation, child: child),
                      );
                    } else {
                      return FadeTransition(opacity: animation, child: child);
                    }
                  },
                  child: Text(
                    text,
                    key: ValueKey<String>(date.toString()),
                    style: const TextStyle(color: Colors.black, fontSize: 20),
                  ),
                )
              : Text(
                  text,
                  style: const TextStyle(color: Colors.black, fontSize: 20),
                ),
        ),
      ),
    );
  }
}
