class User{
   String uid,userType,phoneNumner,imageUrl,name,email,profileDescription,gender;
   int dob;
   double lat,lng;
   bool notification;

//<editor-fold desc="Data Methods">
  User({
    required this.uid,
    required this.userType,
    required this.phoneNumner,
    required this.imageUrl,
    required this.name,
    required this.email,
    required this.profileDescription,
    required this.gender,
    required this.dob,
    required this.lat,
    required this.lng,
    required this.notification,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is User &&
          runtimeType == other.runtimeType &&
          uid == other.uid &&
          userType == other.userType &&
          phoneNumner == other.phoneNumner &&
          imageUrl == other.imageUrl &&
          name == other.name &&
          email == other.email &&
          profileDescription == other.profileDescription &&
          gender == other.gender &&
          dob == other.dob &&
          lat == other.lat &&
          lng == other.lng &&
          notification == other.notification);

  @override
  int get hashCode =>
      uid.hashCode ^
      userType.hashCode ^
      phoneNumner.hashCode ^
      imageUrl.hashCode ^
      name.hashCode ^
      email.hashCode ^
      profileDescription.hashCode ^
      gender.hashCode ^
      dob.hashCode ^
      lat.hashCode ^
      lng.hashCode ^
      notification.hashCode;

  @override
  String toString() {
    return 'User{' +
        ' uid: $uid,' +
        ' userType: $userType,' +
        ' phoneNumner: $phoneNumner,' +
        ' imageUrl: $imageUrl,' +
        ' name: $name,' +
        ' email: $email,' +
        ' profileDescription: $profileDescription,' +
        ' gender: $gender,' +
        ' dob: $dob,' +
        ' lat: $lat,' +
        ' lng: $lng,' +
        ' notification: $notification,' +
        '}';
  }

  User copyWith({
    String? uid,
    String? userType,
    String? phoneNumner,
    String? imageUrl,
    String? name,
    String? email,
    String? profileDescription,
    String? gender,
    int? dob,
    double? lat,
    double? lng,
    bool? notification,
  }) {
    return User(
      uid: uid ?? this.uid,
      userType: userType ?? this.userType,
      phoneNumner: phoneNumner ?? this.phoneNumner,
      imageUrl: imageUrl ?? this.imageUrl,
      name: name ?? this.name,
      email: email ?? this.email,
      profileDescription: profileDescription ?? this.profileDescription,
      gender: gender ?? this.gender,
      dob: dob ?? this.dob,
      lat: lat ?? this.lat,
      lng: lng ?? this.lng,
      notification: notification ?? this.notification,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': this.uid,
      'userType': this.userType,
      'phoneNumner': this.phoneNumner,
      'imageUrl': this.imageUrl,
      'name': this.name,
      'email': this.email,
      'profileDescription': this.profileDescription,
      'gender': this.gender,
      'dob': this.dob,
      'lat': this.lat,
      'lng': this.lng,
      'notification': this.notification,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      uid: map['uid'] as String,
      userType: map['userType'] as String,
      phoneNumner: map['phoneNumner'] as String,
      imageUrl: map['imageUrl'] as String,
      name: map['name'] as String,
      email: map['email'] as String,
      profileDescription: map['profileDescription'] as String,
      gender: map['gender'] as String,
      dob: map['dob'] as int,
      lat: map['lat'] as double,
      lng: map['lng'] as double,
      notification: map['notification'] as bool,
    );
  }

//</editor-fold>
}