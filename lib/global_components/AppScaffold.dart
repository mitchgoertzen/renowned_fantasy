import 'package:flutter/material.dart';

import '../../../global_components/AppBar.dart';
import '../../../global_components/AppDrawer.dart';

Scaffold appScaffold(BuildContext context, Widget body) {
  return Scaffold(
      appBar: appBar(Theme.of(context)),
      drawer: appDrawer(context),
      body: body);
}
