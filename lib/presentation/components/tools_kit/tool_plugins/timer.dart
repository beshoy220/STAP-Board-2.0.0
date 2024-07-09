import 'package:flutter/material.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';

class Timer extends StatelessWidget {
  const Timer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.indigo[900],
      padding: const EdgeInsets.all(20),
      child: TimerCountdown(
        timeTextStyle: const TextStyle(
            fontWeight: FontWeight.bold, fontSize: 30, color: Colors.white),
        colonsTextStyle: const TextStyle(
            color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        descriptionTextStyle: const TextStyle(color: Colors.white),
        format: CountDownTimerFormat.daysHoursMinutesSeconds,
        endTime: DateTime.now().add(
          const Duration(
            // days: 5,
            // hours: 14,
            minutes: 1,
            seconds: 0,
          ),
        ),
        onEnd: () {
          debugPrint("Timer finished");
        },
      ),
    );
  }
}
