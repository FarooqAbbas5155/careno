class Rating {
  String serviceId;
  double avgRating;
  int num;

//<editor-fold desc="Data Methods">

  Rating({
    required this.serviceId,
    required this.avgRating,
    required this.num,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Rating && runtimeType == other.runtimeType && serviceId == other.serviceId && avgRating == other.avgRating && num == other.num);

  @override
  int get hashCode => serviceId.hashCode ^ avgRating.hashCode ^ num.hashCode;

  @override
  String toString() {
    return 'Rating{' + ' serviceId: $serviceId,' + ' avgRating: $avgRating,' + ' num: $num,' + '}';
  }

  Rating copyWith({
    String? serviceId,
    double? avgRating,
    int? num,
  }) {
    return Rating(
      serviceId: serviceId ?? this.serviceId,
      avgRating: avgRating ?? this.avgRating,
      num: num ?? this.num,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'serviceId': this.serviceId,
      'avgRating': this.avgRating,
      'num': this.num,
    };
  }

  factory Rating.fromMap(Map<String, dynamic> map) {
    return Rating(
      serviceId: map['serviceId'] as String,
      avgRating: map['avgRating'] as double,
      num: map['num'] as int,
    );
  }

//</editor-fold>
}