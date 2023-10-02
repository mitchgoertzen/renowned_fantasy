
// import 'package:flutter/material.dart';

// class TeamStandings extends StatefulWidget{

//   final List<Team> teams;

//   const TeamStandings({super.key, required this.teams});

//   @override
//   State<StatefulWidget> createState() => TeamStandingsState();
// }

// class TeamStandingsState extends State<TeamStandings>{


//   teamListing(FantasyTeam team){
//     return Row(children: [Text(team.getName())],);
//   }


//   @override
//   Widget build(BuildContext context) {
//     return Column(children: [
//       for(var t in widget.teams)
//         teamListing(t),
//     ],);
//   }

// }