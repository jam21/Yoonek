class Event {
  final double applicationId;
  final String dateFrom;
  final String dateTo;
  final String description;
  final double employeeId;
  final double eventId;
  final String eventName;
  final double orgId;

  Event({
    required this.applicationId,
    required this.dateFrom,
    required this.dateTo,
    required this.description,
    required this.employeeId,
    required this.eventId,
    required this.eventName,
    required this.orgId,
  });

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      applicationId: json['APPLICATION_ID'] as double,
      dateFrom: json['DATE_FROM'] as String,
      dateTo: json['DATE_TO'] as String,
      description: json['DESCRIPTION'] as String,
      employeeId: json['EMPLOYEE_ID'] as double,
      eventId: json['EVENT_ID'] as double,
      eventName: json['EVENT_NAME'] as String,
      orgId: json['ORG_ID'] as double,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'APPLICATION_ID': applicationId,
      'DATE_FROM': dateFrom,
      'DATE_TO': dateTo,
      'DESCRIPTION': description,
      'EMPLOYEE_ID': employeeId,
      'EVENT_ID': eventId,
      'EVENT_NAME': eventName,
      'ORG_ID': orgId,
    };
  }
}
