import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class upload extends StatefulWidget {
  const upload({super.key});

  @override
  State<upload> createState() => _uploadState();
}

class _uploadState extends State<upload> {
  late String _imagepath;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        // ignore: unnecessary_null_comparison
        child: _imagepath == null
            ? const Text("no image path")
            : Image.file(
                File(_imagepath),
              ),
      ),
      floatingActionButton: const FloatingActionButton(
        onPressed: null,
        child: Icon(Icons.add_a_photo),
      ),
    );
  }

  Future getImage() async {
    final image = await ImagePicker().pickImage(
      source: ImageSource.camera,
      imageQuality: 1,
    );
    setState(() {
      _imagepath=File(image!.path) as String;
    });
  }
}

// dio_http.dart
class DioHttp {
  Dio? _client;
  late BuildContext context;

  static DioHttp of(BuildContext context) {
    return DioHttp._internal(context);
  }
  // 构建请求实例方法
  DioHttp._internal(BuildContext context) {
    if (_client == null || context != this.context) {
      this.context = context;
      var option = BaseOptions(
        baseUrl: 'http://10.0.2.2',
        connectTimeout: Duration(seconds: 1000 * 10),
        receiveTimeout: Duration(seconds: 1000 * 3),
        extra: {'context': context},
      );
      var client = Dio(option);
      this._client = client;
    }
  }
  // 封装form-data数据的方法
  Future<Response<Map<String, dynamic>>> postFormData(String path, params) async {
    var options = Options(
      contentType: 'multipart/form-data',
    );
    return await _client!.post(
      path,
      data: params,
      options: options,
    );
  }
}