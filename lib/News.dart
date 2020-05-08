/***************************************
    Developed by Gunarathna PMSSB IT1618800
 ****************************************/

//code for this page was inspired by following tutorial
//https://www.youtube.com/watch?v=BOztHbCIn0M&t=1034s

//model of the news item
class News {
  final String newsTitle;
  final String newsDescription;
  final String newsImagePath;
  final String id;

  News({this.newsTitle, this.newsDescription, this.newsImagePath, this.id});

  //map database read data to model
  News.fromMap(Map<String, dynamic> data, String id)
      : newsTitle = data["title"],
        newsDescription = data["description"],
        newsImagePath = data["image_path"],
        id = id;

  //map news model data to database model
  Map<String, dynamic> toMap() {
    return {
      "title": newsTitle,
      "description": newsDescription,
      "image_path": newsImagePath
    };
  }
}
