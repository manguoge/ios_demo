//
//  SZPeople.h
//  KVC_KVO
//
//  Created by Manguo on 2020/2/8.
//  Copyright © 2020 Manguo. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SZPeople : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *firstName;
@property (nonatomic, strong) NSString *lastName;

//容器属性
@property (nonatomic, strong) NSMutableArray *friends;

@end

NS_ASSUME_NONNULL_END
