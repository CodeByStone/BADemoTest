//
//  DemoVC23.m
//  demoTest
//
//  Created by 博爱 on 16/4/23.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import "DemoVC23.h"

@interface DemoVC23 ()

@property (nonatomic, strong) UISlider  *slider;
@property (nonatomic, strong) UILabel   *label;

@end

@implementation DemoVC23

- (UISlider *)slider
{
    if (!_slider)
    {
        _slider = [UISlider new];
        _slider.frame = CGRectMake(20, 50, BA_SCREEN_WIDTH - 40, 20);
        _slider.minimumValue = 0;
        _slider.maximumValue = 100;
        _slider.minimumTrackTintColor = BA_Green_Color;
        _slider.maximumTrackTintColor = BA_Red_Color;
        
        [_slider addTarget:self action:@selector(slideChange:) forControlEvents:UIControlEventValueChanged];
        [self.view addSubview:_slider];
    }
    return _slider;
}

- (UILabel *)label
{
    if (!_label)
    {
        _label = [UILabel new];
        _label.frame = CGRectMake(_slider.x, _slider.bottom + 30, BA_SCREEN_WIDTH - 40, 50);
        _label.backgroundColor = BA_BGGrayColor;
        _label.textAlignment = NSTextAlignmentCenter;
        _label.font = BA_FontSize(18);
        [self.view addSubview:_label];
        
    }
    return _label;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.slider.hidden = NO;
    self.label.hidden  = NO;
    
    [self KVC];
    [self KVO_Value];
}

- (void)KVC
{
    /*!
     
     KVC
       KVC也就是key-value-coding,即键值编码，通常是用来给某一个对象的属性进行赋值，例如有人这么一个类，其对外有两个属性，姓名和年龄,我们在创建了一个人p后可以通过点语法直接给p赋值。
     
     Person *p = [[Person alloc] init];
     p.name = @"张三";
     p.age = 20;
     
     我们也可以通过kvc给这个人p赋值,代码如下,因为setValue这里的值是id类型的,所以将整数包装成一个对象,
     
     [p setValue:@"张三" forKey:@"name"];
     [p setValue:@20 forKey:@"age"];
     
     除了[p setValue:@170 forKey:@"height"]这个方法外,还有一个方法也是可以对私有属性进行赋值的[p setValue:@170 forKeyPath:@"height"];这两个方法对于一个普通的属性是没有区别的,都可以用,但是对于一些特殊的属性就有区别了。
     比如说人这个类有个属性是狗,狗又有属性体重。
     
     p.dog = [[Dog alloc] init];
     [p setValue:@200 forKey:@"dog.weight"];
     
     
     kvc最常见的两种用法就是:
     
     1，对私有变量进行赋值
     2，字典转模型
     但是也有一些需要注意的地方
     
     1，字典转模型的时候,字典中的某一个key一定要在模型中有对应的属性
     2，如果一个模型中包含了另外的模型对象,是不能直接转化成功的。
     3，通过kvc转化模型中的模型,也是不能直接转化成功的。
     
       既然可以通过kvc赋值,同样的也可以通过它进行取值。
     
     所以，在此不多做解释！
     */
    
}

#pragma mark - KVO的实现
- (IBAction)slideChange:(UISlider *)slider
{
    //  在这里判断sender的value, 根据value 来修改颜色
    //   一旦有20个滑动条可以改变label的值, 那么需要在20个位置写判断
    self.label.text = @(slider.value).stringValue;
}

- (void)KVO_Value
{
    /*!
     
     KVO，即key-value-observing,利用一个key来找到某个属性并监听其值得改变。其实这也是一种典型的观察者模式。
     简单的说，kvo的用法非常简单。
     1，添加观察者
     2，在观察者中实现监听方法，observeValueForKeyPath: ofObject: change: context:（通过查阅文档可以知道，绝大多数对象都有这个方法，因为这个方法属于NSObject）
     3,移除观察者
     
     */
    
    /*
     参数1: 哪个对象观察
     参数2:观察的是label的哪个属性
     参数3:要观察属性的哪种变化
     */
    // 对label的text值添加kvo操作,键值观察操作
       [_label addObserver:self forKeyPath:@"text" options:NSKeyValueObservingOptionNew context:nil];
    
    // 可以使用blocksKit 简写kvo
    [self.label bk_addObserverForKeyPath:@"text" options:NSKeyValueObservingOptionNew task:^(id obj, NSDictionary *change) {
        
        NSString *value = change[@"new"];
        NSLog(@"标签内容被修改 %@", value);
        
        if (value.floatValue >= 0 && value.floatValue < 20)
        {
            _label.backgroundColor = [UIColor redColor];
        }
        if (value.floatValue >=20 && value.floatValue < 40)
        {
            _label.backgroundColor = [UIColor purpleColor];
        }
        if (value.floatValue >= 40 && value.floatValue < 60)
        {
            _label.backgroundColor = [UIColor greenColor];
        }
        if (value.floatValue >= 60)
        {
            _label.backgroundColor = [UIColor blueColor];
        }
        
    }];
    return;
}

#pragma mark - 实现KVO回调方法
/*
 *  当对象的属性发生改变会调用该方法
 *  @param keyPath 监听的属性
 *  @param object  监听的对象
 *  @param change  新值和旧值
 *  @param context 额外的数据
 */
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if (object == _label)
    {
        NSString *value = change[@"new"];
        NSLog(@"标签内容被修改 %@", value);
        
        /*
         值: 0~20 红色
         20~40 紫色
         40~60 绿色
         60 ~ 80 棕色
         80~100 蓝色
         */
        
        if (value.floatValue >= 0 && value.floatValue < 20)
        {
            _label.backgroundColor = [UIColor redColor];
        }
        if (value.floatValue >=20 && value.floatValue < 40)
        {
            _label.backgroundColor = [UIColor purpleColor];
        }
        if (value.floatValue >= 40 && value.floatValue < 60)
        {
            _label.backgroundColor = [UIColor greenColor];
        }
        if (value.floatValue >= 60)
        {
            _label.backgroundColor = [UIColor blueColor];
        }
        
    } else {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}

/*! 最后不要忘记，和通知一样，要在dealloc方法里面移除监听 */
- (void)dealloc
{
    [self removeObserver:_label forKeyPath:@"text"];
}

@end
