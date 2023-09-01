import 'package:fantasy_draft/features/leagues/components/roster.dart';
import 'package:fantasy_draft/features/leagues/models/temp_available_players.dart';
import 'package:fantasy_draft/features/leagues/models/temp_fantasy_league.dart';
import 'package:fantasy_draft/features/leagues/models/temp_roster.dart';
import 'package:fantasy_draft/features/player_management/models/player.dart';
import 'package:fantasy_draft/global_components/draggable_player.dart';
import 'package:fantasy_draft/global_components/popup_dialogue.dart';
import 'package:fantasy_draft/global_components/section_container.dart';
import 'package:fantasy_draft/managers/player_drag_manager.dart';
import 'package:fantasy_draft/utils/utilities.dart';
import 'package:flutter/material.dart';

class PlayerAdd extends StatefulWidget {
  final List<Player> playerToBeAdded;
  final VoidCallback closePlayerAdd;

  const PlayerAdd(
      {super.key, required this.playerToBeAdded, required this.closePlayerAdd});

  @override
  State<StatefulWidget> createState() => _PlayerAddState();
}

class _PlayerAddState extends State<PlayerAdd> {
  late PlayerDragManager dragManager;
  late Player addedPlayer;
  late Roster myRoster;
  bool accept = false;
  late Player displacedPlayer;

  String logText = '';
  void acceptPlayer(bool b) {
    accept = b;
  }

  List<Player> playersToBeDropped = [];

  _PlayerAddState() {
    dragManager = PlayerDragManager();

    myRoster = Roster(
      updateRoster: (Roster? r) => updateRoster(r!),
      roster: TempRoster.getRoster(),
      removePlayerFromExtra: (Player? p) => removePlayerFromDropList(p!),
      reassignDisplacedPlayer: (Player? p, String? o) =>
          reassignDisplacedPlayer(p!, o!),
      dragManager: dragManager,
      recentPlayerAccepted: (bool? b) => acceptPlayer(b!),
      extraPlayers: TempRoster.getRoster()[8]!,
    );
  }

  @override
  void initState() {
    super.initState();
    //save current roster to revert to when page is left NOT via confirm button
    TempRoster.saveCurrentRoster();
    addedPlayer = widget.playerToBeAdded[0];
    print('added player: ${addedPlayer.last}');
    print('init');
    displacedPlayer = TempFantasyLeague.emptyPlayer;
  }

  void clearPreviousSlot(String origin) {
    //should only be called if players origin is add list
    if (accept) {
      setState(() {
        logText += 'origin: $origin\n';

        logText += 's: ${TempRoster.getRosterSize()}\n';
        logText +=
            'extra contains displaced player: ${TempRoster.currentRoster[8]!.contains(displacedPlayer)}\n';
        logText +=
            'displaced player is empty: ${displacedPlayer.first == ''}\n';
        logText +=
            'displaced player name: ${displacedPlayer.first} ${displacedPlayer.last}\n';
        if (TempRoster.getRosterSize() >= TempRoster.maxSize &&
            (TempRoster.currentRoster[8]!.contains(displacedPlayer) ||
                displacedPlayer.first == '')) {
          logText += 'roster full and player displaced is empty\n';
          playersToBeDropped.add(TempRoster.currentRoster[8]!.removeLast());
        }
        logText += 'player is removed from add/drop list\n';
        if (origin == 'Add') {
          widget.playerToBeAdded.clear();
          logText += 'added player: ${addedPlayer.last}\n';
        }
      });

      logText += 'second\n';
      FileStorage.writeCounter(logText, 'log.txt');
    }

    displacedPlayer = TempFantasyLeague.emptyPlayer;
  }

