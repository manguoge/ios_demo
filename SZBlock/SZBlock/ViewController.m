//
//  ViewController.m
//  SZBlock
//
//  Created by Manguo on 2020/2/11.
//  Copyright © 2020 Manguo. All rights reserved.
//

#import "ViewController.h"
#import "SZPerson.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    
    // Do any additional setup after loading the view.
    id(^blocka)(NSString*) = ^id(NSString *str) {
        NSLog(@"--->> blocka:%@", str);
        return nil;
    };
    
    blocka(@"i am a block");
    
    SZPerson *person = [SZPerson new];
    person.run(10);//返回block的方法是不带参数的方法时，相当于getter方法，可以使用.语法访问
    [person run:@"manguo" age:30](100);
    
//    链式编程
    person.a.b.c.run(1000);
    
//    NSInvocation调用方法
    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:[NSMethodSignature signatureWithObjCTypes:"v@:@"]];
    //    0,1是self、cmd
    NSString *str = @"aaa";
    [invocation setArgument:&str atIndex:2];
    [invocation setSelector:@selector(log:)];
    [invocation invokeWithTarget:self];
}

- (void)log:(NSString *)log {
    NSLog(@"--->> %@", log);
    
    dispatch_queue_t queue = dispatch_queue_create("com.abc.sz", DISPATCH_QUEUE_CONCURRENT);
    dispatch_async(queue, ^{
        NSLog(@"1,%@", [NSThread currentThread]);
        dispatch_async(queue, ^{
            NSLog(@"2,%@", [NSThread currentThread]);
        });
        NSLog(@"3,%@", [NSThread currentThread]);
    });
    NSLog(@"4");
}



@end
