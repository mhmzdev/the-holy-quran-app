part of '../app.dart';

extension SuperInt on int {
  // double un() => AppUnit.un(this);
  // double sp() => AppUnit.sp(this);
  // double font() => AppUnit.font(this);

  BorderRadius radius() => BorderRadius.circular(toDouble());
  BorderRadius top() => BorderRadius.vertical(top: Radius.circular(toDouble()));
  BorderRadius bottom() =>
      BorderRadius.vertical(bottom: Radius.circular(toDouble()));

  String formatHHMM([bool short = false]) {
    var minutes = this;
    final hours = (minutes / 60).truncate();
    minutes = (minutes % 60).truncate();

    final hoursStr = (hours).toString().padLeft(2, '0');
    final minutesStr = (minutes).toString().padLeft(2, '0');

    if (hours == 0) {
      if (!short) {
        return '$minutesStr mins';
      }
      return '${minutesStr}m';
    }

    if (!short) {
      return '$hoursStr hr $minutesStr mins';
    }
    return '${hoursStr}h ${minutesStr}m';
  }

  String get toMinutesOnly {
    final seconds = this;
    final secondsStr = (seconds % 60);
    return '$secondsStr mins';
  }

  String get toCountOnly {
    final count = this;
    return '$count times';
  }
}
