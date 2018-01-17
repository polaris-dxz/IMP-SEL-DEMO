//
//  ViewController.m
//  IMP-SEL-DEMO
//
//  Created by Yggdrasill_7C9 on 2018/1/17.
//  Copyright © 2018年 Yggdrasill_7C9. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor redColor];
//    [self test:nil];
//    [self test1:nil];
    
    
    //获取方法 ID
    SEL methodID = @selector(test:);
    
    //通过 @selector 访问这个方法
    [self performSelector:methodID withObject:nil];//容易引起泄露
    
    //获取方法名
    NSString* methodName = NSStringFromSelector(methodID);
    NSLog(@"methodName:%@",methodName);
    
    //通过 IMP 访问这个方法
    IMP methodPoint = [self methodForSelector:methodID];
    methodPoint();


    int func(int count);
    int (*funcP)(int count) = &func;
    int result1 = func(10);
    int result2 = (*funcP)(10);
    NSLog(@"调用函数%d %d",result1,result2);
    

}

int func(int count){
    
    return ++count;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)test:(NSString*)str{
    
    static NSInteger i = 0;
    i++;
    NSLog(@"%s调用%s方法%ld次",object_getClassName(self),__FUNCTION__,i);
}



@end
