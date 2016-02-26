//
//  RootViewController.h
//  KnowledgePoint
//
//  Created by Snail iOS on 16/2/26.
//  Copyright © 2016年 Snail iOS. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger, Gender){
    GenderNone = 0,
    GenderWoman = 1,
    GenderMan = 2,
};
typedef void(^getData) (id data);
@interface RootViewController : UIViewController
- (NSString *)genderName:(Gender)gender;
@property (nonatomic, assign) Gender sex;
@property (nonatomic, copy) getData data;
- (void)getData:(getData)data;
@end
