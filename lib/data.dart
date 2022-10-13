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

class PostData {
  final int id;
  final String caption;
  final String title;
  final String likes;
  final String time;
  final bool isBookmarked;
  final String imageFileName;

  PostData(this.id, this.caption, this.title, this.likes, this.time,
      this.isBookmarked, this.imageFileName);
}

class OnBoardingItem {
  final String title;
  final String description;

  OnBoardingItem(this.title, this.description);
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
      Category(1001, 'Technology', '4.png'),
      Category(1002, 'Adventure', '2.png'),
      Category(1003, 'Technology', '3.png'),
      Category(1004, 'Adventure', '4.png'),
      Category(1005, 'Technolo', '3.png'),
    ];
  }

  static List<PostData> get posts {
    return [
      PostData(
        1001,
        'BIG DATA',
        'Why Big Data Needs Thick Data?',
        '2.1k',
        '2:00',
        true,
        '1.png',
      ),
      PostData(
        1002,
        'UX DESIGN',
        'Step design sprint for UX beginner',
        '2.1k',
        '2:00',
        false,
        '5.png',
      ),
    ];
  }

  static List<OnBoardingItem> get onBoardingItems {
    List<OnBoardingItem> items = [];
    for (var i = 0; i < 4; i++) {
      items.add(
        OnBoardingItem(
          'Read the article you want instantly',
          'You can read thousands of articles on Blog Club, save them in the application and share them with your loved ones.',
        ),
      );
    }
    return items;
  }
}
