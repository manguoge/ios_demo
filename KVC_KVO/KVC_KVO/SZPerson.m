//
//  SZPerson.m
//  KVC_KVO
//
//  Created by Manguo on 2020/2/9.
//  Copyright © 2020 Manguo. All rights reserved.
//

#import "SZPerson.h"
#import <objc/runtime.h>
#import <objc/message.h>

const void * observerKey = @"observerKey";

@implementation SZPerson

- (void)customAddObserver:(id)observer forKeyPath:(NSString *)keyPath options:(NSKeyValueObservingOptions)options context:(void *)context {
//    1. 创建子类
    NSString *oldClassName = NSStringFromClass([self class]);
    NSString *newClassName = [NSString stringWithFormat:@"CustomKVONitifying_%@", oldClassName];
    Class custonClass = objc_allocateClassPair([self class], newClassName.UTF8String, 0);
    objc_registerClassPair(custonClass);
    
//    2. 修改原对象的isa指针
    object_setClass(self, custonClass);
    
    
//    3.3 添加重写的setter方法
    NSString *methodName = [NSString stringWithFormat:@"set%@:", keyPath.capitalizedString];
    SEL sel = NSSelectorFromString(methodName);
    BOOL r = class_addMethod(custonClass, sel, (IMP)setterMethod, "v@:@");
    
//    保存一下观察者，给后面调用观察者方法时使用
    objc_setAssociatedObject(self, observerKey, observer, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

//    3. 在创建的子类里重写setter方法
void setterMethod(id self, SEL _cmd, NSString *name) {
//          3.1 调用原setter方法,即向此方法的父方法发生setter消息
    struct objc_super superClass = {
        self,
        class_getSuperclass([self class])
    };
    ((void(*)(id,SEL,NSString *))objc_msgSendSuper)((__bridge id)(&superClass), _cmd, name);
            
//          3.2 调用观察者的方法，相当于发出修改通知
    id observer = objc_getAssociatedObject(self, observerKey);
    NSString *keyPath = getKeyPath(_cmd);
    objc_msgSend(observer, @selector(observeValueForKeyPath:ofObject:change:context:), keyPath, observer, @{keyPath : name}, nil);
}

NSString * getKeyPath(SEL sel) {
    NSString *keyPath = NSStringFromSelector(sel);
    keyPath = [keyPath substringWithRange:NSMakeRange(3, keyPath.length - 4)];
    return keyPath;
}

@end
