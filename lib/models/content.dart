class Content {
  String category;
  String type;
  String author;
  String title;
  String content;
  String description;
  String imageUrl;
  String url;

  // Content(
  //   {
  //     this.author,
  //     this.category,
  //     this.content,
  //     this.description,
  //     this.imageUrl,
  //     this.title,
  //     this.type,
  //     this.url
  //   }

  // );

  Content.fromMap(Map<String, dynamic> data) {
    category = data['category'];
    type = data['type'];
    author = data['author'];
    title = data['title'];
    content = data['content'];
    description = data['description'];
    imageUrl = data['imageUrl'];
    url = data['url'];
  }

  Map<String, dynamic> toMap() {
    return {
      'category': category,
      'type': type,
      'author': author,
      'title': title,
      'content': content,
      'description': description,
      'imageUrl': imageUrl,
      'url': url
    };
  }
}
