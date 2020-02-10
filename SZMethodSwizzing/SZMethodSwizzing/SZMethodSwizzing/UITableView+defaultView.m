//
//  UITableView+defaultView.m
//  SZMethodSwizzing
//
//  Created by Manguo on 2020/2/9.
//  Copyright © 2020 Manguo. All rights reserved.
//

#import "UITableView+defaultView.h"

#import <objc/runtime.h>

const void * defaultViewKey = @"defaultViewKey";

@implementation UITableView (defaultView)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Method originMethod = class_getInstanceMethod(self, @selector(reloadData));
        Method newMethod = class_getInstanceMethod(self, @selector(newReloadData));
        method_exchangeImplementations(originMethod, newMethod);
    });
}

- (void)newReloadData {
    [self newReloadData];
    [self fillDefaultView];
}

- (void)fillDefaultView {
    id dataSource = self.dataSource;
    NSInteger section = 0;
    if ([dataSource respondsToSelector:@selector(numberOfSectionsInTableView:)]) {
        section = [dataSource numberOfSectionsInTableView:self];
    }
    
    NSInteger rows = [dataSource tableView:self numberOfRowsInSection:1];
    if (rows < 1) {
        self.defaultView = [[UIView alloc] initWithFrame:self.bounds];
        self.defaultView.backgroundColor = [UIColor redColor];
        [self addSubview:self.defaultView];
    } else {
        self.defaultView.hidden = YES;
    }
}

- (void)setDefaultView:(UIView *)defaultView {
    objc_setAssociatedObject(self, defaultViewKey, defaultView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIView *)defaultView {
    return objc_getAssociatedObject(self, defaultViewKey);
}

@end
