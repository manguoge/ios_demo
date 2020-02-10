//
//  SZPeople.m
//  KVC_KVO
//
//  Created by Manguo on 2020/2/8.
//  Copyright © 2020 Manguo. All rights reserved.
//

#import "SZPeople.h"

@implementation SZPeople

//setter方法改变值前调用
//-(void) willChangeValueForKey:(NSString *)key {
// 1.记录旧值
//}
//
//setter方法改变值后调用
//- (void)didChangeValueForKey:(NSString *)key {
    // 1. 记录新值
    // 2. 调用-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
//}

//重置name的keypath的依赖关系，firsName\lastName的改变也会对应改变name的值
+ (NSSet *)keyPathsForValuesAffectingName {
    return [NSSet setWithObjects:@"firstName", @"lastName", nil];
}

//返回yes时，可以在原setter方法里手动发通知//调用didChangeValueForKey，此方法调用发通知-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
//+ (BOOL) automaticallyNotifiesObserversForKey:(NSString *)key {
//    return NO;
//}

@end
