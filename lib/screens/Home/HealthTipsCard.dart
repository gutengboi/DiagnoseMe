// import 'dart:async';
// import 'package:flutter/material.dart';
//
// class PromotionCards extends StatefulWidget {
//   @override
//   _PromotionCardsState createState() => _PromotionCardsState();
// }
//
// class _PromotionCardsState extends State<PromotionCards> {
//
//   PageController _pageController = PageController();
//   Timer autoScrollTimer;
//   ValueNotifier<int> activeSlide = ValueNotifier(0);
//
//   @override
//   void initState() {
//     super.initState();
//     startAutoScroll();
//
//     WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
//     });
//   }
//
//
//
//   startAutoScroll() {
//     // if (autoScrollTimer != null) {
//     //   return;
//     // }
//     // autoScrollTimer = Timer.periodic(Duration(milliseconds: 4000), (timer) {
//     //   // print(_pageController.page);
//     //   if (_pageController.hasClients) {
//     //     if (activeSlide.value < (cmsBloc.promotionContents.length - 1)) {
//     //       _pageController.nextPage(
//     //           duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
//     //     } else {
//     //       if (cmsBloc.promotionContents.length == 2) {
//     //         _pageController.animateToPage(0,
//     //             duration: Duration(milliseconds: 500), curve: Curves.easeOut);
//     //       } else {
//     //         _pageController.jumpToPage(0);
//     //       }
//     //     }
//     //   }
//     // });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: MediaQuery.of(context).size.width,
//       height: 200,
//       margin: EdgeInsets.only(left: 13, right: 15, bottom: 0, top: 10),
//       child: Card(
//         borderOnForeground: true,
//         semanticContainer: true,
//         clipBehavior: Clip.antiAliasWithSaveLayer,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(10.0),
//         ),
//         color: Colors.white,
//         elevation: 4,
//         child: Stack(
//           children: [
//             Container(
//               child: PageView.builder(
//                 controller: _pageController,
//                 itemCount: cmsBloc.promotionContents.length,
//                 allowImplicitScrolling: true,
//                 itemBuilder: (context, index) {
//                   return HomeScreenBannerItem(
//                     content: cmsBloc.promotionContents[index],
//                     currentIndex: index + 1,
//                     total: cmsBloc.promotionContents.length,
//                   );
//                 },
//                 onPageChanged: (page) {
//                   // hapticSelection();
//                   activeSlide.value = page;
//                 },
//               ),
//             ),
//
//             if (cmsBloc.promotionContents.length > 2) ValueListenableBuilder(
//               valueListenable: activeSlide,
//               builder: (context, value, child) {
//                 return Positioned(
//                   bottom: 10,
//                   right: 10,
//                   child: Row(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       Container(
//                         padding:
//                         EdgeInsets.symmetric(horizontal: 10, vertical: 3),
//                         decoration: BoxDecoration(
//                           color: Colors.black54,
//                           borderRadius: BorderRadius.circular(6),
//                         ),
//                         child: Text(
//                           "${value + 1}/${cmsBloc.promotionContents.length}",
//                           style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             color: Colors.white70,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 );
//               },
//             ),
//
//           ],
//         ),
//       ),
//     );
//   }
// }
