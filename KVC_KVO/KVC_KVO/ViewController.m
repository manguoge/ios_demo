//
//  ViewController.m
//  KVC_KVO
//
//  Created by Manguo on 2020/2/8.
//  Copyright © 2020 Manguo. All rights reserved.
//

#import "ViewController.h"
#import "SZPeople.h"
#import "SZPerson.h"

@interface ViewController ()

@property (nonatomic, strong) SZPeople *people;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    static int i = 0;
    i++;
    self.people = [SZPeople new];
    self.people.friends = [NSMutableArray array];
//    [self.people addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionOld | NSKeyValueObservingOptionNew context:nil];
//    self.people.name = [NSString stringWithFormat:@"%d", i];
//    [self.people setValue:@"1" forKey:@"name"];
//    [self.people setValue:@"firstName" forKey:@"firstName"];//keypath 依赖
    
//    对容器属性的监听
    [self.people addObserver:self forKeyPath:@"friends" options:NSKeyValueObservingOptionNew context:nil];
    [self.people.friends addObject:@"f1"];
    
    NSMutableArray *tempFriends =  [self.people mutableArrayValueForKey:@"friends"];
    [tempFriends addObject:@"f2"];
    
    
//    自定义KVO
//    SZPerson *person = [SZPerson new];
//    IMP ii = [person methodForSelector:@selector(setName:)];
//    [person customAddObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionNew context:nil];
//
////    person.name = @"new name";
//    IMP iii = [person methodForSelector:@selector(setName:)];
//    [person setName:@"new name"];
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    NSString *oldValue = [change objectForKey:NSKeyValueChangeOldKey];
    NSString *newValue = [change objectForKey:NSKeyValueChangeNewKey];
    
    NSLog(@"oldValue = %@, newValue = %@.", oldValue, newValue);
}

@end
