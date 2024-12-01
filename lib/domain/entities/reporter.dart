class Reporter {
  final double assignmentId;
  final String dateFrom;
  final String dateTo;
  final String employeeName;
  final double employeeId;
  final double gradeId;
  final double locationId;
  final double payrollCalenderId;
  final double positionId;
  final String positionTitle;
  final String profilePic;
  final double shiftId;
  final double status;
  final String supervisorName;
  final double supervisorNo;
  final double organizationId;
  final double orgId;

  Reporter({
    required this.assignmentId,
    required this.dateFrom,
    required this.dateTo,
    required this.employeeName,
    required this.employeeId,
    required this.gradeId,
    required this.locationId,
    required this.payrollCalenderId,
    required this.positionId,
    required this.positionTitle,
    required this.profilePic,
    required this.shiftId,
    required this.status,
    required this.supervisorName,
    required this.supervisorNo,
    required this.organizationId,
    required this.orgId,
  });

  factory Reporter.fromJson(Map<String, dynamic> json) {
    return Reporter(
      assignmentId: json['ASSIGNMENTID'] as double,
      dateFrom: json['DATEFROM'] as String,
      dateTo: json['DATETO'] as String,
      employeeName: json['EMPLOYEENAME'] as String,
      employeeId: json['EMPLOYEEID'] as double,
      gradeId: json['GRADEID'] as double,
      locationId: json['LOCATIONID'] as double,
      payrollCalenderId: json['PAYROLLCALANDERID'] as double,
      positionId: json['POSITIONID'] as double,
      positionTitle: json['POSITIONTITLE'] as String,
      profilePic: json['PROFILE_PIC'] as String,
      shiftId: json['SHIFTID'] as double,
      status: json['STATUS'] as double,
      supervisorName: json['SUPERVISORNAME'] as String,
      supervisorNo: json['SUPERVISORNO'] as double,
      organizationId: json['ORGANIZATIONID'] as double,
      orgId: json['ORG_ID'] as double,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'ASSIGNMENTID': assignmentId,
      'DATEFROM': dateFrom,
      'DATETO': dateTo,
      'EMPLOYEENAME': employeeName,
      'EMPLOYEEID': employeeId,
      'GRADEID': gradeId,
      'LOCATIONID': locationId,
      'PAYROLLCALANDERID': payrollCalenderId,
      'POSITIONID': positionId,
      'POSITIONTITLE': positionTitle,
      'PROFILE_PIC': profilePic,
      'SHIFTID': shiftId,
      'STATUS': status,
      'SUPERVISORNAME': supervisorName,
      'SUPERVISORNO': supervisorNo,
      'ORGANIZATIONID': organizationId,
      'ORG_ID': orgId,
    };
  }
}
