//
//  SubViewController.h
//  CateDIY
//
//  Created by Yang on 15/6/15.
//  Copyright (c) 2015年 MoYang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AFNetworking.h"
@interface SubViewController : UIViewController
{
    UITableView *_tableView;
    NSMutableArray *_dataArr;
    AFHTTPRequestOperationManager *_manager;
    NSInteger _page;
    BOOL _isRefreshing;
    BOOL _isLoadMoring;
}
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSMutableArray *dataArr;
@property(nonatomic)NSInteger page;
@property(nonatomic)BOOL isRefreshing;
@property(nonatomic)BOOL isLoadMoring;
@property(nonatomic,copy)NSString *objid;
@end
