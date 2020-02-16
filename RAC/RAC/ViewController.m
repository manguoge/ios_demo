//
//  ViewController.m
//  RAC
//
//  Created by Manguo on 2020/2/12.
//  Copyright © 2020 Manguo. All rights reserved.
//

#import "ViewController.h"
#import "SZPerson.h"

@interface ViewController ()
@property (weak, nonatomic) UIView *subView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self test];
    
    UIWindow *window = [[UIApplication sharedApplication] keyWindow];
    id firstR = [window performSelector:@selector(firstResponder)];
    
}

- (UIView *)subView {
//    if (_subView == nil) {
        _subView = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
        _subView.backgroundColor = [UIColor redColor];
//    }
    
    __block UIView *v = _subView;
    
    return _subView;
}

- (void)test {
    SZPerson *person = [SZPerson alloc];
    
    SZPerson *p1 = [person init];
    SZPerson *p2 = [person init];
}

- (void)autoPool {
    @autoreleasepool {
        SZPerson *person = [SZPerson alloc];
        SZPerson *p1 = [person init];
    }
    NSLog(@"viewDidLoad%@", [NSRunLoop currentRunLoop]);
}

- (void)viewDidDisappear:(BOOL)animated {
    NSLog(@"viewDidDisappear%@", [NSRunLoop currentRunLoop]);
}

@end
