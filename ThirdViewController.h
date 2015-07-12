//
//  ThirdViewController.h
//  CateDIY
//
//  Created by Yang on 15-6-13.
//  Copyright (c) 2015年 MoYang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AFNetworking.h"
@interface ThirdViewController : UIViewController
{
    UITableView *_tableView;
    NSMutableArray *_dataArr;
    AFHTTPRequestOperationManager *_manager;
}
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,copy)NSString *objid;
@property(nonatomic,strong)NSMutableArray *dataArr;
@end
