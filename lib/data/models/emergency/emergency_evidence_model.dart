class EmergencyEvidenceModel {
  EmergencyEvidenceModel({
    required this.name,
    required this.path,
    required this.downloadUrl,
    required this.type,
    this.createdAt,
  });

  final String name;
  final String path;
  final String downloadUrl;
  final String type;
  final DateTime? createdAt;

  bool get isAudio => type == 'audio';

  bool get isVideo => type == 'video';

  bool get isPhoto => type == 'photo';
}
