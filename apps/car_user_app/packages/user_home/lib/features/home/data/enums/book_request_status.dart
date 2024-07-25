enum BookRequestStatus {
  requestSent,
  confirmed,
  cancelled;

  static BookRequestStatus fromString(String status) {
    switch (status) {
      case 'request_sent':
        return BookRequestStatus.requestSent;
      case 'confirmed':
        return BookRequestStatus.confirmed;
      case 'cancelled':
        return BookRequestStatus.cancelled;
      default:
        return BookRequestStatus.requestSent;
    }
  }

  String get value {
    switch (this) {
      case BookRequestStatus.requestSent:
        return 'request_sent';
      case BookRequestStatus.confirmed:
        return 'confirmed';
      case BookRequestStatus.cancelled:
        return 'cancelled';
    }
  }
}