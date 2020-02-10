//
//  SZPerson.m
//  SZRuntime
//
//  Created by Manguo on 2020/2/9.
//  Copyright © 2020 Manguo. All rights reserved.
//

#import "SZPerson.h"
#import <objc/runtime.h>
#import "SZPersonTMP.h"

@implementation SZPerson

void sendMessage(id self, SEL _cmd, NSString *msg) {
    NSLog(@"--->>SZPerson sendMessage:%@", msg);
}

//- (void)sendMessage:(NSString *)msg {
//    NSLog(@"--->>SZPerson sendMessage:%@", msg);
//}

//动态方法解析和绑定
+ (BOOL) resolveInstanceMethod:(SEL)sel {
//    NSString *methStr = NSStringFromSelector(sel);
//    if ( [methStr isEqualToString:@"sendMessage:"]) {
//        return class_addMethod(self, sel, (IMP)sendMessage, "v@:@");
//    }
    
    return NO;
}

//快速方法转发，提供一个备用的方法调用对象
- (id)forwardingTargetForSelector:(SEL)aSelector {
//    NSString *methStr = NSStringFromSelector(aSelector);
//    if ( [methStr isEqualToString:@"sendMessage:"]) {
//        return [SZPersonTMP new];
//    }
    
    return [super forwardingTargetForSelector:aSelector];
}

//慢速转发
//方法签名
- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    NSString *methStr = NSStringFromSelector(aSelector);
    if ( [methStr isEqualToString:@"sendMessage:"]) {
        return [NSMethodSignature signatureWithObjCTypes:"v@:@"];
    }
    
    return [super methodSignatureForSelector:aSelector];
}

//转发
//- (void)forwardInvocation:(NSInvocation *)anInvocation {
//    SEL sel = [anInvocation selector];
////    找一个备用对象执行
//    SZPersonTMP *personTMP = [SZPersonTMP new];
//    if ([personTMP respondsToSelector:sel]) {
//        [anInvocation invokeWithTarget:personTMP];
//    } else {
//        [super forwardInvocation:anInvocation];
//    }
//}

//系统默认找不到方法抛出异常，重写此方法可以做去除异常等处理
- (void)doesNotRecognizeSelector:(SEL)aSelector {
    NSLog(@"找不到方法：%@", NSStringFromSelector(aSelector));
}

@end
