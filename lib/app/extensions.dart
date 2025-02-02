extension DateExtension on DateTime?{
  String toSlashedDDMMYYY(){      
    return this==null ? "" : "${this?.day.toString()}/${this?.month.toString()}/${this?.year.toString()}";
  }
}