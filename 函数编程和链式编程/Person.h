//
//  Person.h
//  函数编程和链式编程
//
//  Created by 韩贺强 on 16/8/7.
//  Copyright © 2016年 com.baiduniang. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Person;

typedef Person *(^myRunblock)(double distance);   //这个distance,可以省略不写
typedef Person *(^myEatblock)(NSString *);

@interface Person : NSObject

//普通的方法
-(void)run;
-(void)eat;

// 链式语法.   -->就是连续调用,  [[person run] eat],这种.或是[[person eat] run]这种.需要返回值是它本身
-(Person *)run1;
-(Person *)eat1;

//函数编程 调用方法使用() 小括号
-(void(^)())run2;


// 在使用函数编程编程的 基础上使用 链式编程,需要使得返回值是 本事
-(Person *(^)())run3;
-(Person *(^)())eat3;


    //3.2 但是还是不能像Masnory那样,有参数,我们再改造.
-(Person *(^)(double))run4;        //Person *(^)(double) --> Person *是block的返回值. (double)是参数
-(Person *(^)(NSString *))eat4;



//5, 使用起别名的block,进行函数编程和链式编程
-(myRunblock)run5;
-(myEatblock)eat5;
@end
