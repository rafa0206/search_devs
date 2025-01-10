class Dev {
  int id;
  String? name;
  String nickname;
  int followers;
  int following;
  String? description;
  String? photo;
  String? company;
  String? location;
  String? email;
  String? link;
  String? twitter;

  Dev({
    required this.id,
    this.name,
    required this.nickname,
    required this.followers,
    required this.following,
    this.description,
    this.photo,
    this.company,
    this.location,
    this.email,
    this.link,
    this.twitter,
  });

  factory Dev.fromJson(Map<String, dynamic> json) {
    return Dev(
      id: (json['id'] as num).toInt(),
      name: (json['name'] as String?) ?? '',
      nickname: (json['login'] as String),
      followers: (json['followers'] as num).toInt(),
      following: (json['following'] as num).toInt(),
      description: (json['bio'] as String?) ?? '',
      photo: (json['avatar_url'] as String?) ?? '',
      company: (json['company'] as String?) ?? '',
      location: (json['location'] as String?) ?? '',
      email: (json['email'] as String?) ?? '',
      link: (json['blog'] as String?) ?? '',
      twitter: (json['twitter_username'] as String?) ?? '',
    );
  }

}
