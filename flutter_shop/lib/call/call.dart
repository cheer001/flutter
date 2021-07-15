class Call {
  static Map<String, List<Function>> _callMap = Map<String, List<Function>>();
  static Future<void> addCallBack(String type, Function callback) async {
    if (_callMap[type] == null) {
      _callMap[type] = [];
    }
    if (await hasCallBack(type, callback) == false) {
      _callMap[type]!.add(callback);
    }
  }

  static Future<bool> hasCallBack(String type, Function callback) async {
    if (_callMap[type] == null) {
      return false;
    }
    return _callMap[type]!.contains(callback);
  }

  static Future<void> removeCallBack(String type, Function callback) async {
    if (_callMap[type] == null) {
      return;
    }
    _callMap[type]!.remove((element) => element == callback);
  }

  static Future<void> dispath(String type, {dynamic data}) async {
    if (_callMap[type] == null) {
      throw Exception('回调事件 $type 没有监听，发送失败');
    }
    _callMap[type]!.forEach((element) {
      element(data);
    });
  }
}
