class Booking {
  String bookingId, vehicleId, userId, hostId,bookingStatus;
  String paymentStatus;
  String bookingType;
  int bookingStartDate,bookingEndDate;
  bool completed;
  int startTime, EndTime;
  double price;
  bool? withdrawn;

//<editor-fold desc="Data Methods">
  Booking({
    required this.bookingId,
    required this.vehicleId,
    required this.userId,
    required this.hostId,
    required this.bookingStatus,
    required this.paymentStatus,
    required this.bookingType,
    required this.bookingStartDate,
    required this.bookingEndDate,
    required this.completed,
    required this.startTime,
    required this.EndTime,
    required this.price,
    this.withdrawn,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Booking &&
          runtimeType == other.runtimeType &&
          bookingId == other.bookingId &&
          vehicleId == other.vehicleId &&
          userId == other.userId &&
          hostId == other.hostId &&
          bookingStatus == other.bookingStatus &&
          paymentStatus == other.paymentStatus &&
          bookingType == other.bookingType &&
          bookingStartDate == other.bookingStartDate &&
          bookingEndDate == other.bookingEndDate &&
          completed == other.completed &&
          startTime == other.startTime &&
          EndTime == other.EndTime &&
          price == other.price &&
          withdrawn == other.withdrawn);

  @override
  int get hashCode =>
      bookingId.hashCode ^
      vehicleId.hashCode ^
      userId.hashCode ^
      hostId.hashCode ^
      bookingStatus.hashCode ^
      paymentStatus.hashCode ^
      bookingType.hashCode ^
      bookingStartDate.hashCode ^
      bookingEndDate.hashCode ^
      completed.hashCode ^
      startTime.hashCode ^
      EndTime.hashCode ^
      price.hashCode ^
      withdrawn.hashCode;

  @override
  String toString() {
    return 'Booking{' +
        ' bookingId: $bookingId,' +
        ' vehicleId: $vehicleId,' +
        ' userId: $userId,' +
        ' hostId: $hostId,' +
        ' bookingStatus: $bookingStatus,' +
        ' paymentStatus: $paymentStatus,' +
        ' bookingType: $bookingType,' +
        ' bookingStartDate: $bookingStartDate,' +
        ' bookingEndDate: $bookingEndDate,' +
        ' completed: $completed,' +
        ' startTime: $startTime,' +
        ' EndTime: $EndTime,' +
        ' price: $price,' +
        ' withdrawn: $withdrawn,' +
        '}';
  }

  Booking copyWith({
    String? bookingId,
    String? vehicleId,
    String? userId,
    String? hostId,
    String? bookingStatus,
    String? paymentStatus,
    String? bookingType,
    int? bookingStartDate,
    int? bookingEndDate,
    bool? completed,
    int? startTime,
    int? EndTime,
    double? price,
    bool? withdrawn,
  }) {
    return Booking(
      bookingId: bookingId ?? this.bookingId,
      vehicleId: vehicleId ?? this.vehicleId,
      userId: userId ?? this.userId,
      hostId: hostId ?? this.hostId,
      bookingStatus: bookingStatus ?? this.bookingStatus,
      paymentStatus: paymentStatus ?? this.paymentStatus,
      bookingType: bookingType ?? this.bookingType,
      bookingStartDate: bookingStartDate ?? this.bookingStartDate,
      bookingEndDate: bookingEndDate ?? this.bookingEndDate,
      completed: completed ?? this.completed,
      startTime: startTime ?? this.startTime,
      EndTime: EndTime ?? this.EndTime,
      price: price ?? this.price,
      withdrawn: withdrawn ?? this.withdrawn,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'bookingId': this.bookingId,
      'vehicleId': this.vehicleId,
      'userId': this.userId,
      'hostId': this.hostId,
      'bookingStatus': this.bookingStatus,
      'paymentStatus': this.paymentStatus,
      'bookingType': this.bookingType,
      'bookingStartDate': this.bookingStartDate,
      'bookingEndDate': this.bookingEndDate,
      'completed': this.completed,
      'startTime': this.startTime,
      'EndTime': this.EndTime,
      'price': this.price,
      'withdrawn': this.withdrawn,
    };
  }

  factory Booking.fromMap(Map<String, dynamic> map) {
    return Booking(
      bookingId: map['bookingId'] as String,
      vehicleId: map['vehicleId'] as String,
      userId: map['userId'] as String,
      hostId: map['hostId'] as String,
      bookingStatus: map['bookingStatus'] as String,
      paymentStatus: map['paymentStatus'] as String,
      bookingType: map['bookingType'] as String,
      bookingStartDate: map['bookingStartDate'] as int,
      bookingEndDate: map['bookingEndDate'] as int,
      completed: map['completed'] as bool,
      startTime: map['startTime'] as int,
      EndTime: map['EndTime'] as int,
      price: map['price'] as double,
      withdrawn: map['withdrawn'] as bool,
    );
  }

//</editor-fold>
}