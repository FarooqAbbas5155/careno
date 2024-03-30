class HostIdentity{
  String hostId,insurancePath,idFrontPath,idBackPath;

//<editor-fold desc="Data Methods">
  HostIdentity({
    required this.hostId,
    required this.insurancePath,
    required this.idFrontPath,
    required this.idBackPath,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is HostIdentity &&
          runtimeType == other.runtimeType &&
          hostId == other.hostId &&
          insurancePath == other.insurancePath &&
          idFrontPath == other.idFrontPath &&
          idBackPath == other.idBackPath);

  @override
  int get hashCode =>
      hostId.hashCode ^
      insurancePath.hashCode ^
      idFrontPath.hashCode ^
      idBackPath.hashCode;

  @override
  String toString() {
    return 'HostIdentity{' +
        ' hostId: $hostId,' +
        ' insurancePath: $insurancePath,' +
        ' idFrontPath: $idFrontPath,' +
        ' idBackPath: $idBackPath,' +
        '}';
  }

  HostIdentity copyWith({
    String? hostId,
    String? insurancePath,
    String? idFrontPath,
    String? idBackPath,
  }) {
    return HostIdentity(
      hostId: hostId ?? this.hostId,
      insurancePath: insurancePath ?? this.insurancePath,
      idFrontPath: idFrontPath ?? this.idFrontPath,
      idBackPath: idBackPath ?? this.idBackPath,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'hostId': this.hostId,
      'insurancePath': this.insurancePath,
      'idFrontPath': this.idFrontPath,
      'idBackPath': this.idBackPath,
    };
  }

  factory HostIdentity.fromMap(Map<String, dynamic> map) {
    return HostIdentity(
      hostId: map['hostId'] as String,
      insurancePath: map['insurancePath'] as String,
      idFrontPath: map['idFrontPath'] as String,
      idBackPath: map['idBackPath'] as String,
    );
  }

//</editor-fold>
}