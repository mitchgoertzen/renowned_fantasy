import 'package:flutter/material.dart';

import 'app_bar.dart';
import 'app_drawer.dart';

Scaffold appScaffold(BuildContext context, Widget body, Widget page, Widget? bottomBar) {
  return Scaffold(
      appBar: draftAppBar(Theme.of(context)),
      drawer: appDrawer(context, page),
      bottomNavigationBar: bottomBar,
      body: body);
}
