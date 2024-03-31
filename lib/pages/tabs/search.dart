import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';





class TextFieldController extends GetxController {
  // 使用 RxString 来响应式地跟踪文本字段的内容
  var textFieldContent = ''.obs;

  void clearTextField() {
    textFieldContent.value = ''; // 清空文本字段
  }

  void updateTextField(String value) {
    textFieldContent.value = value; // 更新文本字段内容
  }
}

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final List<String> _data = [
    '苹果',
    '香蕉',
    '橘子',
    '草莓',
    '菠萝',
    '桃子',
    '西瓜',
    '樱桃',
    '葡萄',
    '柚子',
    '芒果',
    '梨',
    "哈巴狗",
    "dog",
    "狗狗",
    "人模狗样",
    '哈密瓜',
    '猕猴桃',
    '火龙果',
    '杨桃',
    '柠檬',
    '荔枝',
    '桑葚',
    '李子',
  ];
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _controller.addListener(() {
      _isNotEmpty.value = _controller.text.isNotEmpty;
    });
    super.initState();
  }

  final _isNotEmpty = false.obs;
  final TextEditingController _controller = TextEditingController();
  final _suggestions = <String>[].obs;

  void _search(String query) {
    _suggestions.clear();
    if (query.isNotEmpty) {
      final suggestions = _data.where((item) => item.contains(query)).toList();
      _suggestions.assignAll(suggestions);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white, // AppBar的背景色设置为白色。
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios,
              color: Colors.black), // 返回按钮使用黑色图标。
          onPressed: () {
            Get.back();
          },
        ),
        titleSpacing: 0, // titleSpacing设置为0，确保title紧靠leading。
        title: Container(
            width: 304.w,
            height: 36.h, // 搜索框的高度。
            // 搜索框右边的外边距，确保和actions按钮对齐。
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 2.w),

              borderRadius: BorderRadius.circular(22.h), // 搜索框的圆角半径。
            ),
            child: TextField(
              controller: _controller,
              onChanged: _search,
              cursorHeight: 26.h,
              decoration: InputDecoration(
                prefixIcon:
                    const Icon(Icons.search, color: Colors.grey), // 左侧搜索图标
                hintText: '请输入搜索内容', // 提示文本。
                suffixIcon: Obx(() {
                  return _isNotEmpty.value
                      ? SizedBox(
                          width: 13,
                          child: IconButton(
                              alignment: Alignment.center,
                              icon: const Icon(
                                size: 13,
                                Icons.clear,
                                color: Colors.black,
                              ),
                              onPressed: () {
                                _controller.clear();
                                _search("");
                              }),
                        )
                      : Container(width: 13,); // 返回一个空的Container，而不是null
                }),
                border: InputBorder.none, // 去除底部边线。
                contentPadding: EdgeInsets.symmetric(vertical: 8.h),
              ),
            )),
        actions: [
          TextButton(
            child: const Text("搜索"),
            onPressed: () {},
          ),
        ],
        elevation: 0, // 去除阴影。
      ),
      body: Obx(() {
        if (_suggestions.isNotEmpty) {
          return ListView.builder(
              itemCount: _suggestions.length,
              itemBuilder: (context, index) {
                String item = _suggestions[index];
                int highlightIndex = item.indexOf(_controller.text);
                return ListTile(
                    title: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: item.substring(0, highlightIndex),
                            style: const TextStyle(color: Colors.black),
                          ),
                          TextSpan(
                            text: item.substring(highlightIndex,
                                highlightIndex + _controller.text.length),
                            style: const TextStyle(color: Colors.red),
                          ),
                          TextSpan(
                            text: item.substring(
                                highlightIndex + _controller.text.length),
                            style: const TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                    onTap: () {
                      _controller.text = item;
                    });
              });
        } else {
          return const SizedBox();
        }
      }),
    );
  }
}
