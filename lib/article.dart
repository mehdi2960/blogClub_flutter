import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ArticleScreen extends StatelessWidget {
  const ArticleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Scaffold(
      floatingActionButton: Container(
        width: 110,
        height: 48,
        decoration: BoxDecoration(
          color: const Color(0xff376AED),
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
              blurRadius: 5,
              color: Colors.blue,
            ),
          ],
        ),
        child: InkWell(
          onTap: () {
            showSnackBar(context, 'Like button is clicked');
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/img/icons/hand.png'),
              const SizedBox(
                width: 8,
              ),
              const Text(
                '2.1k',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverAppBar(
                pinned: true,
                floating: true,
                title: const Text('Article'),
                actions: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.more_horiz_rounded,
                    ),
                  ),
                ],
              ),
              SliverList(
                delegate: SliverChildListDelegate.fixed(
                  [
                    const Padding(
                      padding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                      child: Text(
                        'Four Things Every Woman Needs To Know',
                        style: TextStyle(
                          color: Color(0xff0D253C),
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(32, 16, 32, 16),
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/img/icons/profilePicture.png',
                            width: 48,
                            height: 48,
                            fit: BoxFit.cover,
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text(
                                  'Richard Gervain',
                                  style: TextStyle(
                                      color: Color(0xff2D4379),
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  '2m ago',
                                  style: TextStyle(
                                      fontSize: 12, color: Color(0xff7B8BB2)),
                                ),
                              ],
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              CupertinoIcons.bookmark,
                              color: Colors.blue,
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              CupertinoIcons.share,
                              color: Colors.blue,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Image.asset(
                      'assets/img/posts/2.png',
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(32, 32, 32, 16),
                      child: Text(
                        'A man’s sexuality is never your mind responsibility.',
                        style: TextStyle(
                          fontSize: 18,
                          color: Color(0xff0D253C),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(32, 0, 32, 32),
                      child: Text(
                        'This one got an incredible amount of backlash the last time I said it, so I’m going to say it again: a man’s sexuality is never, ever your responsibility, under any circumstances. Whether it’s the fifth date or your twentieth year of marriage, the correct determining factor for whether or not you have sex with your partner isn’t whether you ought to “take care of him” or “put out” because it’s been a while or he’s really horny — the correct determining factor for whether or not you have sex is whether or not you want to have sex.',
                        style: TextStyle(
                            fontSize: 14,
                            color: Color(0xff2D4379),
                            height: 1.6),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 116,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    themeData.colorScheme.surface,
                    themeData.colorScheme.surface.withOpacity(0),
                  ]
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      behavior: SnackBarBehavior.fixed,
    ));
  }
}
