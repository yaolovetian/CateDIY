//
//  RecommendViewController.h
//  CateDIY
//
//  Created by Yang on 15-6-10.
//  Copyright (c) 2015年 MoYang. All rights reserved.
//

#import "BaseViewController.h"
#import "AFNetworking.h"
@interface RecommendViewController : BaseViewController<UITableViewDataSource,UITableViewDelegate>
{
    NSMutableArray *_dataArr;
    AFHTTPRequestOperationManager *_manager;
    BOOL _isRefreshing;
}
@property(nonatomic,strong)NSMutableArray *dataArr;
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic)BOOL isRefreshing;
@end
