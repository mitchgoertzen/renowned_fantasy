import 'package:fantasy_draft/features/player_management/models/Player.dart';
import 'package:fantasy_draft/global_components/AppScaffold.dart';
import 'package:flutter/material.dart';
import 'components/player_actions.dart';
import 'components/player_info.dart';
import 'components/player_stats.dart';

class PlayerDetails extends StatelessWidget {
  final Player player;

  PlayerDetails(this.player);

  @override
  Widget build(BuildContext context) {
    return appScaffold(
        context,
        ListView(
          children: [
            Image.asset(
              'assets/images/arozarena.png',
              width: 600,
              height: 240,
              fit: BoxFit.fitWidth,
              alignment: Alignment.topCenter,
            ),
            PlayerInfo(player),
            Center(child: PlayerActions()),
            PlayerStats(),
          ],
        ));
  }
}
