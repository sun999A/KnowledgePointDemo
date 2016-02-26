//
//  RootViewController.m
//  KnowledgePoint
//
//  Created by Snail iOS on 16/2/26.
//  Copyright © 2016年 Snail iOS. All rights reserved.
//

#import "RootViewController.h"
#import "MBProgressHUD+Helper.h"
#import "TYAttributedLabel.h"
#define  SYSTEM_VERSION  [[[UIDevice currentDevice] systemVersion] floatValue]
@interface RootViewController ()
@property (nonatomic, strong) MBProgressHUD *hud;
@property (nonatomic, strong) NSAttributedString *attString; // 本页属性文本
@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor greenColor];
    self.attString = [[NSAttributedString alloc] initWithString:@"要实现对中央一级党和国家机关派驻纪检机构全覆盖，使党内监督不留死角、没有空白。所有派驻机构都要聚焦党风廉政建设和反腐败主业，强化监督执纪问责，瞪大眼睛，发现问题。😊😊😊纪检组长要一心一意履行监督职责，不要分管其他业务，如果都“打成一片”、混成一锅粥了，还怎么行使监督职责呢？对党风廉政方面的问题，该发现没有发现就是失职，发现问题不报告、不处理就是渎职，那就要严肃问责查处。😊😊😊"];
    TYAttributedLabel *attriLabel = [[TYAttributedLabel alloc] initWithFrame:CGRectMake(50, 100, 300, 500)];
    attriLabel.attributedText = self.attString;
    attriLabel.font = [UIFont systemFontOfSize:16];
    attriLabel.characterSpacing = 2;
    attriLabel.linesSpacing = 3;
    [self.view addSubview:attriLabel];
    
    NSLog(@"1");
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSLog(@"2");
        dispatch_async(dispatch_get_main_queue(), ^{
            NSLog(@"3");
        });
    });
//    dispatch_async(dispatch_get_main_queue(), ^{
//        NSLog(@"4");
//    });
    
    
//    
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        
//        NSLog(@"16的月亮最圆");
//        
//    });
    
    
    dispatch_group_t group = dispatch_group_create();
//    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
//    
//    dispatch_group_async(group, queue, ^{
//        NSLog(@"2");
//        for (NSInteger i = 0; i < 3; i++) {
//            NSLog(@"group-01-%@", [NSThread currentThread]);
//            //_data(@"100");
//        }
//    });
//    
//    dispatch_group_async(group, dispatch_get_main_queue(), ^{
//        NSLog(@"3");
//        for (NSInteger i = 0; i < 8; i++) {
//            NSLog(@"group-02-%@", [NSThread currentThread]);
//            
//        }
//    });
//    
//    dispatch_group_async(group, queue, ^{
//        NSLog(@"4");
//        for (NSInteger i = 0; i < 5; i++) {
//            NSLog(@"group-03-%@", [NSThread currentThread]);
//            
//        }
//    });
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        NSLog(@"5");
        MBProgressHUD *hud = [MBProgressHUD instanceWithView:self.view];
        [self.view addSubview:hud];
        self.hud = hud;
        [hud show:YES];
        
        [self.hud setMode:MBProgressHUDModeText];
        [self.hud setDetailsLabelText:@"请检查网络"];
        [self.hud hide:NO afterDelay:1.0f];
    });
    NSLog(@"6");
    
    
    //    NSURL *url = [NSURL URLWithString:@"http://api.hudong.com/iphonexml.do"];
    //NSURL *url = [NSURL URLWithString:@"http://image.zcool.com.cn/56/13/1308200901454.jpg"];
    NSString *urlString = @"http://api.map.baidu.com/place/v2/search?query=""&region=""&output=json&ak=6E823f587c95f0148c19993539b99295";
    NSURL *url = [NSURL URLWithString:[urlString stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]]];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    //    NSMutableURLRequest *mRequest = [NSMutableURLRequest requestWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:30];
    //    mRequest.HTTPMethod = @"POST";
    //    mRequest.HTTPBody = [@"type=focus-c" dataUsingEncoding:NSUTF8StringEncoding];
    
    NSURLSessionDataTask *dataTask = [[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        //NSLog(@"%@", data) ;
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:&error];
        for (NSArray *array in dic[@"results"]) {
            NSArray *arrays = [array valueForKey:@"name"];
            //NSMutableArray *mArray = [NSMutableArray array];
            //[self.array addObject:arrays];
            //NSLog(@"%@", arrays);
            //NSLog(@"%@", self.array);
        }
        //NSLog(@"%@", self.array);
        //        NSString *string = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        //        NSLog(@"%@", string);
        //        UIImage *image = [UIImage imageWithData:data];
        //        NSLog(@"%@", image);
        //[self.tableView reloadData];
        //[self.tableView reloadSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationNone];
    }];
    //[self.tableView reloadData];
    [dataTask resume];
    //[self.tableView reloadData];
    // Do any additional setup after loading the view.
}

- (void)getData:(getData)data{
    self.data = data;
}
- (void) refreshUI{
    switch (_sex) {
        case GenderMan:
            
            break;
            
        default:
            break;
    }
}
- (NSString *)genderName:(Gender)gender{
    NSString *string = nil;
    switch (gender) {
        case GenderNone:
            string = @"无";
            break;
        case GenderMan:
            string = @"男";
            break;
            
        default:
            break;
    }
    return string;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
