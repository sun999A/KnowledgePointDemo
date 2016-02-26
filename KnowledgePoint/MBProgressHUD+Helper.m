//
//  MBProgressHUD+Helper.m
//  TuTu_iOS
//
//  Created by wzitech on 14-4-12.
//  Copyright (c) 2014年 wzitech. All rights reserved.
//

#import "MBProgressHUD+Helper.h"

@implementation MBProgressHUD (Helper)
+(MBProgressHUD*) instanceWithView:(UIView*) view {
    MBProgressHUD *hud = [[MBProgressHUD alloc] initWithView:view];
    [hud setYOffset:-50];
    [hud setDetailsLabelFont:[UIFont systemFontOfSize:16.0f]];
    [hud setRemoveFromSuperViewOnHide:YES];
    return hud;
}
@end
