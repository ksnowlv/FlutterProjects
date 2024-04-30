import 'package:json_annotation/json_annotation.dart'; 
  
part 'article_info.g.dart';


@JsonSerializable(explicitToJson: true)
  class ArticleInfo extends Object {

  @JsonKey(name: 'article')
  Article article;

  ArticleInfo(this.article,);

  factory ArticleInfo.fromJson(Map<String, dynamic> srcJson) => _$ArticleInfoFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ArticleInfoToJson(this);

}


@JsonSerializable(explicitToJson: true)
  class Article extends Object {

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'content')
  String content;

  @JsonKey(name: 'author')
  Author author;

  @JsonKey(name: 'tags')
  List<String> tags;

  @JsonKey(name: 'comments')
  List<Comments> comments;

  Article(this.id,this.title,this.content,this.author,this.tags,this.comments,);

  factory Article.fromJson(Map<String, dynamic> srcJson) => _$ArticleFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ArticleToJson(this);

}

  
@JsonSerializable(explicitToJson: true)
  class Author extends Object {

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'name')
  String name;

  Author(this.id,this.name,);

  factory Author.fromJson(Map<String, dynamic> srcJson) => _$AuthorFromJson(srcJson);

  Map<String, dynamic> toJson() => _$AuthorToJson(this);

}

  
@JsonSerializable(explicitToJson: true)
  class Comments extends Object {

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'text')
  String text;

  @JsonKey(name: 'author')
  Author author;

  Comments(this.id,this.text,this.author,);

  factory Comments.fromJson(Map<String, dynamic> srcJson) => _$CommentsFromJson(srcJson);

  Map<String, dynamic> toJson() => _$CommentsToJson(this);

}

  

