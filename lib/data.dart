class Story {
  final int id;
  final String name;
  final String imageFileName;
  final String iconFileName;
  final bool isViewed;

  Story(
    this.id,
    this.name,
    this.imageFileName,
    this.iconFileName,
    this.isViewed,
  );
}

class Category {
  final int id;
  final String title;
  final String imageFileName;

  Category(
    this.id,
    this.title,
    this.imageFileName,
  );
}

class AppData {
  static List<Story> get stories {
    return [
      Story(1001, 'Emelia', '1.png', '1.png', false),
      Story(1002, 'Maikel', '2.png', '2.png', false),
      Story(1003, 'Loka', '3.png', '3.png', true),
      Story(1004, 'Mesi', '4.png', '4.png', false),
      Story(1005, 'Raul', '5.png', '5.png', true),
    ];
  }

  static List<Category> get categories {
    return [
     Category(1001, 'Technology', '2.png'),
    ];
  }
}
