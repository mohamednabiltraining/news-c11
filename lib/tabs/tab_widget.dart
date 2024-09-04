import 'package:flutter/material.dart';
import 'package:news_app_c11_sun/api/model/Source.dart';
import 'package:news_app_c11_sun/news/NewsListWidget.dart';
import 'package:news_app_c11_sun/tabs/tab_item.dart';

class TabWidget extends StatefulWidget {
  List<Source>? sources;
  TabWidget(this.sources);

  @override
  State<TabWidget> createState() => _TabWidgetState();
}

class _TabWidgetState extends State<TabWidget> {
  int selectedIndex = 0;
// TabController controller =TabController(length: length, vsync: vsync)
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: widget.sources?.length ?? 0,
        child: Column(
          children: [
            TabBar(
              padding: EdgeInsets.zero,
                tabAlignment: TabAlignment.start,
                isScrollable: true,
                dividerColor: Colors.transparent,
                indicatorColor: Colors.transparent,
                onTap: (index) {
                  selectedIndex = index;
                  setState(() {});
                },
                labelColor: Colors.green,
                tabs: widget.sources?.
                map((source) => TabItem(
                          source: source,
                          isSelected: selectedIndex == widget.sources?.indexOf(source),
                        ))
                    .toList() ?? []),
            Expanded(child: NewsListWidget(widget.sources?[selectedIndex]))
          ],
        ));
  }
}
