class Announcement {
  final double applicationId;
  final String dateFrom;
  final String dateTo;
  final String description;
  final double announcementId;
  final String announcementName;
  final double orgId;
  final String url;
  final String filePath;

  Announcement({
    required this.applicationId,
    required this.dateFrom,
    required this.dateTo,
    required this.description,
    required this.announcementId,
    required this.announcementName,
    required this.orgId,
    required this.url,
    required this.filePath,
  });

  factory Announcement.fromJson(Map<String, dynamic> json) {
    return Announcement(
      applicationId: json['APPLICATION_ID'] as double,
      dateFrom: json['DATE_FROM'] as String,
      dateTo: json['DATE_TO'] as String,
      description: json['DESCRIPTION'] as String,
      announcementId: json['ANNOUNCEMENT_ID'] as double,
      announcementName: json['ANNOUNCEMENT_NAME'] as String,
      orgId: json['ORG_ID'] as double,
      url: json['URL'] as String,
      filePath: json['FILE_PATH'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'APPLICATION_ID': applicationId,
      'DATE_FROM': dateFrom,
      'DATE_TO': dateTo,
      'DESCRIPTION': description,
      'ANNOUNCEMENT_ID': announcementId,
      'ANNOUNCEMENT_NAME': announcementName,
      'ORG_ID': orgId,
      'URL': url,
      'FILE_PATH': filePath,
    };
  }
}
