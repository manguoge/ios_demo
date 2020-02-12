//
//  SZPerson.h
//  SZBlock
//
//  Created by Manguo on 2020/2/11.
//  Copyright © 2020 Manguo. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SZPerson : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) int age;

- (id(^)(int))run;

- (id(^)(int))run:(NSString *)name age:(int)age;

- (SZPerson *)a;
- (SZPerson *)b;
- (SZPerson *)c;

@end

NS_ASSUME_NONNULL_END
