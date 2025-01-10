class Repository {
  int id;
  String name;
  int points;
  String update;
  String? description;
  String? linkRepository;

  Repository({
    required this.id,
    required this.name,
    required this.points,
    required this.update,
    this.description,
    this.linkRepository
  });

  factory Repository.fromJson(Map<String, dynamic> json) {
    return Repository(
      id: (json['id'] as num).toInt(),
      name: (json['name'] as String),
      points: (json['stargazers_count'] as num).toInt(),
      update: (json['updated_at'] as String),
      description: (json['description'] as String?) ?? '',
      linkRepository: (json['html_url'] as String?) ?? '',
    );
  }

}
