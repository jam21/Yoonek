class Supervisor {
  final double supervisorNo;
  final String employeeName;
  final String profilePic;

  Supervisor({
    required this.supervisorNo,
    required this.employeeName,
    required this.profilePic,
  });

  factory Supervisor.fromJson(Map<String, dynamic> json) {
    return Supervisor(
      supervisorNo: json['SUPERVISORNO'] as double,
      employeeName: json['EMPLOYEENAME'] as String,
      profilePic: json['PROFILE_PIC'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'SUPERVISORNO': supervisorNo,
      'EMPLOYEENAME': employeeName,
      'PROFILE_PIC': profilePic,
    };
  }
}
