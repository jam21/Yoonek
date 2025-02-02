class LeaveBalance {
  final String leaveType;
  final String name;
  final double total;
  final double availed;
  double get balance=> total-availed;

  LeaveBalance({
    required this.leaveType,
    required this.name,
    required this.total,
    required this.availed,
  });

  factory LeaveBalance.fromJson(Map<String, dynamic> json) {
    return LeaveBalance(
      leaveType: json['LEAVE_TYPE'] as String,
      name: json['NAME'] as String,
      total: json['LEAVE_COUNT'] as double,
      availed: json['AVAILED'] as double,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'LEAVE_TYPE': leaveType,
      'NAME': name,
      'TOTALCOUNT': total,
      'AVAILED': availed,
    };
  }
}
