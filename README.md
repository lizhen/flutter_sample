# flutter_sample 有什么

flutter_sample有许多flutter相关功能demo的集合，他能够帮助您快速学习一些零碎的知识，本项目将会不定期更新。敬请期待...

### 共同困惑

我和大家一样，最开始接触到flutter的时候，发现有大量的官方Widget。但是真正要想实现自己的页面的时候，却发现自己不清楚到底该用哪个来实现。于是就跑去看官方的sample。
当然，官方的sample跑起来是很好看的，但是一个小功能，动辄就有500行以上的代码，并且各种与该功能无关的信息都在一个文件中。让人看了确实很头痛。

### 让代码讲故事

所以我开始整理一些小的demo，专注于单一功能的实现，尽量让代码解释自己，我认为这是学习flutter最快的方式。 每个demo我尽量控制在100行代码以内，让代码讲一个短小但又精彩的故事。其中也有不少国外的哥们写的好的demo也被我收录进来了。

## 目前包含以下demo：

### 官方控件系列

#### 视图
- [container_demo Container的使用]

- [layout_demo 简单布局]

- [scroll_demo 可滚动的]

- [flutter_bottomnavigationbar 底部导航]

使用 BottomNavigationBar 进行底部导航；
使用 AutomaticKeepAliveClientMixin 保持底部导航状态；
   
- [bottom_appbar_demo 底部导航]

使用 BottomAppBar 进行底部导航；

- [custom_router_transition 自定义路由切换动画]

继承 PageRouteBuilder 实现自定义路由
```
Navigator.of(context).push(CustomeRouter(SecondPage()))
```

- [frosted_glass_style_demo 高斯模糊（毛玻璃）]

- [keep_alive_demo 切换页面，保持各页面状态]

- [search_bar_demo 制作一个精美的Material风格搜索框]

- [textfield_demo TextField的焦点及动作]

- [warp_demo 微信九宫格效果]

- [chip_demo 标签控件chio系列]

- [expansion_demo 可展开控件expansion系列]

- [sliver_demo 可滑动控件Sliver系列]

- [clipper_demo 使用贝塞尔二阶区县切割图像]

- [reorderble_listview_demo 用户可以通过拖动以交互方式重新排序的项目列表]

- [sliver_demo]

- [widget_demo 自定义组件]

#### 功能
- [will_pop_scope_demo 返回上一页时弹出提示信息]
- [splash_screen_demo 应用开启进入闪屏页]
- [pull_loading_demo 上拉加载，下拉刷新]
- [listview_dismiss_demo 左滑删除ListView中Item]
- [right_back_demo 右滑返回上一页]
- [widget_to_image_demo 在flutter中截屏]
- [tooltip_demo 轻量级操作提示控件toolstip]
- [draggable_demo 可拖动组件draggable]
- [without_splash_demo 去掉点击事件的水波纹效果]
- [overlay_demo 在当前页面上覆盖新的组件overlay]
- [event_bus_demo 在不同页面传递事件EventBus]
- [file_demo 文件操作]
- [websocket_demo WebSocket]
- [event_demo 事件与通知]

#### 动画
- [animation_demo 基本动画样例]
- [ ]
- []
- []
- []
- []

#### 优秀第三方库
- [webview_flutter_demo ]
基于社区的webview实现flutter到webview的通讯，及反向通讯；

- [webview_flutter_demo]
基于官方的webview实现flutter到webview的通讯，及反向通讯；

- [nfc_demo]
- [rxdart_demo]

- [select_multiple_images_demo 选取多图]
- []

#### DEMO
- [flutter_netease_music 仿网易音乐]
- [twitter_like_demo 仿Twitter点赞效果]
- [tantan_drag_demo 仿探探左右滑效果]
