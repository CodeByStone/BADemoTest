//
//  DemoVC18.m
//  demoTest
//
//  Created by 博爱 on 16/4/9.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import "DemoVC18.h"
#import "Person.h"
#import <objc/runtime.h>

@interface DemoVC18 ()<PersonDelegate>

@end

@implementation DemoVC18

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = BA_White_Color;
    
    // 测试GIF动态图
    [self BA_useGIFImageViewWithGifImageName:@"gif1.gif" frame:CGRectMake(0, 0, BA_SCREEN_WIDTH, BA_SCREEN_HEIGHT)];
    
    // 首先声明：此demo是CocoChina的大神写的，我搜集了很多相关资料，整合了这个demo，如有版权问题，记得通知下我！立即删除！
//    [self test1];
//    [self test2];
//    [self test3];
//    [self test4];
//    [self test5];
    [self test6];
}

/*
 名词解析
 
 什么是runtime?
 
 runtime直译就是运行时间,run(跑,运行) time(时间),网上大家都叫它运行时,它是一套比较底层的纯C语言API,属于一个C语言库,包含了很多底层的C语言API,它是OC的幕后工作者,我们平时写的OC代码,在运行过程时,都会转为runtime的C语言代码
 
 runtime有什么用?
 
 如果你之前不知道runtime,可能觉得它没什么用,其实他的作用非常强大.下面我们就以代码的形式为大家揭开runtime的神秘面纱
 
 作用1  获取一个类全部成员变量名(如果你的成员私有,也可以获取到)
 我们新建一个Person类,.h代码如下:详见[Person.h]文件
 
 这些成员变量都是公有的,我们直接点开头文件就可以看到,如果是系统的类呢,你是不是就不知道类里面有哪些成员了,利用runtime可以轻松解决这个问题
 
 这里是【test1】；
 
 成员变量
 
 1、定义：
 
 Ivar: 实例变量类型，是一个指向objc_ivar结构体的指针
 
 typedef struct objc_ivar *Ivar;
 2、操作函数：
 
 // 获取所有成员变量
 class_copyIvarList
 // 获取成员变量名
 ivar_getName
 // 获取成员变量类型编码
 ivar_getTypeEncoding
 // 获取指定名称的成员变量
 class_getInstanceVariable
 // 获取某个对象成员变量的值
 object_getIvar
 // 设置某个对象成员变量的值
 object_setIvar
 
 */
- (void)test1
{
    unsigned int count;
    // 获取成员变量的结构体
    Ivar *ivars = class_copyIvarList([Person class], &count);
    
    for (int i = 0; i < count; i++)
    {
        Ivar ivar = ivars[i];
        // 根据ivar获得其成员变量的名称
        const char *name = ivar_getName(ivar);
        // C的字符串转OC的字符串
        NSString *key = [NSString stringWithUTF8String:name];
        BALog(@"1、获取一个类的全部成员变量名：%d == %@", i, key);
    }
    // 记得释放
    free(ivars);
}
/*
 2016-04-11 19:16:28.135 runTimetest[36263:486317] 1、获取一个类的全部成员变量名：0 == _str1
 2016-04-11 19:16:28.135 runTimetest[36263:486317] 1、获取一个类的全部成员变量名：1 == _age
 2016-04-11 19:16:28.135 runTimetest[36263:486317] 1、获取一个类的全部成员变量名：2 == _height
 2016-04-11 19:16:28.136 runTimetest[36263:486317] 1、获取一个类的全部成员变量名：3 == _delegate
 2016-04-11 19:16:28.136 runTimetest[36263:486317] 1、获取一个类的全部成员变量名：4 == _name
 2016-04-11 19:16:28.136 runTimetest[36263:486317] 1、获取一个类的全部成员变量名：5 == _sex
 2016-04-11 19:16:28.136 runTimetest[36263:486317] 1、获取一个类的全部成员变量名：6 == _job
 2016-04-11 19:16:28.136 runTimetest[36263:486317] 1、获取一个类的全部成员变量名：7 == _native
 2016-04-11 19:16:28.138 runTimetest[36263:486317] 1、获取一个类的全部成员变量名：8 == _education
 */


