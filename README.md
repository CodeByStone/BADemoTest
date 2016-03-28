# BADemoTest
ios开发中重难点展示

>**开发中如有问题，可以联系本人**

**新浪微博：@博爱1616**

**QQ：     137361770**

**如果大神发现其中代码有bug，希望可以尽快联系本人修复，在此感谢各路大神的帮助！**
###本Demo中使用三方布局工具库【gsdios】开发的SDAutoLayout  原三方库地址： https://github.com/gsdios/SDAutoLayout
``` 在开发中遇到很多问题，非常感谢SDLayout（原作者gsdios）和其他各路大神的帮助，在此基础上开始更新自己开发中的重难点demo，希望能够帮助更多遇到类似难点的同道中人！ ```
***

#### 对pod还是不熟的同学，可以看下我的博客，是最新的pod安装和使用方法，

###### http://www.cnblogs.com/boai/p/4977976.html

###### 在DemoVC7的评论功能中使用了键盘处理的三方库，具体使用清看【AppDelegate】
***

# 更新记录：【倒叙】（最新的更新在最上面）【基本每天一更】

## 2016.03.28 --- 

>##1、新增DemoVC11，城市选择器
```
实现一行代码回调结果：
- (void)getSelectCity:(NSString *)city;

![image](https://github.com/boai/BADemoTest/blob/master/Image/image6.png)

## 2016.03.23 --- 

>##1、新增DemoVC10，多级评论，点击可显示评论详情

![image](https://github.com/boai/BADemoTest/blob/master/Image/image3.png)
![image](https://github.com/boai/BADemoTest/blob/master/Image/image5.png)


## 2016.03.22 --- 

>##1、添加UIImageView 和 UIView 的扩展方法

## 2016.03.20 --- 

>##1、添加【DemoVC9】增加NSString类的扩展
```
/**
*  获得系统当前日期和时间
*
*  @return 获得系统当前日期和时间
*/
+ (nullable NSString *)getCurrentDateAndTime;
/**
*  时间戳转换【YYYY-MM-dd HH:mm:ss】
*
*  @param string 时间戳
*
*  @return 时间戳转换【YYYY-MM-dd HH:mm:ss】
*/
+ (nullable NSString *)getCurrentDateAndTimeWithTimeString:(nullable NSString *)string;
/**
*  时间戳转换【YYYY-MM-dd】
*
*  @param string 时间戳
*
*  @return 时间戳转换【YYYY-MM-dd】
*/
+ (nullable NSString *)getDateWithTimeString:(nullable NSString *)string;
/**
*  时间戳转换【HH:mm】
*
*  @param string 时间戳
*
*  @return 时间戳转换【HH:mm】
*/
+ (nullable NSString *)getTimeWithTimeString:(nullable NSString *)string;
/**
*  时间转换时间戳
*
*  @param string 时间
*
*  @return 时间转换时间戳
*/
+ (nullable NSString *)getTimeStamp;
/**
*   Trim blank characters (space and newline) in head and tail.
*
*  @return the trimmed string.
*/
- (nullable NSString *)stringByTrim;
/**
*   Try to parse this string and returns an `NSNumber`.
*
*  @return Returns an `NSNumber` if parse succeed, or nil if an error occurs.
*/
- (nullable NSNumber *)numberValue;
/**
*  Returns an NSData using UTF-8 encoding.
*
*  @return Returns an NSData using UTF-8 encoding.
*/
- (nullable NSData *)dataValue;
/**
*   Create a string from the file in main bundle (similar to [UIImage imageNamed:]).
*
*  @param name The file name (in main bundle).
*
*  @return A new string create from the file in UTF-8 character encoding.
*/
+ (nullable NSString *)stringNamed:(nullable NSString *)name;
/**
*   Returns a lowercase NSString for md5 hash.
*
*  @return  Returns a lowercase NSString for md5 hash.
*/
- (nullable NSString *)md5String;
/**
*   Returns a lowercase NSString for hmac using algorithm md5 with key.
*
*  @param key The hmac key.
*
*  @return  Returns a lowercase NSString for hmac using algorithm md5 with key.
*/
- (nullable NSString *)hmacMD5StringWithKey:(nullable NSString *)key;

![image](https://github.com/boai/BADemoTest/blob/master/Image/image2.png)



## 2016.03.19 --- 

>##2、添加【DemoVC8】可以动态显示label的高度

![](https://github.com/boai/BADemoTest/blob/master/Image/gif1.gif)

>##1、修复用户在git下载后pod报错的bug，已修复，之前下载的用户可以重新下载！

## 2016.03.17 --- 

>##4、【DemoVC7】新增评论列表（用SDAutoLayout 布局库） 

>####☆☆ 4.1 新增单个评论的评论详情界面
>####☆☆ 4.2 新增点赞、回复按钮，实增评论回复功能，可显示到当前tableView中

![](https://github.com/boai/BADemoTest/blob/master/Image/gif2.gif)

>##3、【DemoVC6】新增tableView的另一种cell的用法【评论列表（用SDAutoLayout 布局库）】 

>##2、【DemoVC5】新增tableView的另一种cell的用法【评论列表（用WHC 布局库）】 

![image](https://github.com/boai/BADemoTest/blob/master/Image/gif3.gif)

>##1、【DemoVC4】新增tableView的另一种cell的用法 

![image](https://github.com/boai/BADemoTest/blob/master/Image/image4.png)


***

## 2016.03.16 --- 

***

>##3、【DemoVC3】用SDLayout 布局三方库 和系统frame 混合使用，创建一个多分区，多种cell样式，文字自适应的tableView

####   ☆☆ 3.1 在这个demoVC3中，第二中cell样式中，用纯代码写了一个自定义button（图片在上，文字在下，且都居中显示），有需要的可以直接用，还可以自定义左右显示（第一种cell样式中的playButton就是左右显示）

![image](https://github.com/boai/BADemoTest/blob/master/Image/gif4.gif)


>##2、【DemoVC2】用SDLayout 布局三方库，写了一个微信朋友圈（原作者GSD_ios）

![image](https://github.com/boai/BADemoTest/blob/master/Image/gif5.gif)

>##1、【DemoVC1】view中嵌套自定义view2，view2中嵌套不同view3、和tableView

![image](https://github.com/boai/BADemoTest/blob/master/Image/image1.png)


>#未完待续！！！









