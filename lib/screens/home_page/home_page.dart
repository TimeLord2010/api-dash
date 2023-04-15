import 'package:apidash/consts.dart';
import 'package:flutter/material.dart';
import 'package:multi_split_view/multi_split_view.dart';

import 'collection_pane.dart';
import 'editor_pane/editor_pane.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final MultiSplitViewController _controller = MultiSplitViewController(
    areas: [
      Area(size: 250, minimalSize: 200),
      Area(minimalWeight: 0.7),
    ],
  );

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiSplitViewTheme(
        data: MultiSplitViewThemeData(
          dividerThickness: 3,
          dividerPainter: DividerPainters.background(
            color: Theme.of(context).colorScheme.surfaceVariant,
            highlightedColor: Theme.of(context).colorScheme.outline.withOpacity(
                  kHintOpacity,
                ),
            animationEnabled: false,
          ),
        ),
        child: MultiSplitView(
          controller: _controller,
          children: const [
            CollectionPane(),
            RequestEditorPane(),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
