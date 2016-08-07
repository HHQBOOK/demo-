//
//  ViewController.m
//  函数编程和链式编程
//
//  Created by 韩贺强 on 16/8/7.
//  Copyright © 2016年 com.baiduniang. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"
#import "Person.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UIView *v = [[UIImageView alloc]init];
    v.backgroundColor = [UIColor redColor];
    [self.view addSubview:v];
    
    //使用 Masonry 设置
       //我们在使用过程中需要 先执行A方法,再执行B方法,或者先执行B方法,再执行A方法,连写在一起,就是 链式编程
    //在OC中 调用方法都是使用 中括号'[]', 使用小括号'()'的在OC 中是 block,调用block时候用,函数编程

    [v mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view).offset(200);
        make.bottom.mas_equalTo(self.view).offset(-200);
        make.left.mas_equalTo(self.view).offset(100);
        make.right.mas_equalTo(self.view).offset(-100);
    }];
    
    
    
    Person *person = [[Person alloc]init];
    
    //1> 普通调用
    [person run];
    [person eat];
    
    //2 >链式编程,使用链式语法
    [[person run1] eat1];  //可以这样写
    [[person eat1] run1];  //也可以调换顺序,这样写

    //2.1
    person.run1.eat1;
    person.eat1.run1;
    
    //3 >函数式编程:
    person.run2();
    
    //3.1 但是 不能继续    person.run2().eat2. 需要使得第一个方法返回值也是Person,就是本事,self,才能在函数编程的继承上,进行链式编程
    person.run3().run3();
    
    person.run3().eat3(); //可以这样 先跑后吃
    person.eat3().run3(); //也可以这样,先吃后跑
    
    //3.2 但是还是不能像Masnory那样,有参数,我们再改造.
    person.run4(100).eat4(@"面包");
    
    person.eat4(@"大米饭").run4(300);
    
    
    //5 但是我们都是在person手写block的,这样早控制器中使用的时候函数编程的时候,没有提示,我们使用 tydefe个block起别名试试,再说
    
    person.run5(20).eat5(@"馒头");
    
    person.eat5(@"西瓜").run5(10);
}



@end
