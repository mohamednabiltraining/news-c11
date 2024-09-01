import 'package:flutter/material.dart';
import 'package:news_app_c11_sun/model/source.dart';
import 'package:news_app_c11_sun/tabs/tab_item.dart';

class TabWidget extends StatefulWidget {
  const TabWidget({super.key});

  @override
  State<TabWidget> createState() => _TabWidgetState();
}

class _TabWidgetState extends State<TabWidget> {
  int selectedIndex = 0;
  var sources = Source.getSources();
// TabController controller =TabController(length: length, vsync: vsync)
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: Source.getSources().length,
        child: Column(
          children: [
            TabBar(
                isScrollable: true,
                dividerColor: Colors.transparent,
                indicatorColor: Colors.transparent,
                onTap: (index) {
                  selectedIndex = index;
                  setState(() {});
                },
                labelColor: Colors.green,
                tabs: sources
                    .map((source) => TabItem(
                          source: source,
                          isSelected: selectedIndex == sources.indexOf(source),
                        ))
                    .toList())
          ],
        ));
  }
}
