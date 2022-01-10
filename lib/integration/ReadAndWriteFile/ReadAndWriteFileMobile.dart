import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:smartkit/integration/helper/ColorsRes.dart';
import 'package:smartkit/integration/helper/DesignConfig.dart';

class FileStorageMobile {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/smartkitfile.txt');
  }

  Future<String> readInFile() async {
    try {
      final file = await _localFile;
      final readContent = await file.readAsString();
      return readContent;
    } catch (e) {
      return "0";
    }
  }

  Future<File> writeInFile(String counter) async {
    final file = await _localFile;
    return file.writeAsString('$counter');
  }
}

class ReadAndWriteFileMobile extends StatefulWidget {
  final FileStorageMobile filestorage;

  ReadAndWriteFileMobile({Key key, this.filestorage}) : super(key: key);

  @override
  _ReadAndWriteFileStateMobile createState() => new _ReadAndWriteFileStateMobile();
}

class _ReadAndWriteFileStateMobile extends State<ReadAndWriteFileMobile> {
  String files = "";
  TextEditingController edtfile = new TextEditingController();

  @override
  void initState() {
    super.initState();
    widget.filestorage.readInFile().then((String value) {
      setState(() {
        files = value;
      });
    });
  }

  Future<File> writeFile() {
    setState(() {
      files = edtfile.text;
    });
    return widget.filestorage.writeInFile(files);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Reading and Writing Files', style: TextStyle(color: ColorsRes.black),), backgroundColor: ColorsRes.white,
        leading: BackButton(
        color: Colors.black
        ),
        actions: [
          IconButton(icon: Icon(Icons.refresh),color: ColorsRes.black, onPressed: (){edtfile.clear();})
        ],),
      body: Center(
        child: SingleChildScrollView(
          child: Column(crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: DesignConfig.boxDecorationContainerColor(ColorsRes.appcolor.withOpacity(0.1), 15),
                padding: EdgeInsets.all(8),
                margin: EdgeInsets.only(top: 20, bottom: 5,left: 20,right:20),
                child: TextFormField(
                  style: TextStyle(color: ColorsRes.black),
                  cursorColor: ColorsRes.black,
                  decoration: InputDecoration(
                    hintText: "Write Something in File",
                    hintStyle: Theme.of(context).textTheme.subtitle2.merge(TextStyle(color: ColorsRes.grey)),
                    border: InputBorder.none,
                  ),
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  minLines: 13,
                  controller: edtfile,
                ),
              ),
              SizedBox(height:20),
              GestureDetector(
                onTap:(){
                  widget.filestorage.readInFile().then((String value) {
                    setState(() {
                      files = value;
                    });
                  });
                  edtfile = TextEditingController(text: files.toString());
                },
                child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(vertical: 15),
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  decoration: DesignConfig.boxDecorationContainerColor(ColorsRes.appcolor, 10),
                  child: Text("Read", style: Theme.of(context).textTheme.subtitle1.merge(TextStyle(color: ColorsRes.white, fontWeight: FontWeight.bold)),),
                ),
              ),
              SizedBox(height:20),
              GestureDetector(
                onTap:()
                {writeFile();
                edtfile = TextEditingController(text: files.toString());},
                child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(vertical: 15),
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  decoration: DesignConfig.boxDecorationContainerColor(ColorsRes.appcolor, 10),
                  child: Text("Write", style: Theme.of(context).textTheme.subtitle1.merge(TextStyle(color: ColorsRes.white, fontWeight: FontWeight.bold)),),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}