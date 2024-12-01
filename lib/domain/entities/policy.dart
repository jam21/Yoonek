class Policy {
  final double applicationId;
  final String dateFrom;
  final String? dateTo;
  final String description;
  final double policyAttachmentId;
  final String policyName;
  final double orgId;
  final String filePath;

  Policy({
    required this.applicationId,
    required this.dateFrom,
    this.dateTo,
    required this.description,
    required this.policyAttachmentId,
    required this.policyName,
    required this.orgId,
    required this.filePath,
  });

  factory Policy.fromJson(Map<String, dynamic> json) {
    return Policy(
      applicationId: json['APPLICATION_ID'] as double,
      dateFrom: json['DATE_FROM'] as String,
      dateTo: json['DATE_TO'] as String?,
      description: json['DESCRIPTION'] as String,
      policyAttachmentId: json['POLICY_ATTACHMENT_ID'] as double,
      policyName: json['POLICY_NAME'] as String,
      orgId: json['ORG_ID'] as double,
      filePath: json['FILE_PATH'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'APPLICATION_ID': applicationId,
      'DATE_FROM': dateFrom,
      'DATE_TO': dateTo,
      'DESCRIPTION': description,
      'POLICY_ATTACHMENT_ID': policyAttachmentId,
      'POLICY_NAME': policyName,
      'ORG_ID': orgId,
      'FILE_PATH': filePath,
    };
  }
}
