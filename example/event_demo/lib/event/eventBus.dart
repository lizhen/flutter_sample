//页面A中

//监听登录事件
// bus.on("login", (arg) {
// do something
// });

//登录页B中

//登录成功后触发登录事件，页面A中订阅者会被调用
//bus.emit("login", userInfo);

// 订阅者回调签名
typedef void EventCallback(arg);

class EventBus {
  // 私有构造函数
  EventBus._internal();

  // 保存单例
  static EventBus _singleton = new EventBus._internal();

  // 工厂构造函数
  factory EventBus() => _singleton;

  // 保存事件订阅者队列，key:事件名(id)，value:对应事件的订阅者队列
  var _emap = new Map<Object, List<EventCallback>>();

  // 添加订阅者
  void on(eventName, EventCallback f) {
    if (eventName == null || f == null) return;
    _emap[eventName] ??= new List<EventCallback>();
    _emap[eventName].add(f);
  }

  // 移除订阅者
  void emit(eventName, [arg]) {
    var list = _emap[eventName];
    if (list == null) return;
    int len = list.length - 1;
    // 反向遍历，防止在订阅者在回调中移除自身带来的下标错误
    for (var i = len; i > -1; --i) {
      list[i](arg);
    }
  }

  // 定义一个top-level变量，页面引入该文件后可以直接使用bus
  var bus = new EventBus();
}