/*
 
 你可以试一下,把所有的成员放到.m文件里面,它打印的结果是一样的.
 
 作用2  同理,我们可以获取到一个类的全部属性名
 这里是【test2】；
 
 属性
 
 1、定义：
 
 objc_property_t：声明的属性的类型，是一个指向objc_property结构体的指针
 
 typedef struct objc_property *objc_property_t;
 2、操作函数：
 
 // 获取所有属性
 class_copyPropertyList
 说明：使用class_copyPropertyList并不会获取无@property声明的成员变量
 
 // 获取属性名
 property_getName
 // 获取属性特性描述字符串
 property_getAttributes
 // 获取所有属性特性
 property_copyAttributeList
 说明：
 
 property_getAttributes函数返回objc_property_attribute_t结构体列表，objc_property_attribute_t结构体包含name和value，常用的属性如下：
 
 属性类型  name值：T  value：变化
 编码类型  name值：C(copy) &(strong) W(weak) 空(assign) 等 value：无
 非/原子性 name值：空(atomic) N(Nonatomic)  value：无
 变量名称  name值：V  value：变化
 使用property_getAttributes获得的描述是property_copyAttributeList能获取到的所有的name和value的总体描述，如 T@"NSDictionary",C,N,V_dict1
 
 */
- (void)test2
{
    unsigned int outCount = 0;
    // 获得指向该类所有属性的指针
    // 说明：使用class_copyPropertyList并不会获取无@property声明的成员变量
    objc_property_t *properties = class_copyPropertyList([Person class], &outCount);
    for (unsigned int i = 0; i < outCount; i ++)
    {
        // 获得该类的一个属性的指针
        objc_property_t property = properties[i];
        // 属性名
        const char *name = property_getName(property);
        // 属性的特性
        // 使用property_getAttributes获得的描述是property_copyAttributeList能获取到的所有的name和value的总体描述，如 T@"NSDictionary",C,N,V_dict1
        const char *propertyAttr = property_getAttributes(property);
        BALog(@"2、获取一个类的全部属性的特性1，不包含property声明的成员变量：%s 的 %s ", propertyAttr, name);
        
        // 属性的特性
        unsigned int attrCount = 0;
        objc_property_attribute_t * attrs = property_copyAttributeList(property, &attrCount);
        for (unsigned int j = 0; j < attrCount; j ++)
        {
            objc_property_attribute_t attr = attrs[j];
            const char *name = attr.name;
            const char *value = attr.value;
            BALog(@"2、获取一个类的全部属性的特性2：%s 值：%s", name, value);
        }
        free(attrs);
        BALog(@"\n");
    }
    free(properties);
}
/*
 2016-04-11 19:21:20.483 runTimetest[36301:490999] 2、获取一个类的全部属性的特性1，property声明的成员变量：T@"<PersonDelegate>",N,V_delegate 的 delegate
 2016-04-11 19:21:20.483 runTimetest[36301:490999] 2、获取一个类的全部属性的特性2：T 值：@"<PersonDelegate>"
 2016-04-11 19:21:20.483 runTimetest[36301:490999] 2、获取一个类的全部属性的特性2：N 值：
 2016-04-11 19:21:20.483 runTimetest[36301:490999] 2、获取一个类的全部属性的特性2：V 值：_delegate
 2016-04-11 19:21:20.484 runTimetest[36301:490999]
 2016-04-11 19:21:20.484 runTimetest[36301:490999] 2、获取一个类的全部属性的特性1，property声明的成员变量：T@"NSString",C,N,V_name 的 name
 2016-04-11 19:21:20.484 runTimetest[36301:490999] 2、获取一个类的全部属性的特性2：T 值：@"NSString"
 2016-04-11 19:21:20.484 runTimetest[36301:490999] 2、获取一个类的全部属性的特性2：C 值：
 2016-04-11 19:21:20.484 runTimetest[36301:490999] 2、获取一个类的全部属性的特性2：N 值：
 2016-04-11 19:21:20.484 runTimetest[36301:490999] 2、获取一个类的全部属性的特性2：V 值：_name
 2016-04-11 19:21:20.484 runTimetest[36301:490999]
 2016-04-11 19:21:20.511 runTimetest[36301:490999] 2、获取一个类的全部属性的特性1，property声明的成员变量：T@"NSString",C,N,V_sex 的 sex
 2016-04-11 19:21:20.511 runTimetest[36301:490999] 2、获取一个类的全部属性的特性2：T 值：@"NSString"
 2016-04-11 19:21:20.511 runTimetest[36301:490999] 2、获取一个类的全部属性的特性2：C 值：
 2016-04-11 19:21:20.511 runTimetest[36301:490999] 2、获取一个类的全部属性的特性2：N 值：
 2016-04-11 19:21:20.512 runTimetest[36301:490999] 2、获取一个类的全部属性的特性2：V 值：_sex
 2016-04-11 19:21:20.512 runTimetest[36301:490999]
 2016-04-11 19:21:20.512 runTimetest[36301:490999] 2、获取一个类的全部属性的特性1，property声明的成员变量：Ti,N,V_age 的 age
 2016-04-11 19:21:20.512 runTimetest[36301:490999] 2、获取一个类的全部属性的特性2：T 值：i
 2016-04-11 19:21:20.512 runTimetest[36301:490999] 2、获取一个类的全部属性的特性2：N 值：
 2016-04-11 19:21:20.512 runTimetest[36301:490999] 2、获取一个类的全部属性的特性2：V 值：_age
 2016-04-11 19:21:20.513 runTimetest[36301:490999]
 2016-04-11 19:21:20.513 runTimetest[36301:490999] 2、获取一个类的全部属性的特性1，property声明的成员变量：Tf,N,V_height 的 height
 2016-04-11 19:21:20.513 runTimetest[36301:490999] 2、获取一个类的全部属性的特性2：T 值：f
 2016-04-11 19:21:20.513 runTimetest[36301:490999] 2、获取一个类的全部属性的特性2：N 值：
 2016-04-11 19:21:20.513 runTimetest[36301:490999] 2、获取一个类的全部属性的特性2：V 值：_height
 2016-04-11 19:21:20.513 runTimetest[36301:490999]
 2016-04-11 19:21:20.514 runTimetest[36301:490999] 2、获取一个类的全部属性的特性1，property声明的成员变量：T@"NSString",C,N,V_job 的 job
 2016-04-11 19:21:20.514 runTimetest[36301:490999] 2、获取一个类的全部属性的特性2：T 值：@"NSString"
 2016-04-11 19:21:20.514 runTimetest[36301:490999] 2、获取一个类的全部属性的特性2：C 值：
 2016-04-11 19:21:20.514 runTimetest[36301:490999] 2、获取一个类的全部属性的特性2：N 值：
 2016-04-11 19:21:20.514 runTimetest[36301:490999] 2、获取一个类的全部属性的特性2：V 值：_job
 2016-04-11 19:21:20.515 runTimetest[36301:490999]
 2016-04-11 19:21:20.515 runTimetest[36301:490999] 2、获取一个类的全部属性的特性1，property声明的成员变量：T@"NSString",C,N,V_native 的 native
 2016-04-11 19:21:20.515 runTimetest[36301:490999] 2、获取一个类的全部属性的特性2：T 值：@"NSString"
 2016-04-11 19:21:20.515 runTimetest[36301:490999] 2、获取一个类的全部属性的特性2：C 值：
 2016-04-11 19:21:20.515 runTimetest[36301:490999] 2、获取一个类的全部属性的特性2：N 值：
 2016-04-11 19:21:20.515 runTimetest[36301:490999] 2、获取一个类的全部属性的特性2：V 值：_native
 2016-04-11 19:21:20.516 runTimetest[36301:490999]
 2016-04-11 19:21:20.516 runTimetest[36301:490999] 2、获取一个类的全部属性的特性1，property声明的成员变量：T@"NSString",C,N,V_education 的 education
 2016-04-11 19:21:20.516 runTimetest[36301:490999] 2、获取一个类的全部属性的特性2：T 值：@"NSString"
 2016-04-11 19:21:20.516 runTimetest[36301:490999] 2、获取一个类的全部属性的特性2：C 值：
 2016-04-11 19:21:20.516 runTimetest[36301:490999] 2、获取一个类的全部属性的特性2：N 值：
 2016-04-11 19:21:20.516 runTimetest[36301:490999] 2、获取一个类的全部属性的特性2：V 值：_education
 2016-04-11 19:21:20.516 runTimetest[36301:490999]
 */

