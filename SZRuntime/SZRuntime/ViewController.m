//
//  ViewController.m
//  SZRuntime
//
//  Created by Manguo on 2020/2/9.
//  Copyright © 2020 Manguo. All rights reserved.
//

#import "ViewController.h"
#import "SZPerson.h"
#import <objc/runtime.h>
#import <objc/message.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    SZPerson *person = [SZPerson new];
    [person sendMessage:@"msg is me"];
//    ((void(*)(id,SEL,NSString*))objc_msgSend)(person, @selector(sendMessage:), @"参数");
}


@end
