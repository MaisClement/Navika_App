// 🐦 Flutter imports:
import 'package:flutter/material.dart';

extension TimeOfDayExtension on TimeOfDay {
  int compareTo(TimeOfDay other) {
    if (hour < other.hour) return -1;
    if (hour > other.hour) return 1;
    if (minute < other.minute) return -1;
    if (minute > other.minute) return 1;
    return 0;
  }

  TimeOfDay addMinutes(int minutes) {
    if (minutes == 0) {
      return this;
    } else {
      int mofd = hour * 60 + minute;
      int newMofd = ((minutes % 1440) + mofd + 1440) % 1440;
      if (mofd == newMofd) {
        return this;
      } else {
        int newHour = newMofd ~/ 60;
        int newMinute = newMofd % 60;
        return TimeOfDay(hour: newHour, minute: newMinute);
      }
    }
  }

  bool isBefore(TimeOfDay other) {
    if (hour < other.hour) {
      return true;
    } else if (hour == other.hour && minute < other.minute) {
      return true;
    }
    return false;
  }

  bool isAfter(TimeOfDay other) {
    if (hour > other.hour) {
      return true;
    } else if (hour == other.hour && minute > other.minute) {
      return true;
    }
    return false;
  }

  int difference(TimeOfDay other) {
    int thisMinutes = hour * 60 + minute;
    int otherMinutes = other.hour * 60 + other.minute;

    return (isBefore(other) ? -1 : 1) * (otherMinutes - thisMinutes);
  }
}