/*
 
 作用3 获取一个类的全部方法
 这里是【test3】；
 
 我们可以看到所有的方法
 
 */
- (void)test3
{
    unsigned int count;
    // 获取指向该类所有方法的指针
    Method *methods = class_copyMethodList([Person class], &count);
    
    for (int i = 0; i < count; i ++)
    {
        // 获取该类的一个方法的指针
        Method method = methods[i];
        // 获取方法
        SEL methodSEL = method_getName(method);
        // 将方法转换为C字符串
        const char *name = sel_getName(methodSEL);
        // 将C字符串转为OC字符串
        NSString *methodName = [NSString stringWithUTF8String:name];
        
        // 获取方法参数个数
        int arguments = method_getNumberOfArguments(method);
        
        BALog(@"3、获取一个类的全部方法：%d == %@ %d", i, methodName, arguments);
    }
    // 记得释放
    free(methods);
}
/*
 2016-04-11 18:43:07.514 runTimetest[35847:448257] 3、获取一个类的全部方法：0 == setSex: 3
 2016-04-11 18:43:07.514 runTimetest[35847:448257] 3、获取一个类的全部方法：1 == setAge: 3
 2016-04-11 18:43:07.515 runTimetest[35847:448257] 3、获取一个类的全部方法：2 == setEducation: 3
 2016-04-11 18:43:07.515 runTimetest[35847:448257] 3、获取一个类的全部方法：3 == setJob: 3
 2016-04-11 18:43:07.515 runTimetest[35847:448257] 3、获取一个类的全部方法：4 == setNative: 3
 2016-04-11 18:43:07.515 runTimetest[35847:448257] 3、获取一个类的全部方法：5 == eat 2
 2016-04-11 18:43:07.515 runTimetest[35847:448257] 3、获取一个类的全部方法：6 == sleep 2
 2016-04-11 18:43:07.515 runTimetest[35847:448257] 3、获取一个类的全部方法：7 == work 2
 2016-04-11 18:43:07.515 runTimetest[35847:448257] 3、获取一个类的全部方法：8 == sex 2
 2016-04-11 18:43:07.515 runTimetest[35847:448257] 3、获取一个类的全部方法：9 == age 2
 2016-04-11 18:43:07.515 runTimetest[35847:448257] 3、获取一个类的全部方法：10 == job 2
 2016-04-11 18:43:07.516 runTimetest[35847:448257] 3、获取一个类的全部方法：11 == native 2
 2016-04-11 18:43:07.516 runTimetest[35847:448257] 3、获取一个类的全部方法：12 == education 2
 2016-04-11 18:43:07.516 runTimetest[35847:448257] 3、获取一个类的全部方法：13 == .cxx_destruct 2
 2016-04-11 18:43:07.516 runTimetest[35847:448257] 3、获取一个类的全部方法：14 == name 2
 2016-04-11 18:43:07.516 runTimetest[35847:448257] 3、获取一个类的全部方法：15 == setDelegate: 3
 2016-04-11 18:43:07.516 runTimetest[35847:448257] 3、获取一个类的全部方法：16 == setName: 3
 2016-04-11 18:43:07.516 runTimetest[35847:448257] 3、获取一个类的全部方法：17 == encodeWithCoder: 3
 2016-04-11 18:43:07.517 runTimetest[35847:448257] 3、获取一个类的全部方法：18 == initWithCoder: 3
 2016-04-11 18:43:07.517 runTimetest[35847:448257] 3、获取一个类的全部方法：19 == delegate 2
 2016-04-11 18:43:07.517 runTimetest[35847:448257] 3、获取一个类的全部方法：20 == height 2
 2016-04-11 18:43:07.517 runTimetest[35847:448257] 3、获取一个类的全部方法：21 == setHeight: 3
 */

