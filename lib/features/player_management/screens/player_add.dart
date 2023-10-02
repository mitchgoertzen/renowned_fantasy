import 'package:fantasy_draft/features/leagues/components/roster_component.dart';
import 'package:fantasy_draft/global_components/draggable_player.dart';
import 'package:fantasy_draft/global_components/popup_dialogue.dart';
import 'package:fantasy_draft/global_components/section_container.dart';
import 'package:fantasy_draft/managers/player_drag_manager.dart';
import 'package:fantasy_draft/utils/shared_preference_utilities.dart';
import 'package:fantasy_draft/utils/temp_data.dart';
import 'package:fantasy_draft/utils/utilities.dart';
import 'package:flutter/material.dart';

class PlayerAdd extends StatefulWidget {
  final List<String> playerToBeAdded;
  final VoidCallback closePlayerAdd;

  const PlayerAdd(
      {super.key, required this.playerToBeAdded, required this.closePlayerAdd});

  @override
  State<StatefulWidget> createState() => _PlayerAddState();
}

class _PlayerAddState extends State<PlayerAdd> {
  late PlayerDragManager dragManager;
  late String addedPlayer;
  late RosterComponent myRoster;
  bool accept = false;
  late String displacedPlayer;

  String logText = '';
  void acceptPlayer(bool b) {
    accept = b;
  }

  List<String> playersToBeDropped = [];

  _PlayerAddState() {
    dragManager = PlayerDragManager();

    myRoster = RosterComponent(
      updateRoster: (RosterComponent? r) => updateRoster(r!),
      rosterPlayers: TempData.getTempRosterAsMap(),
      removePlayerFromExtra: (String? p) => removePlayerFromDropList(p!),
      reassignDisplacedPlayer: (String? p, String? o) =>
          reassignDisplacedPlayer(p!, o!),
      dragManager: dragManager,
      recentPlayerAccepted: (bool? b) => acceptPlayer(b!),
      extraPlayers: TempData.tempRoster.bench!,
    );
  }

  @override
  void initState() {
    super.initState();
    //save current roster to revert to when page is left NOT via confirm button
    addedPlayer = widget.playerToBeAdded[0];
    print('added player: $addedPlayer');
    print('init');
    displacedPlayer = "";
  }

  void clearPreviousSlot(String origin) async {
    int maxRosterSize = await SharedPreferencesUtilities.getLeagueRosterSize();
    //should only be called if players origin is add list
    if (accept) {
      setState(() {
        logText += 'origin: $origin\n';

        logText += 's: ${TempData.tempRoster.size}\n';
        logText +=
            'extra contains displaced player: ${TempData.tempRoster.bench!.contains(displacedPlayer)}\n';
        logText += 'displaced player is empty: ${displacedPlayer == ''}\n';
        // logText +=
        //     'displaced player name: ${displacedPlayer} ${displacedPlayer.Last}\n';
        if (TempData.tempRoster.size! >= maxRosterSize &&
            (TempData.tempRoster.bench!.contains(displacedPlayer) ||
                displacedPlayer == '')) {
          logText += 'roster full and player displaced is empty\n';
          playersToBeDropped.add(TempData.tempRoster.bench!.removeLast());
        }
        logText += 'player is removed from add/drop list\n';
        if (origin == 'Add') {
          widget.playerToBeAdded.clear();
          logText += 'added player: $addedPlayer\n';
        }
      });

      logText += 'second\n';
      FileStorage.writeCounter(logText, 'log.txt');
    }

    displacedPlayer = "";
  }

  //when a new player is assigned to an occupied roster slot,
  //the player previously occupying that slot will be displaced
  void reassignDisplacedPlayer(String displaced, String newPlayerOrigin) async {
    int maxRosterSize = await SharedPreferencesUtilities.getLeagueRosterSize();
    displacedPlayer = displaced;
    print('origin: $newPlayerOrigin');
    //did the new player not come from a roster slot?
    if (newPlayerOrigin != "Roster" &&
        TempData.tempRoster.size! >= maxRosterSize) {
      // print('roster size: ${TempRoster.getRosterSize()}');
      // print('roster max: ${TempRoster.maxSize}');

      setState(() {
        // print('add to drop list');
        // print('displaced player ${displaced.id}');
        // print('player to be added ${addedPlayer.id}');
        if (displaced == addedPlayer) {
          // print('player should be added to add list');
          // print('player to be added ${displaced.Last}');
          widget.playerToBeAdded.add(displaced);
        } else {
          playersToBeDropped.add(displaced);
        }
      });
    } else {
      print('add to extras');
      TempData.tempRoster.bench!.add(displaced);
    }
    logText += 'first\n';
  }

  void removePlayerFromDropList(String p) {
    //only need if empty player is in bench
    //TempRoster.removeFromExtras();
    setState(() {
      playersToBeDropped.remove(p);
    });
  }

  void updateRoster(RosterComponent r) {
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
                            for (String p in widget.playerToBeAdded)
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
                        for (String p in playersToBeDropped)
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
                              //set roster in db with temp roster
                              //AmplifyUtilities.updateRoster(TempData.getTempRoster()),
                              //clear temp roster data
                              TempData.clearTempRoster(),
                              //add magnagerID to newly added player
                              //AmplifyUtilities.removeFreeAgent(addedPlayer);
                              //remove managerID from dropped player(s)
                              //AmplifyUtilities.setPlayersAsFreeAgent(playersToBeDropped);
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
                                    //TODO: added player info
                                    '${addedPlayer} ${addedPlayer}',
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
        //TODO: get dropped player info
        text: '${playersToBeDropped[i]} ${playersToBeDropped[i]}',
        style: TextStyle(fontWeight: FontWeight.bold),
      ));
      if (i < playersToBeDropped.length - 1) {
        dropText.add(TextSpan(text: ', '));
      }
    }

    return dropText;
  }
}
