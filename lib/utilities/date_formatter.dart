class DateFormatter {

  String formatDate(String date) {
    String year = date.substring(0, 4);
    String month = _convertMonth(date.substring(5, 7));
    String day = int.parse(date.substring(8, 10)).toString();
    String ampm;
    String hour = date.substring(11, 13);
    int hourParsed = int.parse(hour);
    if (hourParsed < 12 && hourParsed != 0) {
      hour = hourParsed.toString();
      ampm = 'AM';
    } else if (hourParsed > 12) {
      hour = (hourParsed - 12).toString();
      ampm = 'PM';
    } else if (hourParsed == 12) {
      ampm = 'PM';
    } else {
      // its midnight
      hour = '12';
      ampm = 'AM';
    }
    String minute = date.substring(14, 16);
    return '$month $day $year, $hour:$minute $ampm';
  }


  String _convertMonth(String month) {
    int monthNum = int.parse(month);
    switch (monthNum) {
      case 1:
        return 'January';
        break;
      case 2:
        return 'February';
        break;
      case 3:
        return 'March';
        break;
      case 4:
        return 'April';
        break;
      case 5:
        return 'May';
        break;
      case 6:
        return 'June';
        break;
      case 7:
        return 'July';
        break;
      case 8:
        return 'August';
        break;
      case 9:
        return 'Sept';
        break;
      case 10:
        return 'October';
        break;
      case 11:
        return 'November';
        break;
      case 12:
        return 'December';
        break;
      default:
        return '';
    }
  }
}
