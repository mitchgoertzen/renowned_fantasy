import 'package:fantasy_draft/features/player_management/widgets/watchlist_widget.dart';
import 'package:fantasy_draft/models/Player.dart';
import 'package:flutter/material.dart';

class PlayerInfo extends StatelessWidget {
  final Player player;
  PlayerInfo(this.player);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      child: Row(children: [
        Expanded(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            padding: const EdgeInsets.only(bottom: 8),
            child: Text(
              '${player.First} ${player.Last}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Text(
            'OF - Tampa Bay Rays',
            style: TextStyle(
              color: Colors.grey[500],
            ),
          ),
        ])),
        WatchlistWidget()
      ]),
    );
  }
}
