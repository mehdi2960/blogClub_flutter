import 'package:blog_club/article.dart';
import 'package:blog_club/data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PostList extends StatelessWidget {
  const PostList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final posts = AppData.posts;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 24, left: 32),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Latest News',
                style: themeData.textTheme.headline5,
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'More',
                  style: TextStyle(
                    color: Color(0xff376AED),
                  ),
                ),
              )
            ],
          ),
        ),
        ListView.builder(
          physics:
              const ClampingScrollPhysics(), //Baraye Scroll Kardan 2Ta Mohtava
          itemCount: posts.length,
          // padding: const EdgeInsets.only(bottom: 40),
          itemExtent: 141,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            final post = posts[index];
            return InkWell(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const ArticleScreen()));
              },
              child: Container(
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
                        padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
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
                              crossAxisAlignment: CrossAxisAlignment.end,
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
                                  style: Theme.of(context).textTheme.bodyText2,
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
              ),
            );
          },
        )
      ],
    );
  }
}