/*
 
 作用4 获取一个类遵循的所有协议
 这里是【test4】；
 
 先将遵循的协议给注释掉,
 结果啥都没有打印出来
 
 我们把遵循的代码注释给打开
 再执行测试代码,打印结果就有了
 
 是不是很棒,你可能觉得貌似用处不太大,那接下来我们来看看如何利用runtime归档和解档.
 
 */
- (void)test4
{
    unsigned int count;
    
    // 获取指向该类遵循的所有协议的指针
    __unsafe_unretained Protocol **protocols = class_copyProtocolList([self class], &count);
    
    for (int i = 0; i < count; i ++)
    {
        // 获取该类遵循的一个协议指针
        Protocol *protocol = protocols[i];
        // 获取C字符串协议名
        const char *name = protocol_getName(protocol);
        // C字符串转OC字符串
        NSString *protocolName = [NSString stringWithUTF8String:name];
        
        BALog(@"4、获取一个类遵循的全部协议：%d == %@", i, protocolName);
    }
    // 记得释放
    free(protocols);
}
/*
 2016-04-11 18:43:28.406 runTimetest[35858:448817] 4、获取一个类遵循的全部协议：0 == PersonDelegate
 */


/*
 
 作用5 归档/解档 测试如下:
 这里是【test5】；
 
 是不是比你以前归档解档简单多了。
 
 runtime作用太大了,学习了才知道,这是我今天学习的过程和一点经验,后续我还会继续把学习的过程分享给大家,希望能给你一些帮助.
 
 */
