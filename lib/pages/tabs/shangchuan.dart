import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:http/http.dart' as http;


class PostPage extends StatefulWidget {
  const PostPage({super.key});

  @override
  _PostPageState createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  late File _image;
  final picker = ImagePicker();
  final TextEditingController _textController = TextEditingController();

  Future getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  Future uploadPost() async {
    var url = Uri.parse('your_api_endpoint');
    var request = http.MultipartRequest('POST', url)
      ..fields['description'] = _textController.text
      ..files.add(await http.MultipartFile.fromPath('image', _image.path));
    var response = await request.send();
    if (response.statusCode == 200) {
      print('Post uploaded successfully');
    } else {
      print('Failed to upload post');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('发帖应用'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // ignore: unnecessary_null_comparison
            _image == null
                ? Text('请选择图片')
                : Image.file(_image, height: 200),
            ElevatedButton(
              onPressed: getImage,
              child: Text('选择图片'),
            ),
            TextField(
              controller: _textController,
              decoration: InputDecoration(
                hintText: '请输入文字说明',
              ),
            ),
            ElevatedButton(
              onPressed: uploadPost,
              child: Text('发帖'),
            ),
          ],
        ),
      ),
    );
  }
}