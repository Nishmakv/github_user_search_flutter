// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'git_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GitModel _$GitModelFromJson(Map<String, dynamic> json) => GitModel(
      login: json['login'] as String,
      avatarUrl: json['avatar_url'] as String,
      bio: json['bio'] as String?,
      followers: (json['followers'] as num).toInt(),
      following: (json['following'] as num).toInt(),
      publicRepos: (json['public_repos'] as num).toInt(),
      location: json['location'] as String?,
      blog: json['blog'] as String?,
      twitterUsername: json['twitter_username'] as String?,
      company: json['company'] as String?,
      name: json['name'] as String?,
      createdAt: json['created_at'] as String?,
    );

Map<String, dynamic> _$GitModelToJson(GitModel instance) => <String, dynamic>{
      'login': instance.login,
      'avatar_url': instance.avatarUrl,
      'bio': instance.bio,
      'followers': instance.followers,
      'following': instance.following,
      'public_repos': instance.publicRepos,
      'location': instance.location,
      'blog': instance.blog,
      'twitter_username': instance.twitterUsername,
      'company': instance.company,
      'name': instance.name,
      'created_at': instance.createdAt,
    };
