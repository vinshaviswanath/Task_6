import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_file_downloader/flutter_file_downloader.dart';
import 'package:share_plus/share_plus.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class Screen1 extends StatefulWidget {
  const Screen1({Key? key}) : super(key: key);

  @override
  _Screen1State createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  TextEditingController Name = TextEditingController();
  final String fileUrl =
      'https://paytym.net/storage/pdfs/EMP18_PS_22-09-2023.pdf';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "PDF View",
            style: TextStyle(color: Colors.black),
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            height: 650,
            child: SfPdfViewer.asset("assets/paytm.pdf"),
          ),
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  _downloadFile();
                },
                child: Padding(
                  padding: const EdgeInsets.all(45.0),
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 19, 44, 238),
                      borderRadius: BorderRadius.all(Radius.circular(40)),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.download,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 200),
              GestureDetector(
                onTap: () {
                  _shareFile(fileUrl);
                },
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 19, 44, 238),
                    borderRadius: BorderRadius.all(Radius.circular(40)),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.share,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _downloadFile() {
    FileDownloader.downloadFile(
      url: fileUrl,
      onDownloadError: (String error) {
        print('Download error: $error');
      },
      onDownloadCompleted: (path) {
        final File file = File(path);
        print('Download completed: $file');
        Name.clear();
      },
    );
  }

  void _shareFile(String fileUrl) {
    Share.share(fileUrl, subject: 'Sharing file');
  }
}