- (void)test5
{
    Person *person = [[Person alloc] init];
    person.name = @"博爱";
    person.sex = @"男";
    person.age = 25;
    person.height = 175.0;
    person.education = @"本科";
    person.job = @"iOS工程师";
    person.native = @"广州";
    
    NSString *path = [NSString stringWithFormat:@"%@/archive", NSHomeDirectory()];
    [NSKeyedArchiver archiveRootObject:person toFile:path];
    
    Person *unarchiverPerson = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
    unarchiverPerson.delegate = self;
    BALog(@"5、unarchiverPerson == %@ %@",path,unarchiverPerson);
    BALog(@"5、unarchiverPerson == %@ name: %@",path,unarchiverPerson.name);
}
/*
 2016-04-11 18:43:51.434 runTimetest[35867:449428] 5、unarchiverPerson == /Users/boai/Library/Developer/CoreSimulator/Devices/E409AD16-A6BE-4D0C-9195-861137F66ED1/data/Containers/Data/Application/D27B8613-EDB1-4FDB-A6C9-A20BB8934232/archive <Person: 0x7fd8b1e18ff0>
 2016-04-11 18:59:46.557 runTimetest[35941:468178] 5、unarchiverPerson == /Users/boai/Library/Developer/CoreSimulator/Devices/E409AD16-A6BE-4D0C-9195-861137F66ED1/data/Containers/Data/Application/14E97695-5554-4EAE-9953-EB27EC2B8593/archive name: 博爱
 */

/*
 Json到Model的转化
 
 在开发中相信最常用的就是接口数据需要转化成Model了（当然如果你是直接从Dict取值的话。。。），很多开发者也都使用著名的第三方库如JsonModel、Mantle或MJExtension等，如果只用而不知其所以然，那真和“搬砖”没啥区别了，下面我们使用runtime去解析json来给Model赋值。
 
 原理描述：用runtime提供的函数遍历Model自身所有属性，如果属性在json中有对应的值，则将其赋值。
 
 核心方法：在NSObject的分类中添加方法：
 
 读者可以进一步思考：
 
 如何识别基本数据类型的属性并处理
 空（nil，null）值的处理
 json中嵌套json（Dict或Array）的处理
 尝试解决以上问题，你也能写出属于自己的功能完备的Json转Model库。
 */
- (void)test6
{
    NSDictionary *dict = @{
                           @"name":@"博爱",
                           @"sex":@"男",
                           @"age":@"25",
                           @"height":@"175.0",
                           @"education":@"本科",
                           @"job":@"iOS工程师",
                           @"native":@"广州"
                           };
    Person *person = [[Person alloc] initWithDict:dict];
    
    BALog(@"6、person: %@", person.name);
}
/*
 2016-04-11 19:48:59.012 runTimetest[36395:511720] 6、person: 博爱
 */

#pragma mark - PersonDelegate
- (void)personDelegateToWork
{
    BALog(@"PersonDelegate ...");
}

@end
