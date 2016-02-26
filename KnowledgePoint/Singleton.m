//
//  Singleton.m
//  TestOne
//
//  Created by Snail iOS on 16/2/22.
//  Copyright © 2016年 Snail iOS. All rights reserved.
//

#import "Singleton.h"

NSString *const UserLoginedNotification = @"UserLogindeNotification";

static Singleton *single = nil;
@implementation Singleton


- (instancetype)init{
    self = [super init];
    if (self) {
        if ([_delegate respondsToSelector:@selector(getData:)]) {
            [self.delegate getData:@""];
        }
    }
    return self;
}
+ (instancetype)sharedInstance{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        single = [[Singleton alloc] init];
    });
    return single;
}

- (id)copy{
    return self;
}

- (id)mutableCopy{
    return self;
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone{
    @synchronized(self) {
        if (single == nil) {
            single = [super allocWithZone:zone];
        }
    }
    return single;
    
}
@end
