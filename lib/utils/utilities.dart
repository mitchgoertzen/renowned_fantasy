
import 'dart:io';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:fantasy_draft/features/player_management/models/player.dart';

String capitalize(String val){
  return val[0].toUpperCase() + val.substring(1).toLowerCase();
}

  String playerInfoStringBuilder(Player p) {
    String info = '';

    info += p.first;
    info += ' ';
    info += p.last;
    info += ' - ';
    for(int i = 1; i < p.positions.length; i++){
      info += p.positions[i];
      if(i < p.positions.length - 1) {
        info += ', ';
      }
    }
    return info;

  }


//TODO: universal
  String getDate(TemporalDateTime date) {
    String formattedDate = '';

    switch (date.getDateTimeInUtc().month) {
      case 0:
        formattedDate += 'January';
        break;
      case 1:
        formattedDate += 'January';
        break;
      case 2:
        formattedDate += 'February';
        break;
      case 3:
        formattedDate += 'March';
        break;
      case 4:
        formattedDate += 'April';
        break;
      case 5:
        formattedDate += 'May';
        break;
      case 6:
        formattedDate += 'June';
        break;
      case 7:
        formattedDate += 'July';
        break;
      case 8:
        formattedDate += 'August';
        break;
      case 9:
        formattedDate += 'September';
        break;
      case 10:
        formattedDate += 'October';
        break;
      case 11:
        formattedDate += 'Novmeber';
        break;
      case 12:
        formattedDate += 'December';
        break;
    }

    formattedDate += ' ';
    formattedDate += date.getDateTimeInUtc().day.toString();
    formattedDate += ', ';
    formattedDate += date.getDateTimeInUtc().year.toString();

    return formattedDate;
  }


//TODO: for debug log. remove in final build
// To save the file in the device
class FileStorage {
  static Future<String> getExternalDocumentPath() async {
    // To check whether permission is given for this app or not.
    var status = await Permission.storage.status;
    if (!status.isGranted) {
      print('get permission');
      // If not we will ask for permission first
      await Permission.storage.request();
    }
    Directory directory = Directory("");
    if (Platform.isAndroid) {
       // Redirects it to download folder in android
      directory = Directory("/storage/emulated/0/Download");
    } else {
      directory = await getApplicationDocumentsDirectory();
    }
  
    final exPath = directory.path;
    print("Saved Path: $exPath");
    await Directory(exPath).create(recursive: true);
    return exPath;
  }
  
  static Future<String> get _localPath async {
    // final directory = await getApplicationDocumentsDirectory();
    // return directory.path;
    // To get the external path from device of download folder
    final String directory = await getExternalDocumentPath();
    return directory;
  }
  
static Future<File> writeCounter(String bytes,String name) async {
  final path = await _localPath;
    // Create a file for the path of
      // device and file name with extension
    File file= File('$path/$name');
    print("Save file");
      
      // Write the data in the file you have created
    return file.writeAsString('$bytes\n');
  }
}



