import 'package:json_annotation/json_annotation.dart';
part 'git_model.g.dart';

@JsonSerializable()
class GitModel {
  @JsonKey(name: 'login')
  final String login;
  @JsonKey(name: 'avatar_url')
  final String avatarUrl;
  @JsonKey(name: 'bio')
  final String? bio;
  @JsonKey(name: 'followers')
  final int followers;
  @JsonKey(name: 'following')
  final int following;
  @JsonKey(name: 'public_repos')
  final int publicRepos;
  @JsonKey(name: 'location')
  final String? location;
  @JsonKey(name: 'blog')
  final String? blog;
  @JsonKey(name: 'twitter_username')
  final String? twitterUsername;
  final String? company;
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'created_at')
  final String? createdAt;

  GitModel({
    required this.login,
    required this.avatarUrl,
    this.bio,
    required this.followers,
    required this.following,
    required this.publicRepos,
    this.location,
    this.blog,
    this.twitterUsername,
    this.company,
    this.name,
    this.createdAt,
  });

  factory GitModel.fromJson(Map<String, dynamic> json) =>
      _$GitModelFromJson(json);
  Map<String, dynamic> toJson() => _$GitModelToJson(this);
}
