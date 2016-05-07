# BADemoTest
ios开发中重难点展示

>**开发中如有问题，可以联系本人**

##            本Demo迁移通知！

#### 为更好的整理iOS开发遇到的各种问题及bug处理，本人重新设计了一个主要使用 MVVM 设计模式 和 MVC 设计模式的基本项目框架 [『BABaseProject』](https://github.com/boai/BABaseProject) ，项目用到的各种类，各种封装，各种三方库的综合项目，欢迎大家使用！

#### 故 本demo不在继续更新，需要的朋友请前往下载最新demo [『BABaseProject』](https://github.com/boai/BABaseProject) ，再次感谢大家对我的支持！

## 0、个人简介
**新浪微博：@博爱1616** <br>
**QQ：     137361770** <br>
**博客：http://boai.github.io** <br>
**博客园：http://www.cnblogs.com/boai/** <br>
**简书：http://www.jianshu.com/users/95c9800fdf47/latest_articles** <br>


## 1、推荐:
#### 完全实现button的自定义的类库，pod 导入：   pod 'BAButton', '~> 1.0.1'
如果发现pod search BAButton 搜索出来的不是最新版本，需要在终端执行cd转换文件路径命令退回到desktop，然后执行pod setup命令更新本地spec缓存（可能需要几分钟），然后再搜索就可以了
具体步骤：
- pod setup : 初始化
- pod repo update : 更新仓库
- pod search BAButton

#### 对pod还是不熟的同学，可以看下我的博客，是最新的pod安装和使用方法，

###### http://www.cnblogs.com/boai/p/4977976.html

***

## 2、更新记录：【倒叙】（最新的更新在最上面）【基本每天一更】以后均不加图片展示，需要根据功能自行下载demo运行！

### 2016.04.27 ---

>###1、新增DemoVC25，两种视频播放器，可自定义UI，源码1有WMPlayer作者提供，源码2来自git，自己加以综合优化！

### 2016.04.23 ---

>###3、新增DemoVC24，多页面通知传值

>###2、新增DemoVC23，KVC和KVO监测

>###1、新增DemoVC22，自定义textView封装placholder

### 2016.04.22 --- 

>###1、新增DemoVC21，自定义绘图

### 2016.04.21 --- 

>###1、新增DemoVC20，自定义collectionView封装

### 2016.04.20 --- 

>###3、新写博客：iOS 学习笔记七 【博爱手把手教你使用2016年gitHub Mac客户端】
http://www.cnblogs.com/boai/p/5412952.html

>###2、优化性能

>###1、优化自定义navi，新增白色statusbar，新增加载框的封装

### 2016.04.12 --- 

>###1、新增DemoVC19、联系人分组（带索引），中英文混合排序，已优化点击事件！

### 2016.04.10 --- 

>###1、新增：runtime的详细说明及demo，首先声明：此demo是CocoChina的大神写的，我搜集了很多相关资料，整合了这个demo，如有版权问题，记得通知下我！立即删除！

### 2016.04.10 --- 

>###2、新增DemoVC18，gif动画封装

>###1、新增两种动画，CADisplayLink（雪花动画）和CAEmitterLayer（樱花），感兴趣的同学可以看看！

### 2016.04.9 --- 

>###2、新增首页的樱花动画！

>###1、新增渐变navigation，可自定义navigation，且可滑动返回上一界面！

### 2016.04.8 --- 

>###1、新增demoVC17，QQ好友分组，点击事件完美运行！（源码来自git加以优化！）

### 2016.04.7 --- 

>###1、新增FPS显示！

### 2016.04.6 --- 

>###3、新增demoVC16，友盟分享和友盟登陆！完美封装！

>###2、新增新浪微博demo，链接：【 https://github.com/boai/BAWeiBo 】

>###1、新增demoVC15，用MVVM模式优化tabelView，提升流畅度！

### 2016.04.1 --- 

>###2、新增AppDelegate+BATest测试，系统版本号等获取！
>###1、优化demoVC7和10的评论和回复

### 2016.03.31 --- 

>###2、整理了下目前已有的BAKit框架，已打包，后期可pod下载！需要的同学可自行下载！

>###1、自定义collectionView的UICollectionViewFlowLayout，仿写了一个LOL的选择英雄的界面（源码来自网络，非原创）
![image](https://github.com/boai/BADemoTest/blob/master/Image/gif6.gif)

### 2016.03.30 --- 

>###2、APP中的文字和APP名字的国际化多语言处理
具体详情可以查看我的博客：http://www.cnblogs.com/boai/p/5337558.html

![image](https://github.com/boai/BADemoTest/blob/master/Image/image9.jpg)
![image](https://github.com/boai/BADemoTest/blob/master/Image/image10.png)

>###1、新增demoVC13，对webView 和 webVC的封装处理，
```
UIWebView *webView = [UIWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:urlStr] ] loaded:^(UIWebView *webView) {
        NSLog(@"Loaded %@", webView.request.URL);
    } failed:^(UIWebView *webView, NSError *error) {
        NSLog(@"Failed loading with error: %@", error.localizedDescription);
    }];
    webView.frame = frame;
    webView.scalesPageToFit = YES;
    [self.view addSubview: webView];

## 2016.03.29 --- 
>##3、新增demoVC12，alert封装，简单的一行代码block回调！
```
    /** 下面是带输入框的alert，自适应系统 */
    [self BAAlertWithTitle:@"测试ios7Alert" message:@"ios7Alert message" buttons:@[KCancel, KSure]  textFieldNumber:2 configuration:^(UITextField *field, NSInteger index) {
        if (index == 0)
        {
            field.secureTextEntry = NO;
            field.placeholder = @"请输入账号：";
        }
        if (index == 1)
        {
            field.secureTextEntry = YES;
            field.placeholder = @"请输入密码：";
        }
    } animated:YES action:^(NSArray<UITextField *> *fields, NSInteger index) {
        NSLog(@"账号：%@, 密码：%@", fields[0].text, fields[1].text);
    }];

![image](https://github.com/boai/BADemoTest/blob/master/Image/image7.png)
![image](https://github.com/boai/BADemoTest/blob/master/Image/image8.png)


>###2、新增modal动画封装类，和alert封装类

>###1、新版百度地图API的定位于反地理编译的使用详情，具体先看博客，后期更新demo，
http://www.cnblogs.com/boai/p/5332365.html

### 2016.03.28 --- 

>###1、新增DemoVC11，城市选择器
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








