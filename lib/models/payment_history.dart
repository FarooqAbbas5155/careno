class PaymentHistory {
  String id;
  String userId;
  String paymentMethod;
  String paymentAmount;
  String paymentStatus;
  int paymentDate;
  Map<String,dynamic> accountDetail;

//<editor-fold desc="Data Methods">
  PaymentHistory({
    required this.id,
    required this.userId,
    required this.paymentMethod,
    required this.paymentAmount,
    required this.paymentStatus,
    required this.paymentDate,
    required this.accountDetail,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PaymentHistory &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          userId == other.userId &&
          paymentMethod == other.paymentMethod &&
          paymentAmount == other.paymentAmount &&
          paymentStatus == other.paymentStatus &&
          paymentDate == other.paymentDate &&
          accountDetail == other.accountDetail);

  @override
  int get hashCode =>
      id.hashCode ^
      userId.hashCode ^
      paymentMethod.hashCode ^
      paymentAmount.hashCode ^
      paymentStatus.hashCode ^
      paymentDate.hashCode ^
      accountDetail.hashCode;

  @override
  String toString() {
    return 'PaymentHistory{' +
        ' id: $id,' +
        ' userId: $userId,' +
        ' paymentMethod: $paymentMethod,' +
        ' paymentAmount: $paymentAmount,' +
        ' paymentStatus: $paymentStatus,' +
        ' paymentDate: $paymentDate,' +
        ' accountDetail: $accountDetail,' +
        '}';
  }

  PaymentHistory copyWith({
    String? id,
    String? userId,
    String? paymentMethod,
    String? paymentAmount,
    String? paymentStatus,
    int? paymentDate,
    Map<String, dynamic>? accountDetail,
  }) {
    return PaymentHistory(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      paymentAmount: paymentAmount ?? this.paymentAmount,
      paymentStatus: paymentStatus ?? this.paymentStatus,
      paymentDate: paymentDate ?? this.paymentDate,
      accountDetail: accountDetail ?? this.accountDetail,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'userId': this.userId,
      'paymentMethod': this.paymentMethod,
      'paymentAmount': this.paymentAmount,
      'paymentStatus': this.paymentStatus,
      'paymentDate': this.paymentDate,
      'accountDetail': this.accountDetail,
    };
  }

  factory PaymentHistory.fromMap(Map<String, dynamic> map) {
    return PaymentHistory(
      id: map['id'] as String,
      userId: map['userId'] as String,
      paymentMethod: map['paymentMethod'] as String,
      paymentAmount: map['paymentAmount'] as String,
      paymentStatus: map['paymentStatus'] as String,
      paymentDate: map['paymentDate'] as int,
      accountDetail: map['accountDetail'] as Map<String, dynamic>,
    );
  }

//</editor-fold>
}