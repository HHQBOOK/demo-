//
//  Person.m
//  函数编程和链式编程
//
//  Created by 韩贺强 on 16/8/7.
//  Copyright © 2016年 com.baiduniang. All rights reserved.
//

#import "Person.h"

@implementation Person

-(void)run {
    NSLog(@"%s",__FUNCTION__);
}
-(void)eat {
    NSLog(@"%s",__FUNCTION__);
}

//下面返回的是其本身,这样就能 使用链式语法,返回还是器本身,就能再继续调用其他的
-(Person *)run1 {
    NSLog(@"%s",__FUNCTION__);

    return self;
}
-(Person *)eat1 {
    NSLog(@"%s",__FUNCTION__);

    return self;
}


//下面是显示使用 函数编程语法, 就是想办法使用小括号'()'. 在OC中,只有调用block的时候,才会使用'()',所以我们要使得run2这个方法的返回值是block.
-(void (^)())run2 {
    
    //我们要返回的函数是一个block,在外面才能调用 person.run2(),这样写
    void (^runBlock)() = ^{
        NSLog(@"run2");
    };
    
    return runBlock;
}


    //3.1 但是 不能继续    person.run3().eat3. 需要使得第一个方法返回值也是Person,就是本事,self,才能在函数编程的继承上,进行链式编程
-(Person *(^)())run3 {
    Person *(^runBlock)() = ^{
        NSLog(@"--run3");
        return self;
    };
    return runBlock;
}

// 3.2 我们把3.1 内部的实现再写成一步
-(Person *(^)())eat3 {
    
    return ^{
        NSLog(@"-eat3");
        return self;
    };
}

// 3.3 我们需要使得block带参数,这样才能有跟Masnory那样 equalTo(self).offset(20);的效果
-(Person *(^)(double))run4 {
    
    //*** '大的返回值'是 这个 run4的返回值.  '小的返回值'-->'内部的返回值'是run4的返回值那个block的返回值
    return ^(double distance){
        NSLog(@"run4,%f",distance);
        
        return self;
    };
}
-(Person *(^)(NSString *))eat4 {
    
    return ^(NSString * food){
        NSLog(@"eat4 %@",food);
      
        return self;
    };
}



// 使用起别名的block 再进行 函数编程和链式编程,比较方便
-(myRunblock)run5 {
  
    return ^(double distance){
        NSLog(@"run5 %f",distance);
        
        return self;
    };
}

-(myEatblock)eat5 {

    return ^(NSString *food){
        NSLog(@"eat5 %@",food);
      
        return self;
    };
}
@end
