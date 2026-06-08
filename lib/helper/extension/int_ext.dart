extension WordCountExt on int {
  String getWordCountText() {
    if (this > 1) {
      return '$this Services';
    } else if (this == 1) {
      return '$this Service';
    } else {
      return '0 Service';
    }
  }
}

extension IntExt on int {
  /// Example:
  /// 1st Booking
  /// 2nd Booking
  /// 3rd Booking
  /// 4th Booking
  String getSuffix() {
    String suffix;

    if (this % 100 >= 11 && this % 100 <= 13) {
      suffix = 'th';
    } else if (this % 10 == 1) {
      suffix = 'st';
    } else if (this % 10 == 2) {
      suffix = 'nd';
    } else if (this % 10 == 3) {
      suffix = 'rd';
    } else {
      suffix = 'th';
    }

    return suffix;
  }

  /// Optional helper for booking text
  String get bookingText => '$this${getSuffix()} Booking';

  /// Optional helper for rating text
  String get ratingText => '$this Star';
}
