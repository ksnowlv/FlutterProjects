// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArticleInfo _$ArticleInfoFromJson(Map<String, dynamic> json) => ArticleInfo(
      Article.fromJson(json['article'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ArticleInfoToJson(ArticleInfo instance) =>
    <String, dynamic>{
      'article': instance.article.toJson(),
    };

Article _$ArticleFromJson(Map<String, dynamic> json) => Article(
      json['id'] as int,
      json['title'] as String,
      json['content'] as String,
      Author.fromJson(json['author'] as Map<String, dynamic>),
      (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
      (json['comments'] as List<dynamic>)
          .map((e) => Comments.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ArticleToJson(Article instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'content': instance.content,
      'author': instance.author.toJson(),
      'tags': instance.tags,
      'comments': instance.comments.map((e) => e.toJson()).toList(),
    };

Author _$AuthorFromJson(Map<String, dynamic> json) => Author(
      json['id'] as int,
      json['name'] as String,
    );

Map<String, dynamic> _$AuthorToJson(Author instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

Comments _$CommentsFromJson(Map<String, dynamic> json) => Comments(
      json['id'] as int,
      json['text'] as String,
      Author.fromJson(json['author'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CommentsToJson(Comments instance) => <String, dynamic>{
      'id': instance.id,
      'text': instance.text,
      'author': instance.author.toJson(),
    };
