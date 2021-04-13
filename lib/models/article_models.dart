class ArticleModel {
  String auther;
  String title;
  String description;
  String url;
  String urlToImage;
  String publishedAt;
  String content;

  ArticleModel(
      {this.auther,
      this.content,
      this.description,
      this.urlToImage,
      this.publishedAt,
      this.title,
      this.url});
}
