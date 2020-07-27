import 'dart:convert';
import 'dart:io';
import 'package:async/async.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spotegal/custom/constPref.dart';
import 'package:path/path.dart' as path;
import 'package:spotegal/utils/constans_util.dart';

class UploadFeed extends StatefulWidget {
  final String idSpot;
  final VoidCallback reload;
  const UploadFeed({Key key, this.idSpot, this.reload}) : super(key: key);
  @override
  _UploadFeedState createState() => _UploadFeedState();
}

class _UploadFeedState extends State<UploadFeed> {
  File file;
  String idUsers;
  getPref() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      idUsers = pref.getString(Pref.id);
    });
  }

  final picker = ImagePicker();
  kamera() async {
    var image = await picker.getImage(
      source: ImageSource.camera,
      maxWidth: 500.0,
      maxHeight: 500.0,
    );
    setState(() {
      file = File(image.path);
    });
  }

  gallery() async {
    var image = await picker.getImage(
      source: ImageSource.gallery,
      maxWidth: 500.0,
      maxHeight: 500.0,
    );
    setState(() {
      file = File(image.path);
    });
  }

  TextEditingController caption = TextEditingController();

  pilihGambar() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            content: Container(
              child: Row(
                children: <Widget>[
                  Expanded(
                      child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                      kamera();
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Icon(
                          Icons.camera_alt,
                          size: 30,
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          "Ambil Dari Kamera",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 12),
                        )
                      ],
                    ),
                  )),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                      gallery();
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Icon(
                          Icons.photo,
                          size: 30,
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          "Ambil Dari Gallery",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 12),
                        )
                      ],
                    ),
                  ))
                ],
              ),
            ),
          );
        });
  }

  submit() async {
    print(idUsers);
    print(widget.idSpot);
    print(widget.idSpot);
    var stream = http.ByteStream(DelegatingStream.typed(file.openRead()));
    var length = await file.length();

    var url = Uri.parse(ConstantsUtil.uploadFeed());

    var request = http.MultipartRequest("POST", url);

    var multiPartFile = new http.MultipartFile("image", stream, length,
        filename: path.basename(file.path));

    request.fields['idUsers'] = idUsers;
    request.fields['idSpot'] = widget.idSpot;
    request.fields['caption'] = caption.text.isEmpty ? "" : caption.text.trim();

    request.files.add(multiPartFile);

    var response = await request.send();
    print(response.statusCode);
    response.stream.transform(utf8.decoder).listen((value) {
      print(value);
      final data = jsonDecode(value);
      int hasil = data['value'];
      String message = data['message'];
      if (hasil == 1) {
        Navigator.pop(context);
        setState(() {
          widget.reload();
        });
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text("Information"),
                content: Text("$message"),
                actions: <Widget>[
                  FlatButton(
                    onPressed: () {
                      Navigator.pop(context);
                      setState(() {
                        Navigator.pop(context);
                      });
                    },
                    child: Text("Ok"),
                  )
                ],
              );
            });
      } else {
        Navigator.pop(context);
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text("Warning"),
                content: Text("$message"),
                actions: <Widget>[
                  FlatButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("Ok"),
                  )
                ],
              );
            });
      }
    });

    if (response.statusCode > 2) {
      print('Image uploaded');
      // Navigator.pop(context);
    } else {
      print('Upload failed');
    }
  }

  @override
  void initState() {
    super.initState();
    getPref();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.send),
              onPressed: () {
                submit();
              })
        ],
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              InkWell(
                onTap: pilihGambar,
                child: Container(
                  child: file != null
                      ? Image.file(
                          file,
                          fit: BoxFit.cover,
                        )
                      : Image.asset(
                          "././assets/img/Placeholder.jpg",
                          height: 250,
                          fit: BoxFit.cover,
                        ),
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: TextFormField(
                  controller: caption,
                  validator: (e) {
                    if (e.isEmpty)
                      return "Silahkan input caption gambar";
                    else
                      null;
                  },
                  decoration: InputDecoration(labelText: "Caption"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
