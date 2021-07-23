

#### Flutter优势

1. 一份代码可以运行在各个平台
2. 它在设计过程中引用了很多前端框架的有点
3. 运行效率和速度快
4. 与Firebase进行了集成
5. 使用了dart变成语言
6. 使用了Material Design,帮助开发人员快速搭建UI
7. 有好的文档与三方类库

#### Flutter环境搭建(Windows)

基于android应用是需要Java环境的,[JDK下载地址](https://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html)

##### [Java环境配置](https://www.runoob.com/java/java-environment-setup.html)

##### [Flutter包](https://flutter.dev/docs/development/tools/sdk/releases#windows)

##### Flutter环境变量配置

**用户变量**(国内用户配置)
FLUTTER_STORAGE_BASE_URL
https://storage.flutter-io.cn
PUB_HOSTED_URL
https://pub.flutter-io.cn

**系统变量**
Path 
D:\software\flutter\bin (flutter包的解压路径)
做完这一步可以在命令行窗口输入：`flutter doctor`   检查还有哪些项未达标

##### 搭建Android环境

下载 [android studio](https://developer.android.com/studio?hl=zh-cn)
进入android studio界面
![1624877110700](C:\Users\Administrator\AppData\Roaming\Typora\typora-user-images\1624877110700.png)
如果C盘足够大可以不用修改SDK下载的位置

Android环境变量配置

**系统变量**
新建系统变量
ANDROID_HOME
F:\software\Android\Sdk
ANDROID_SDK_HOME
F:\AndroidVirtualDevices	(这里我修改过默认安卓虚拟机存放位置)
Path
%ANDROID_HOME%\tools
%ANDROID_HOME%\platform-tools

##### 创建AVD

![1624877738320](C:\Users\Administrator\AppData\Roaming\Typora\typora-user-images\1624877738320.png)
![1624877771112](C:\Users\Administrator\AppData\Roaming\Typora\typora-user-images\1624877771112.png)

如果电脑默认关闭了虚拟化，需要重启(按F2~F12)进入BIOS将虚拟化(VT)改为enable，才能打开创建好的安卓虚拟机

##### 启动AVD

###### android studio中启动

![1624877924563](C:\Users\Administrator\AppData\Roaming\Typora\typora-user-images\1624877924563.png)

###### bat文件启动

F:\software\Android\Sdk\emulator\emulator.exe -netdelay none -netspeed full -avd Galaxy_Nexus_API_30

###### VSCode启动

在VSCode工具右下角 点击  No Devices 

#### 项目创建

flutter create 项目名(单词全小写，多个单词之间用下划线连接)

#### Flutter常用命令

`flutter clean` 清空项目中的依赖包

`flutter pub get` 从pub.dev下载依赖包

`flutter pub add 包名 ` (推荐使用) 下载项目适合的包

`flutter run` 运行项目

* p :显示网格
* o :切换为ios
* q :退出项目

 `flutter build apk` 打包项目为.apk文件

`flutter install` 安装项目apk到目标设备

#### Flutter项目代码结构

```java
void main(){} //项目执行入口
void main()=> runApp([Widget]);//运行项目函数
```

* Material :  Android默认的视觉风格 

* Cupertino : iOS视觉风格

  * `home:写App界面框架的代码 类似于 html 的<body> ，flutter提供了Sacffold脚手架帮助构建基础UI`

    ```java
    void main() {
      runApp(MaterialApp(
          home: Scaffold(
              appBar: AppBar(
                title: Text("first flutter"),
                centerTitle: true,
              ),
              body: Center(
                child: Text("Android Programming"),
              ))));
    }
    ```

    <img src="C:\Users\Administrator\AppData\Roaming\Typora\typora-user-images\1624970058186.png" alt="1624970058186" style="zoom:50%;" />

##### 常用widget组件

###### Center 

`child:写需要在此widget中居中的代码`

###### Text("string")

style:编写文本样式，提供了**TextStyle**

###### container

* alignment : 对其方式

  ```dart
  alignment: Alignment.center,
  ```

  

###### Button

1. RaisedButton:带阴影的按钮
2. FlatButton：平面按钮

* onPressed() : 按压事件

* 设置radius

  ```dart
  shape:RoundeRectangleBorder(
  	borderRadius:BorderRadius.all(
      Radius.circular(25)),
  )
  ```

3. InkWell
   * onTap() : 触摸事件(等同于点击事件)

##### 状态组件

###### Stateless(无状态组件)

无状态组件是无法改变状态的，无状态组件在程序运行中只能被创建一次，如果它的状态被改变了 它就会创建一个新的实例，旧的实例就不会再被复用

```java
/// 代码模板 */
class name extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(//返回一个Widget
      child: null,
    );
  }
}
```

###### Stateful(有状态组件)

可以改变组件的状态，对于当前组件内部状态的改变 它都会刷新当前组件，它提供了相应的刷新方法**setState**

* setState((){}) : 只有这个方法才能改变当前组件的额状态，每调用一次当前组件就会调用一次build()方法来刷新当前组件

* initState() : 在组件创建时会被调用，并且只调用一次

  * 作用：做一些组件的初始化操作，也可以定义一些流或者是能够改变当前组件的数据

* Build() : 构建组件树，初始化后使用setState()触发此方法

* Dispose() : 组件删除时被调用

  * 作用：可以在此方法中做清理的工作

* 使用widget获取nameWidet中声明的变量

  ```dart
  /// 圆形选择框 */
  class CircleCheckBox extends StatefulWidget {
    bool value = false;
    Function onChanged;
  
    CircleCheckBox({
      Key? key,
      required this.value,
      required this.onChanged,
    }) : super(key: key);
    @override
    _CircleCheckBoxState createState() => _CircleCheckBoxState();
  }
  
  class _CircleCheckBoxState extends State<CircleCheckBox> {
    @override
    Widget build(BuildContext context) {
        return GestureDetector(
              onTap: () {
                widget.value = !widget.value;
                widget.onChanged(widget.value);
              },
            	child:Text("按钮"),
        ),
    }
  }
  ```

  

```dart
/// 代码模板 */
class name extends StatefulWidget {
  @override
  _nameState createState() => _nameState();
}

class _nameState extends State<name> {//返回一个状态的对象
  @override
  Widget build(BuildContext context) {
    return Container(
      child: null,
    );
  }
}
```

* 防止刷新 保持当前状态

  ```
  Stateful组件 with AutomaticKeepAliveClientMixin {
    /// 防止刷新处理 保持当前状态
    @override
    bool get wantKeepAlive => throw UnimplementedError();
  ```

  

**Stateless与Stateful区别：**
Stateless：

1. 返回一个Widget
2. 每次当前组件改变返回一个新的实例
3. 在MaterialApp中使用时可以使用Hot Reload(热更新)

Stateful：

1. 返回一个状态的对象
2. 每次当前组件改变刷新当前组件
3. 在MaterialApp中使用时可以使用Hot Restart(手动更新)

##### Json转Dart Model类

* 一般我们调用接口获取数据都会转成Json对象在项目中使用，但是在转换Json对象进行属性赋值时很容易敲错字段，所以dart提供了Json Model化

  1. 安装需要的依赖包

  ```
  dependencies:
    #序列化json对象
    json_serializable: ^4.1.0
    json_annotation: ^4.0.1
  dev_dependencies:
    #自动生成Model
    build_runner: ^1.0.0
  ```

  2. 定义一些json结构对应的model类

     ```dart
     import 'package:json_annotation/json_annotation.dart';
     
     //这里写  文件名.g.dart  *
     part 'user_model.g.dart';
     
     /// 用户数据模型
     @JsonSerializable()
     class UserModel {
       //Id
       int? id;
       //Token值
       String? token;
       //用户名
       String? username;
       //手机号
       String? mobile;
       //用户头像
       String? head_image;
       //用户地址
       String? address;
     
       ///构造函数
       UserModel({
         required this.id,
         required this.token,
         required this.username,
       });
     
       ///取Json数据  *  _$类名FromJson(json);
       factory UserModel.fromJson(Map<String, dynamic> json) =>
           _$UserModelFromJson(json);
     
       ///将数据转成Json  *  _$类名ToJson(this);
       Map<String, dynamic> toJson() => _$UserModelToJson(this);
     }
     
     ```

  3. 上面的模板代码写完后我标有(*)的位置会出现编译错误，是因为还没生成User类对应的序列化模板
     `flutter packages pub run build_runner build`

     运行完后会在user_model.dart所在目录下生成user_model.g.dart文件

* 实现接口字段名与项目中时段名不一样时，关联JSON字段名与Model属性的对应关系 

  ```
  //显式关联JSON字段名与Model属性的对应关系 
  @JsonKey(name: 'registration_date_millis')
  final int registrationDateMillis;
  ```

  

##### 常用插件

```yaml
#轮播组件
flutter_card_swipper: ^0.4.0
#屏幕适配组件
flutter_screenutil: ^5.0.0+2
#上拉刷新组件
flutter_easyrefresh: ^2.2.1
#提示组件
fluttertoast: ^8.0.7
#展示详情组件
flutter_html: ^2.1.0
#本地存储组件
shared_preferences: ^2.0.6

#自动化的源代码生成器
json_serializable: ^4.1.3
```



##### 模板字符串拼接

1. '$变量'
2. '${对象/对象.属性}'

##### 图片

1. 将图片添加到项目工程的assets/images下(没有则创建)

2. `pubspec.yaml文件中进行配置,flutter会做一些预处理的工作`

   ```java
   assets:
       - assets/images/
   ```

3. 在项目的widget中使用

   + `child: Image(`

     ​     **image: AssetImage("assets/images/space-1.jpg"),**
     ` ),`

   + `child: `**Image.asset("assets/images/space-1.jpg")**`,`

##### 路由导航

使用**Navigator**类

* pushNamed(context,路由地址) : 将新的页面重叠在跳转前页面的上面(我们看到的就是跳转后的页面了)
  * 可以使用dynamic类型接收pop()弹出时传递的参数 
* pop() : 将重叠的路由页面从当前栈中弹出(我们看到的就是重叠下面的页面)

##### 更换应用字体

1. https://fonts.google.com/`选择一款字体下载、解压，将.ttf文件拷贝到项目fonts目录下(没有则创建)`

2. `pubspec.yaml文件中进行配置,flutter会做一些预处理的工作`

   ```java
   fonts:
       - family: Benne   #字体文件名(-Regular.ttf前面的名字)
         fonts:
           - asset: fonts/Benne-Regular.ttf
       - family: Yellowtail
         fonts:
           - asset: fonts/Yellowtail-Regular.ttf
   ```

3. 在项目的widget中使用
   `style: TextStyle(
    fontSize: 20.0,
    fontWeight: FontWeight.bold,`
    **fontFamily: "Benne"**`),`

#### Flutter客户端打包

* flutter_shop\android\app\src\main\AndroidManifest.xml

  ```xml
  android:label="flutter_shop"   //配置APP的名称，支持中文
  android:icon="@mipmap/ic_launcher" //APP图标的文件名称
  ```

* 生成keystore
  官方文档提供命令：(需要改一改)

  `keytool -genkey -v -keystore ~/key.jks -keyalg RSA -keysize 2048 -validity 10000 -alias key`

  1. flutter doctor -v   **Android toolchain** 这一栏 找到AndroidStudio安装目录下的keytool(F:\software\AndroidStudio\jre\bin\keytool)
  2. ~/key.jks  改为 .jks文件存放的目录(E:/key.jks)   斜杠是（/）这种
  3. `F:\software\AndroidStudio\jre\bin\keytool -genkey -v -keystore E:/key.jks -keyalg RSA -keysize 2048 -validity 10000 -alias key`

* 在`项目工程/android`文件下新建key.properties文件

  ```
  storePassword=123456
  keyPassword=123456
  keyAlias=key
  storeFile=E:/key.jks
  ```

* 在`项目工程/android/app/build.gradle`文件 配置key注册 

  1. 替换 

     ```
     `android {`
     ```

     ```
     def keystorePropertiesFile = rootProject.file("key.properties")
     def keystoreProperties = new Properties()
     keystoreProperties.load(new FileInputStream(keystorePropertiesFile))
     
     android {
     ```

  2.  替换

     ```
     buildTypes {
         release {
             // TODO: Add your own signing config for the release build.
             // Signing with the debug keys for now, so `flutter run --release` works.
             signingConfig signingConfigs.debug
         }
     }
     ```

     ```
     signingConfigs {
             release {
                 keyAlias keystoreProperties['keyAlias']
                 keyPassword keystoreProperties['keyPassword']
                 storeFile file(keystoreProperties['storeFile'])
                 storePassword keystoreProperties['storePassword']
             }
         }
         buildTypes {
             release {
                 signingConfig signingConfigs.release
             }
         }
     ```

  3. flutter build apk

#### Flutter开发推荐插件

Dart
Flutter
Awesome Flutter Snippets	:提供创建Widget快捷方式
Bracket Pair Colorizer 2	: 提高代码的可读性 
Pubspec Assist	:Ctrl + Shift + p 打开命令面板 输入：pubspec  可以将所有包更新到最新版本 
![1624873891131](C:\Users\Administrator\AppData\Roaming\Typora\typora-user-images\1624873891131.png)

Image Preview	:将光标移动到图片路径上可预览图片
Material Icon Theme	: 分清主题各个不同类型文件 

