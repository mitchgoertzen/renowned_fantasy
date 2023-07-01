import 'package:fantasy_draft/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WatchlistWidget extends StatelessWidget {
  bool _inWatchlist = false;
  int _favoriteCount = 0;
  double _opacity = 0.25;

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<AppState>();
    var currentPlayer = appState.current;
    var theme = Theme.of(context);

    _inWatchlist = appState.favourites[currentPlayer.id] != null;
    _favoriteCount = appState.favourites.length;

    IconData icon;
    if (_inWatchlist) {
      icon = Icons.remove_red_eye;
      _opacity = 1.0;
    } else {
      icon = Icons.remove_red_eye_outlined;
      _opacity = 0.25;
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
            padding: const EdgeInsets.all(0),
            alignment: Alignment.center,
            icon: (Icon(icon)),
            color: theme.colorScheme.primary,
            onPressed: () => appState.toggleWatchlist()),
        SizedBox(
          child: Text('$_favoriteCount'),
        ),
      ],
    );
  }

  double get currentOpacity {
    return _opacity;
  }
}
