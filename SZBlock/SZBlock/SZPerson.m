//
//  SZPerson.m
//  SZBlock
//
//  Created by Manguo on 2020/2/11.
//  Copyright © 2020 Manguo. All rights reserved.
//

#import "SZPerson.h"


@implementation SZPerson

- (id  _Nonnull (^)(int))run{
    return ^id(int m) {
        NSLog(@"--->>run:%d 米.",m);
        
        return nil;
    };
}

- (id  _Nonnull (^)(int))run:(NSString *)name age:(int)age {
    _name = name;
    _age = age;
    return ^id(int m) {
        NSLog(@"--->>name=%@, age=%d run:%d 米.", name, age, m);
        
        return nil;
    };
}

- (SZPerson *)a {
    NSLog(@"--->> a.");
    
    return self;
}
- (SZPerson *)b {
    NSLog(@"--->> b.");
    return self;
}
- (SZPerson *)c {
    NSLog(@"--->> c.");
    return self;
}


@end
