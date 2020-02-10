//
//  SZPerson.h
//  KVC_KVO
//
//  Created by Manguo on 2020/2/9.
//  Copyright © 2020 Manguo. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
//自定义kvo
@interface SZPerson : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *firstName;
@property (nonatomic, strong) NSString *lastName;

- (void)customAddObserver:(id) observer forKeyPath:(NSString *) keyPath options:(NSKeyValueObservingOptions) options context:(nullable void *)context;

@end

NS_ASSUME_NONNULL_END
