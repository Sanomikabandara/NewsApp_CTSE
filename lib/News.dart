class News{
  final String newsTitle;
  final String newsDescription;
  final String newsImagePath;
  final String id;


  News({this.newsTitle,this.newsDescription,this.newsImagePath,this.id});

  News.fromMap(Map<String,dynamic> data,String id):
      newsTitle=data["title"],
      newsDescription=data["description"],
      newsImagePath=data["image_path"],
      id=id;

  Map<String, dynamic> toMap() {
    return{
      "title" : newsTitle,
      "description":newsDescription,
      "image_path":newsImagePath
    };
  }
}