class AddHostVehicle{
  String hostId,vehicleId;
  String vehicleImageComplete,vehicleImageNumberPlate,vehicleImageRightSide,vehicleImageRear,vehicleImageInterior;
  String vehicleModel,vehicleCategory,vehicleYear,vehicleSeats,vehicleTransmission,vehicleFuleType,vehicleNumberPlate,vehicleColor,vehicleLicenseExpiryDate,vehiclePerDayRent,vehiclePerHourRent,vehicleRegistrationImage;
  String status;
  double rating;
  double latitude,longitude;

//<editor-fold desc="Data Methods">
  AddHostVehicle({
    required this.hostId,
    required this.vehicleId,
    required this.vehicleImageComplete,
    required this.vehicleImageNumberPlate,
    required this.vehicleImageRightSide,
    required this.vehicleImageRear,
    required this.vehicleImageInterior,
    required this.vehicleModel,
    required this.vehicleCategory,
    required this.vehicleYear,
    required this.vehicleSeats,
    required this.vehicleTransmission,
    required this.vehicleFuleType,
    required this.vehicleNumberPlate,
    required this.vehicleColor,
    required this.vehicleLicenseExpiryDate,
    required this.vehiclePerDayRent,
    required this.vehiclePerHourRent,
    required this.vehicleRegistrationImage,
    required this.status,
    required this.rating,
    required this.latitude,
    required this.longitude,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AddHostVehicle &&
          runtimeType == other.runtimeType &&
          hostId == other.hostId &&
          vehicleId == other.vehicleId &&
          vehicleImageComplete == other.vehicleImageComplete &&
          vehicleImageNumberPlate == other.vehicleImageNumberPlate &&
          vehicleImageRightSide == other.vehicleImageRightSide &&
          vehicleImageRear == other.vehicleImageRear &&
          vehicleImageInterior == other.vehicleImageInterior &&
          vehicleModel == other.vehicleModel &&
          vehicleCategory == other.vehicleCategory &&
          vehicleYear == other.vehicleYear &&
          vehicleSeats == other.vehicleSeats &&
          vehicleTransmission == other.vehicleTransmission &&
          vehicleFuleType == other.vehicleFuleType &&
          vehicleNumberPlate == other.vehicleNumberPlate &&
          vehicleColor == other.vehicleColor &&
          vehicleLicenseExpiryDate == other.vehicleLicenseExpiryDate &&
          vehiclePerDayRent == other.vehiclePerDayRent &&
          vehiclePerHourRent == other.vehiclePerHourRent &&
          vehicleRegistrationImage == other.vehicleRegistrationImage &&
          status == other.status &&
          rating == other.rating &&
          latitude == other.latitude &&
          longitude == other.longitude);

  @override
  int get hashCode =>
      hostId.hashCode ^
      vehicleId.hashCode ^
      vehicleImageComplete.hashCode ^
      vehicleImageNumberPlate.hashCode ^
      vehicleImageRightSide.hashCode ^
      vehicleImageRear.hashCode ^
      vehicleImageInterior.hashCode ^
      vehicleModel.hashCode ^
      vehicleCategory.hashCode ^
      vehicleYear.hashCode ^
      vehicleSeats.hashCode ^
      vehicleTransmission.hashCode ^
      vehicleFuleType.hashCode ^
      vehicleNumberPlate.hashCode ^
      vehicleColor.hashCode ^
      vehicleLicenseExpiryDate.hashCode ^
      vehiclePerDayRent.hashCode ^
      vehiclePerHourRent.hashCode ^
      vehicleRegistrationImage.hashCode ^
      status.hashCode ^
      rating.hashCode ^
      latitude.hashCode ^
      longitude.hashCode;


  @override
  String toString() {
    return 'AddHostVehicle{' +
        ' hostId: $hostId,' +
        ' vehicleId: $vehicleId,' +
        ' vehicleImageComplete: $vehicleImageComplete,' +
        ' vehicleImageNumberPlate: $vehicleImageNumberPlate,' +
        ' vehicleImageRightSide: $vehicleImageRightSide,' +
        ' vehicleImageRear: $vehicleImageRear,' +
        ' vehicleImageInterior: $vehicleImageInterior,' +
        ' vehicleModel: $vehicleModel,' +
        ' vehicleCategory: $vehicleCategory,' +
        ' vehicleYear: $vehicleYear,' +
        ' vehicleSeats: $vehicleSeats,' +
        ' vehicleTransmission: $vehicleTransmission,' +
        ' vehicleFuleType: $vehicleFuleType,' +
        ' vehicleNumberPlate: $vehicleNumberPlate,' +
        ' vehicleColor: $vehicleColor,' +
        ' vehicleLicenseExpiryDate: $vehicleLicenseExpiryDate,' +
        ' vehiclePerDayRent: $vehiclePerDayRent,' +
        ' vehiclePerHourRent: $vehiclePerHourRent,' +
        ' vehicleRegistrationImage: $vehicleRegistrationImage,' +
        ' status: $status,' +
        ' rating: $rating,' +
        ' latitude: $latitude,' +
        ' longitude: $longitude,' +
        '}';
  }


  AddHostVehicle copyWith({
    String? hostId,
    String? vehicleId,
    String? vehicleImageComplete,
    String? vehicleImageNumberPlate,
    String? vehicleImageRightSide,
    String? vehicleImageRear,
    String? vehicleImageInterior,
    String? vehicleModel,
    String? vehicleCategory,
    String? vehicleYear,
    String? vehicleSeats,
    String? vehicleTransmission,
    String? vehicleFuleType,
    String? vehicleNumberPlate,
    String? vehicleColor,
    String? vehicleLicenseExpiryDate,
    String? vehiclePerDayRent,
    String? vehiclePerHourRent,
    String? vehicleRegistrationImage,
    String? status,
    double? rating,
    double? latitude,
    double? longitude,
  }) {
    return AddHostVehicle(
      hostId: hostId ?? this.hostId,
      vehicleId: vehicleId ?? this.vehicleId,
      vehicleImageComplete: vehicleImageComplete ?? this.vehicleImageComplete,
      vehicleImageNumberPlate: vehicleImageNumberPlate ??
          this.vehicleImageNumberPlate,
      vehicleImageRightSide: vehicleImageRightSide ??
          this.vehicleImageRightSide,
      vehicleImageRear: vehicleImageRear ?? this.vehicleImageRear,
      vehicleImageInterior: vehicleImageInterior ?? this.vehicleImageInterior,
      vehicleModel: vehicleModel ?? this.vehicleModel,
      vehicleCategory: vehicleCategory ?? this.vehicleCategory,
      vehicleYear: vehicleYear ?? this.vehicleYear,
      vehicleSeats: vehicleSeats ?? this.vehicleSeats,
      vehicleTransmission: vehicleTransmission ?? this.vehicleTransmission,
      vehicleFuleType: vehicleFuleType ?? this.vehicleFuleType,
      vehicleNumberPlate: vehicleNumberPlate ?? this.vehicleNumberPlate,
      vehicleColor: vehicleColor ?? this.vehicleColor,
      vehicleLicenseExpiryDate: vehicleLicenseExpiryDate ??
          this.vehicleLicenseExpiryDate,
      vehiclePerDayRent: vehiclePerDayRent ?? this.vehiclePerDayRent,
      vehiclePerHourRent: vehiclePerHourRent ?? this.vehiclePerHourRent,
      vehicleRegistrationImage: vehicleRegistrationImage ??
          this.vehicleRegistrationImage,
      status: status ?? this.status,
      rating: rating ?? this.rating,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
    );
  }


  Map<String, dynamic> toMap() {
    return {
      'hostId': this.hostId,
      'vehicleId': this.vehicleId,
      'vehicleImageComplete': this.vehicleImageComplete,
      'vehicleImageNumberPlate': this.vehicleImageNumberPlate,
      'vehicleImageRightSide': this.vehicleImageRightSide,
      'vehicleImageRear': this.vehicleImageRear,
      'vehicleImageInterior': this.vehicleImageInterior,
      'vehicleModel': this.vehicleModel,
      'vehicleCategory': this.vehicleCategory,
      'vehicleYear': this.vehicleYear,
      'vehicleSeats': this.vehicleSeats,
      'vehicleTransmission': this.vehicleTransmission,
      'vehicleFuleType': this.vehicleFuleType,
      'vehicleNumberPlate': this.vehicleNumberPlate,
      'vehicleColor': this.vehicleColor,
      'vehicleLicenseExpiryDate': this.vehicleLicenseExpiryDate,
      'vehiclePerDayRent': this.vehiclePerDayRent,
      'vehiclePerHourRent': this.vehiclePerHourRent,
      'vehicleRegistrationImage': this.vehicleRegistrationImage,
      'status': this.status,
      'rating': this.rating,
      'latitude': this.latitude,
      'longitude': this.longitude,
    };
  }

  factory AddHostVehicle.fromMap(Map<String, dynamic> map) {
    return AddHostVehicle(
      hostId: map['hostId'] as String,
      vehicleId: map['vehicleId'] as String,
      vehicleImageComplete: map['vehicleImageComplete'] as String,
      vehicleImageNumberPlate: map['vehicleImageNumberPlate'] as String,
      vehicleImageRightSide: map['vehicleImageRightSide'] as String,
      vehicleImageRear: map['vehicleImageRear'] as String,
      vehicleImageInterior: map['vehicleImageInterior'] as String,
      vehicleModel: map['vehicleModel'] as String,
      vehicleCategory: map['vehicleCategory'] as String,
      vehicleYear: map['vehicleYear'] as String,
      vehicleSeats: map['vehicleSeats'] as String,
      vehicleTransmission: map['vehicleTransmission'] as String,
      vehicleFuleType: map['vehicleFuleType'] as String,
      vehicleNumberPlate: map['vehicleNumberPlate'] as String,
      vehicleColor: map['vehicleColor'] as String,
      vehicleLicenseExpiryDate: map['vehicleLicenseExpiryDate'] as String,
      vehiclePerDayRent: map['vehiclePerDayRent'] as String,
      vehiclePerHourRent: map['vehiclePerHourRent'] as String,
      vehicleRegistrationImage: map['vehicleRegistrationImage'] as String,
      status: map['status'] as String,
      rating: map['rating'] as double,
      latitude: map['latitude'] as double,
      longitude: map['longitude'] as double,
    );
  }


//</editor-fold>
}