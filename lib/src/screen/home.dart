import 'package:dearfam/core/constants/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dearfam/src/reuse/custom_navbar.dart';
import 'package:dearfam/src/pages/home_page.dart';
import 'package:dearfam/src/pages/bookshelf_page.dart';
import 'package:dearfam/src/pages/goods_page.dart';
import 'package:dearfam/src/pages/family_page.dart';
import 'package:dearfam/core/provider/index_provider.dart'; // indexProvider import

class Home extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(indexProvider);
    final indexNotifier = ref.read(indexProvider.notifier);

    final List<Widget> pages = [
      HomePage(),
      BookshelfPage(),
      GoodsPage(),
      FamilyPage(),
    ];

    return Scaffold(
      backgroundColor: ColorSystem.brandMainlightColor,
      body: pages[currentIndex],
      bottomNavigationBar: CustomNavBar(
        currentIndex: currentIndex,
        onTap: (index) {
          indexNotifier.setIndex(index);
        },
      ),
    );
  }
}
