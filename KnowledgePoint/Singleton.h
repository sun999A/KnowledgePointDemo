//
//  Singleton.h
//  TestOne
//
//  Created by Snail iOS on 16/2/22.
//  Copyright © 2016年 Snail iOS. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol SingletonDelegate <NSObject>

- (void)getData:(id)data;


@end
extern NSString *const UserLoginedNotification;

@interface Singleton : NSObject
@property (nonatomic, assign) id<SingletonDelegate>delegate;

@end
