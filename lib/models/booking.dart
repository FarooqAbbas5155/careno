class Booking {
  String bookingId, vehicleId, userId, hostId,status;
  String? reviewDescription;
  int bookingDate;
  bool completed;
  int startTime, EndTime, bookingTime;
  int startDate,EndDate;
  double latitude, longitude;
  double? rating;
  double price;
  bool? withdrawn;

//<editor-fold desc="Data Methods">
  Booking({
    required this.bookingId,
    required this.vehicleId,
    required this.userId,
    required this.hostId,
    required this.status,
    this.reviewDescription,
    required this.bookingDate,
    required this.completed,
    required this.startTime,
    required this.EndTime,
    required this.bookingTime,
    required this.startDate,
    required this.EndDate,
    required this.latitude,
    required this.longitude,
    this.rating,
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
          status == other.status &&
          reviewDescription == other.reviewDescription &&
          bookingDate == other.bookingDate &&
          completed == other.completed &&
          startTime == other.startTime &&
          EndTime == other.EndTime &&
          bookingTime == other.bookingTime &&
          startDate == other.startDate &&
          EndDate == other.EndDate &&
          latitude == other.latitude &&
          longitude == other.longitude &&
          rating == other.rating &&
          price == other.price &&
          withdrawn == other.withdrawn);

  @override
  int get hashCode =>
      bookingId.hashCode ^
      vehicleId.hashCode ^
      userId.hashCode ^
      hostId.hashCode ^
      status.hashCode ^
      reviewDescription.hashCode ^
      bookingDate.hashCode ^
      completed.hashCode ^
      startTime.hashCode ^
      EndTime.hashCode ^
      bookingTime.hashCode ^
      startDate.hashCode ^
      EndDate.hashCode ^
      latitude.hashCode ^
      longitude.hashCode ^
      rating.hashCode ^
      price.hashCode ^
      withdrawn.hashCode;

  @override
  String toString() {
    return 'Booking{' +
        ' bookingId: $bookingId,' +
        ' vehicleId: $vehicleId,' +
        ' userId: $userId,' +
        ' hostId: $hostId,' +
        ' status: $status,' +
        ' reviewDescription: $reviewDescription,' +
        ' bookingDate: $bookingDate,' +
        ' completed: $completed,' +
        ' startTime: $startTime,' +
        ' EndTime: $EndTime,' +
        ' bookingTime: $bookingTime,' +
        ' startDate: $startDate,' +
        ' EndDate: $EndDate,' +
        ' latitude: $latitude,' +
        ' longitude: $longitude,' +
        ' rating: $rating,' +
        ' price: $price,' +
        ' withdrawn: $withdrawn,' +
        '}';
  }

  Booking copyWith({
    String? bookingId,
    String? vehicleId,
    String? userId,
    String? hostId,
    String? status,
    String? reviewDescription,
    int? bookingDate,
    bool? completed,
    int? startTime,
    int? EndTime,
    int? bookingTime,
    int? startDate,
    int? EndDate,
    double? latitude,
    double? longitude,
    double? rating,
    double? price,
    bool? withdrawn,
  }) {
    return Booking(
      bookingId: bookingId ?? this.bookingId,
      vehicleId: vehicleId ?? this.vehicleId,
      userId: userId ?? this.userId,
      hostId: hostId ?? this.hostId,
      status: status ?? this.status,
      reviewDescription: reviewDescription ?? this.reviewDescription,
      bookingDate: bookingDate ?? this.bookingDate,
      completed: completed ?? this.completed,
      startTime: startTime ?? this.startTime,
      EndTime: EndTime ?? this.EndTime,
      bookingTime: bookingTime ?? this.bookingTime,
      startDate: startDate ?? this.startDate,
      EndDate: EndDate ?? this.EndDate,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      rating: rating ?? this.rating,
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
      'status': this.status,
      'reviewDescription': this.reviewDescription,
      'bookingDate': this.bookingDate,
      'completed': this.completed,
      'startTime': this.startTime,
      'EndTime': this.EndTime,
      'bookingTime': this.bookingTime,
      'startDate': this.startDate,
      'EndDate': this.EndDate,
      'latitude': this.latitude,
      'longitude': this.longitude,
      'rating': this.rating,
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
      status: map['status'] as String,
      reviewDescription: map['reviewDescription'] as String,
      bookingDate: map['bookingDate'] as int,
      completed: map['completed'] as bool,
      startTime: map['startTime'] as int,
      EndTime: map['EndTime'] as int,
      bookingTime: map['bookingTime'] as int,
      startDate: map['startDate'] as int,
      EndDate: map['EndDate'] as int,
      latitude: map['latitude'] as double,
      longitude: map['longitude'] as double,
      rating: map['rating'] as double,
      price: map['price'] as double,
      withdrawn: map['withdrawn'] as bool,
    );
  }

//</editor-fold>
}