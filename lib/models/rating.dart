class Rating {
  String serviceId,vehicleId,userId;
  double avgRating;
  int num,timeStamp;

//<editor-fold desc="Data Methods">
  Rating({
    required this.serviceId,
    required this.vehicleId,
    required this.userId,
    required this.avgRating,
    required this.num,
    required this.timeStamp,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Rating &&
          runtimeType == other.runtimeType &&
          serviceId == other.serviceId &&
          vehicleId == other.vehicleId &&
          userId == other.userId &&
          avgRating == other.avgRating &&
          num == other.num &&
          timeStamp == other.timeStamp);

  @override
  int get hashCode =>
      serviceId.hashCode ^
      vehicleId.hashCode ^
      userId.hashCode ^
      avgRating.hashCode ^
      num.hashCode ^
      timeStamp.hashCode;

  @override
  String toString() {
    return 'Rating{' +
        ' serviceId: $serviceId,' +
        ' vehicleId: $vehicleId,' +
        ' userId: $userId,' +
        ' avgRating: $avgRating,' +
        ' num: $num,' +
        ' timeStamp: $timeStamp,' +
        '}';
  }

  Rating copyWith({
    String? serviceId,
    String? vehicleId,
    String? userId,
    double? avgRating,
    int? num,
    int? timeStamp,
  }) {
    return Rating(
      serviceId: serviceId ?? this.serviceId,
      vehicleId: vehicleId ?? this.vehicleId,
      userId: userId ?? this.userId,
      avgRating: avgRating ?? this.avgRating,
      num: num ?? this.num,
      timeStamp: timeStamp ?? this.timeStamp,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'serviceId': this.serviceId,
      'vehicleId': this.vehicleId,
      'userId': this.userId,
      'avgRating': this.avgRating,
      'num': this.num,
      'timeStamp': this.timeStamp,
    };
  }

  factory Rating.fromMap(Map<String, dynamic> map) {
    return Rating(
      serviceId: map['serviceId'] as String,
      vehicleId: map['vehicleId'] as String,
      userId: map['userId'] as String,
      avgRating: map['avgRating'] as double,
      num: map['num'] as int,
      timeStamp: map['timeStamp'] as int,
    );
  }

//</editor-fold>
}