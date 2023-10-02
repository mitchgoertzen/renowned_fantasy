import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:fantasy_draft/global_components/custom_select.dart';
import 'package:fantasy_draft/global_widgets/row_listing.dart';
import 'package:fantasy_draft/models/ModelProvider.dart';
import 'package:fantasy_draft/utils/utilities.dart';
import 'package:flutter/material.dart';

class JoinLeagueTab extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => JoinLeagueTabState();
}

class JoinLeagueTabState extends State<JoinLeagueTab> {
  int leagueType = 0;

  void updateLeagueType(int l) {
    setState(() {
      leagueType = l;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Center(
        child: CustomSelector(
          getTimeRange: (int? range) => updateLeagueType(range!),
          options: ["Public", "Invites"],
          selectedIndex: 0,
        ),
      ),
      publicLeagues()
    ]);

    //    leagueType == 0 ? publicLeagues() : privateLeagues()
  }

  publicLeagues() {
    //TODO: qeury all public leagues with space for new players
    List<League> publicLeagueList = [
      League(
          name: "Public League 1", creationDate: TemporalDate(DateTime.now())),
      League(
          name: "Public League 2", creationDate: TemporalDate(DateTime.now())),
      League(
          name: "Public League 3", creationDate: TemporalDate(DateTime.now())),
      League(
          name: "Public League 4", creationDate: TemporalDate(DateTime.now())),
      League(
          name: "Public League 5", creationDate: TemporalDate(DateTime.now())),
      League(
          name: "Public League 6", creationDate: TemporalDate(DateTime.now())),
      League(
          name: "Public League 7", creationDate: TemporalDate(DateTime.now())),
      League(
          name: "Public League 8", creationDate: TemporalDate(DateTime.now())),
      League(
          name: "Public League 9", creationDate: TemporalDate(DateTime.now())),
      League(
          name: "Public League 10", creationDate: TemporalDate(DateTime.now())),
      League(
          name: "Public League 11", creationDate: TemporalDate(DateTime.now())),
      League(
          name: "Public League 12", creationDate: TemporalDate(DateTime.now())),
    ];

    return Expanded(
      child: Column(
        children: [
          buildListingRow(
            name: 'Title',
            owner: 'Owner',
            managerCount: 'Managers',
            dateCreated: 'Date',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const Divider(),
          Expanded(
            child: ListView.builder(
              itemCount: publicLeagueList.length,
              itemBuilder: (context, index) {
                final league = publicLeagueList[index];
                return Dismissible(
                  key: ValueKey(league),
                  background: const ColoredBox(
                    color: Colors.red,
                    child: Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Icon(Icons.delete, color: Colors.white),
                      ),
                    ),
                  ),
                  onDismissed: (_) => () => print("nothing"),
                  child: ListTile(
                    onTap: () => print("nothing"),
                    title: buildListingRow(
                        name: league.name,
                        owner: "owner $index",
                        managerCount: "1/10",
                        dateCreated: league.creationDate.toString()),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );

    // Column(
    //   children: [
    //     buildListingRow(
    //       name: 'Title',
    //       owner: 'Owner',
    //       managerCount: 'Managers',
    //       dateCreated: 'Date',
    //       style: Theme.of(context).textTheme.titleMedium,
    //     ),
    //     const Divider(),
    //     // Flexible(
    //     //   child: ListView.builder(
    //     //     scrollDirection: Axis.vertical,
    //     //     itemCount: publicLeagues.length,
    //     //     itemBuilder: (context, index) {
    //     //       final league = publicLeagues[index];
    //     //       return Dismissible(
    //     //         key: ValueKey(league),
    //     //         background: const ColoredBox(
    //     //           color: Colors.red,
    //     //           child: Padding(
    //     //             padding: EdgeInsets.only(right: 10),
    //     //             child: Align(
    //     //               alignment: Alignment.centerRight,
    //     //               child: Icon(Icons.delete, color: Colors.white),
    //     //             ),
    //     //           ),
    //     //         ),
    //     //         onDismissed: (_) => () => print("nothing"),
    //     //         child: ListTile(
    //     //           onTap: () => print("nothing"),
    //     //           title: buildListingRow(
    //     //               name: league.name,
    //     //               owner: league.owner!,
    //     //               managerCount: "0",
    //     //               dateCreated: getDate(league.createdAt!).toString()),
    //     //         ),
    //     //       );
    //     //     },
    //     //   ),
    //     // ),
    //     // Expanded(
    //     //   child: ListView.builder(
    //     //     itemCount: publicLeagues.length,
    //     //     itemBuilder: (context, index) {
    //     //       final league = publicLeagues[index];
    //     //       return Dismissible(
    //     //         key: ValueKey(league),
    //     //         background: const ColoredBox(
    //     //           color: Colors.red,
    //     //           child: Padding(
    //     //             padding: EdgeInsets.only(right: 10),
    //     //             child: Align(
    //     //               alignment: Alignment.centerRight,
    //     //               child: Icon(Icons.delete, color: Colors.white),
    //     //             ),
    //     //           ),
    //     //         ),
    //     //         onDismissed: (_) => () => print("nothing"),
    //     //         child: ListTile(
    //     //           onTap: () => print("nothing"),
    //     //           title: buildListingRow(
    //     //               name: league.name,
    //     //               owner: league.owner!,
    //     //               managerCount: "0",
    //     //               dateCreated: getDate(league.createdAt!).toString()),
    //     //         ),
    //     //       );
    //     //     },
    //     //   ),
    //     // ),
    //   ],
    // );
    // return Column(
    //   children: [
    //     buildListingRow(
    //       name: 'Title',
    //       owner: 'Owner',
    //       managerCount: 'Managers',
    //       dateCreated: 'Date',
    //       style: Theme.of(context).textTheme.titleMedium,
    //     ),
    //     const Divider(),
    //     ListView.builder(
    //       itemCount: publicLeagues.length,
    //       itemBuilder: (context, index) {
    //         final league = publicLeagues[index];
    //         return Dismissible(
    //           key: ValueKey(league),
    //           background: const ColoredBox(
    //             color: Colors.red,
    //             child: Padding(
    //               padding: EdgeInsets.only(right: 10),
    //               child: Align(
    //                 alignment: Alignment.centerRight,
    //                 child: Icon(Icons.delete, color: Colors.white),
    //               ),
    //             ),
    //           ),
    //           onDismissed: (_) => print("nothing"),
    //           child: ListTile(
    //             onTap: () => print("join league page"),
    //             title: buildListingRow(
    //                 name: league.name,
    //                 owner: league.owner!,
    //                 managerCount: "1",
    //                 dateCreated: getDate(league.createdAt!).toString()),
    //           ),
    //         );
    //       },
    //     )
    //   ],
    // );
  }

  privateLeagues() {
    return Container(
      color: Colors.red,
      child: Text("private leagues"),
    );
  }
}
