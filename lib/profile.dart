import 'package:blog_club/data.dart';
import 'package:blog_club/post.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final posts = AppData.posts;

    return Scaffold(
      backgroundColor: const Color(0xffE6EAF1),
      appBar: AppBar(
        elevation: 0,
        title: const Text('Profile'),
        actions: const [
          Icon(Icons.more_horiz_rounded),
          SizedBox(
            width: 16,
          )
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(32, 10, 32, 32),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 20,
                        color: const Color(0xff5282FF).withOpacity(0.1),
                      ),
                    ],
                  ),
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(24, 16, 24, 16),
                        child: Row(
                          children: [
                            Image.asset('assets/img/stories/4.png'),
                            const SizedBox(
                              width: 14,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    '@joviedan',
                                    style: TextStyle(
                                      color: Color(0xff2D4379),
                                      fontSize: 14,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    'Jovi Daniel',
                                    style: TextStyle(
                                      color: Color(0xff0D253C),
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    'UX Designer',
                                    style: TextStyle(
                                      color: Color(0xff376AED),
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.fromLTRB(24, 0, 24, 8),
                        child: Text(
                          'About me',
                          style: TextStyle(
                            color: Color(0xff0D253C),
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.fromLTRB(24, 0, 24, 64),
                        child: Text(
                          'Madison Blackstone is a director of user experience design, with experience managing global teams.',
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xff2D4379),
                            height: 1.4,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  left: 64,
                  right: 64,
                  bottom: 0,
                  child: Container(
                    height: 68,
                    decoration: BoxDecoration(
                      color: const Color(0xff386BED),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: const Color(0xff2151CD),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text(
                                  '52',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  'Post',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                '250',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Text(
                                'Following',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                '4.5K',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Text(
                                'Followers',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 48,
            ),
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(32),
                  topRight: Radius.circular(32),
                ),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(32, 24, 32, 16),
                    child: Row(
                      children: [
                        const Expanded(
                          child: Text(
                            'My Posts',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.black),
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Image.asset('assets/img/icons/Grid.png'),
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Image.asset('assets/img/icons/Table.png'),
                        ),
                      ],
                    ),
                  ),
                  ListView.builder(
                    physics: const ClampingScrollPhysics(), //Baraye Scroll Kardan 2Ta Mohtava
                    itemCount: posts.length,
                    // padding: const EdgeInsets.only(bottom: 40),
                    itemExtent: 141,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      final post = posts[index];
                      return Container(
                        margin: const EdgeInsets.fromLTRB(32, 0, 32, 0),

                        // height: 149,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(32),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 20,
                              color: const Color(0xff5282FF).withOpacity(0.1),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/img/posts/${post.imageFileName}',
                            ),
                            Expanded(
                              child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(16, 0, 16, 0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      post.caption,
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700,
                                        color: Color(0xff376AED),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Text(
                                      post.title,
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Icon(
                                          CupertinoIcons.hand_thumbsup,
                                          size: 16,
                                          color: Theme.of(context)
                                              .textTheme
                                              .bodyText2!
                                              .color,
                                        ),
                                        const SizedBox(
                                          width: 4,
                                        ),
                                        Text(
                                          post.likes,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText2,
                                        ),
                                        const SizedBox(
                                          width: 16,
                                        ),
                                        Icon(
                                          CupertinoIcons.time,
                                          size: 16,
                                          color: Theme.of(context)
                                              .textTheme
                                              .bodyText2!
                                              .color,
                                        ),
                                        const SizedBox(
                                          width: 4,
                                        ),
                                        Text(post.likes),
                                        Expanded(
                                          child: Container(
                                            alignment: Alignment.centerRight,
                                            child: Icon(
                                              post.isBookmarked
                                                  ? CupertinoIcons.bookmark_fill
                                                  : CupertinoIcons.bookmark,
                                              size: 16,
                                              color: Theme.of(context)
                                                  .textTheme
                                                  .bodyText2!
                                                  .color,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