  //when a new player is assigned to an occupied roster slot,
  //the player previously occupying that slot will be displaced
  void reassignDisplacedPlayer(Player displaced, String newPlayerOrigin) {
    displacedPlayer = displaced;
    print('origin: $newPlayerOrigin');
    //did the new player not come from a roster slot?
    if (newPlayerOrigin != "Roster" &&
        TempRoster.getRosterSize() >= TempRoster.maxSize) {
      print('roster size: ${TempRoster.getRosterSize()}');
      print('roster max: ${TempRoster.maxSize}');

      setState(() {
        print('add to drop list');
        print('displaced player ${displaced.id}');
        print('player to be added ${addedPlayer.id}');
        if (displaced.id == addedPlayer.id) {
          print('player should be added to add list');
          print('player to be added ${displaced.last}');
          widget.playerToBeAdded.add(displaced);
        } else {
          playersToBeDropped.add(displaced);
        }
      });
    } else {
      print('add to extras');
      TempRoster.addToExtras(displaced);
    }
    logText += 'first\n';
  }

  void removePlayerFromDropList(Player p) {
    TempRoster.removeFromExtras();
    setState(() {
      playersToBeDropped.remove(p);
    });
  }

  void updateRoster(Roster r) {
    setState(() {
      myRoster = r;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: ListView(
        children: [
          Center(child: sectionContainer(myRoster)),
          Center(
              child: sectionContainer(Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.green,
                    //TODO: default border radius size
                    borderRadius: BorderRadius.circular(5)),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Column(
                    children: [
                      Text('Player to Add:'),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            for (Player p in widget.playerToBeAdded)
                              SizedBox(
                                height: 40,
                                child: DraggablePlayer(
                                    player: p,
                                    opac: 1,
                                    dragManager: dragManager,
                                    clearPreviousSlot: (String? s) =>
                                        clearPreviousSlot(s!),
                                    location: 'Add'),
                              )
                          ]),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(5)),
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Column(
                      children: [
                        Text('Player to Drop:'),
                        for (Player p in playersToBeDropped)
                          SizedBox(
                            height: 40,
                            child: DraggablePlayer(
                              player: p,
                              opac: 1,
                              dragManager: dragManager,
                              clearPreviousSlot: (String? s) =>
                                  clearPreviousSlot(s!),
                              location: 'Drop',
                            ),
                          )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ))),
          ElevatedButton(
            onPressed: () {
              //TODO: add failsafe if roster size > max
              //throw "error" and close add player screen
              //send repot?
              if (widget.playerToBeAdded.isEmpty) {
                showDialog(
                    context: context,
                    builder: (BuildContext context) => buildPopupDialog(
                        context,
                        () => {
                              TempRoster.resetSavedRoster(),
                              TempAvailPlayers.removePlayer(addedPlayer),
                              for (var p in playersToBeDropped)
                                TempAvailPlayers.addPlayer(p),
                              print('!!accepted!!'),
                              Navigator.of(context).pop(),
                              widget.closePlayerAdd()

                              //  Navigator.of(context).pop(),
                            },
                        () => Navigator.of(context).pop(),
                        'Confirm Add',
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(text: 'Add '),
                              TextSpan(
                                text:
                                    '${addedPlayer.first} ${addedPlayer.last}',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              TextSpan(text: ' to your roster '),
                              for (var t in getPlayersToBeDropped()) t,
                              TextSpan(text: '?'),
                            ],
                          ),
                        )));
              } else {
                null;
              }
            },
            child: Text('Confirm'),
          ),
        ],
      ),
    ));
  }

  List<TextSpan> getPlayersToBeDropped() {
    List<TextSpan> dropText = [TextSpan(text: 'and drop ')];

    print(playersToBeDropped.length);

    for (int i = 0; i < playersToBeDropped.length; i++) {
      dropText.add(TextSpan(
        text: '${playersToBeDropped[i].first} ${playersToBeDropped[i].last}',
        style: TextStyle(fontWeight: FontWeight.bold),
      ));
      if (i < playersToBeDropped.length - 1) {
        dropText.add(TextSpan(text: ', '));
      }
    }

    return dropText;
  }
}
