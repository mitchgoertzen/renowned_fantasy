import 'package:fantasy_draft/global_components/AppBar.dart';
import 'package:fantasy_draft/global_components/AppDrawer.dart';
import 'package:fantasy_draft/main.dart';
import 'package:fantasy_draft/utils/Utilities.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Watchlist extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    var appState = context.watch<AppState>();
    var currentPlayer = appState.current;

    return Scaffold(
        appBar: appBar(theme),
        drawer: appDrawer(context),
        body: createCenter(appState, theme, context));
  }

  Center createCenter(AppState appState, var theme, BuildContext context) {
    return appState.favourites.isEmpty
        ? Center(
            child: Text('Your Watchlist is empty.'),
          )
        : Center(
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text('Your Watchlist:'),
                ),
                for (var player in appState.favourites.values)
                  ListTile(
                    leading: IconButton(
                      icon: Icon(Icons.delete_outline, semanticLabel: 'Delete'),
                      color: theme.colorScheme.primary,
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            title: const Text('Are You Sure?'),
                            titlePadding: EdgeInsets.all(20),
                            content: Center(
                              heightFactor: 0,
                              child: Wrap(
                                alignment: WrapAlignment.center,
                                crossAxisAlignment: WrapCrossAlignment.center,
                                children: [
                                  Text('Remove '),
                                  Text(
                                    '${capitalize(player.first)} ${capitalize(player.last)}',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text(' from your Watchlist?'),
                                ],
                              ),
                            ),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () =>
                                    Navigator.pop(context, 'Nevermind'),
                                child: const Text('Nevermind'),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context, 'Yes');
                                  appState.removeFavourite(player.id);
                                },
                                child: const Text('Yes'),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                    title: Text(
                      "${capitalize(player.first)} ${capitalize(player.last)}",
                      semanticsLabel:
                          '${capitalize(player.first)} ${capitalize(player.last)}',
                    ),
                  ),
              ],
            ),
          );
  }
}
