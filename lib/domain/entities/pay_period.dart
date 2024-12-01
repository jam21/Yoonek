class PayPeriod {
  final double payPeriodDatesId;
  final String periodName;
  final double periodNumber;
  final int periodType;
  final String status;
  final String dateFrom;
  final String startDateMonth;
  final String startDateMonth1;
  final String dateTo;
  final String periodTypeDesc;

  // Constructor
  PayPeriod({
    required this.payPeriodDatesId,
    required this.periodName,
    required this.periodNumber,
    required this.periodType,
    required this.status,
    required this.dateFrom,
    required this.startDateMonth,
    required this.startDateMonth1,
    required this.dateTo,
    required this.periodTypeDesc,
  });

  // Manual fromJson
  factory PayPeriod.fromJson(Map<String, dynamic> json) {
    return PayPeriod(
      payPeriodDatesId: (json['PAYPERIODSDATESID'] as num).toDouble(),
      periodName: json['PERIODNAME'] as String,
      periodNumber: (json['PERIODNUMBER'] as num).toDouble(),
      periodType: json['PERIODTYPE'] as int,
      status: json['STATUS'] as String,
      dateFrom: json['STARTDATE'] as String,
      startDateMonth: json['STARTDATEMONTH'] as String,
      startDateMonth1: json['STARTDATEMONTH1'] as String,
      dateTo: json['ENDDATE'] as String,
      periodTypeDesc: json['PERIODTYPEDESC'] as String,
    );
  }

  // Manual toJson
  Map<String, dynamic> toJson() {
    return {
      'PAYPERIODSDATESID': payPeriodDatesId,
      'PERIODNAME': periodName,
      'PERIODNUMBER': periodNumber,
      'PERIODTYPE': periodType,
      'STATUS': status,
      'STARTDATE': dateFrom,
      'STARTDATEMONTH': startDateMonth,
      'STARTDATEMONTH1': startDateMonth1,
      'ENDDATE': dateTo,
      'PERIODTYPEDESC': periodTypeDesc,
    };
  }
}
