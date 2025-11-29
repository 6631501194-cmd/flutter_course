import 'package:flutter/material.dart';


class PageviewDemo extends StatelessWidget {
  PageviewDemo({super.key});
  final int totalPages = 3;


  // This page controller is to control the PageView
  // ex: to get current page or to move to a specific page
  final PageController _pageController = PageController(
    initialPage: 0,
    viewportFraction: 0.8,
  );


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pageview'),
        actions: [
          IconButton(onPressed: nextPage, icon: const Icon(Icons.skip_next))
        ],
      ),
      body: PageView.builder(
        controller: _pageController,
        itemCount: totalPages,
        itemBuilder: (BuildContext context, int index) {
          return createPage(index);
        },
      ),
    );
  }


  Widget createPage(int index) {
    List<Color> colors = [Colors.yellow, Colors.cyan, Colors.deepOrange];
    return Container(
      color: colors[index],
      alignment: Alignment.topCenter,
      child: Text('Page ${index + 1}'),
    );
  }


  void nextPage() {
    // nextPage = currentPage + 1
    int nextPage = _pageController.page!.floor() + 1;
    // reaching the last page?
    if (nextPage == totalPages) {
      // return to the first page
      nextPage = 0;
    }
    // _pageController.jumpToPage(nextPage);
    _pageController.animateToPage(
      nextPage,
      duration: const Duration(seconds: 1),
      curve: Curves.bounceOut,
    );
  }
}
