//
//  PrefectureViewController.m
//  CateDIY
//
//  Created by Yang on 15-6-10.
//  Copyright (c) 2015年 MoYang. All rights reserved.
//

#import "PrefectureViewController.h"
#import "JHRefresh.h"
#import "PrefectureCell.h"
#import "PrefectureModel.h"
#import "SubPreViewController.h"
@interface PrefectureViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation PrefectureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self dataInit];
    [self creatTableView];
    [self download];
    [self creatRefreshView];
}
-(void)dataInit{
    _manager=[[AFHTTPRequestOperationManager alloc]init];
    _manager.responseSerializer=[AFHTTPResponseSerializer serializer];
    _dataArr=[[NSMutableArray alloc]init];
}
-(void)creatTableView{
    self.dataArr = [[NSMutableArray alloc] init];
    self.automaticallyAdjustsScrollViewInsets = YES;
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenSize.width, kScreenSize.height) style:UITableViewStylePlain];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.rowHeight = 72;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.showsVerticalScrollIndicator = NO;
    [self.tableView registerNib:[UINib nibWithNibName:@"PrefectureCell" bundle:nil] forCellReuseIdentifier:@"PrefectureCell"];
    [self.view addSubview:self.tableView];
}


-(void)download{
    self.page= 1 ;
    self.isLoadMoring=NO;
    self.isRefreshing=NO;
    NSString *url=[NSString stringWithFormat:kPrefectureUrl,self.page];
    [self addTaskUrl:url isRefresh:YES];
}
- (void)addTaskUrl:(NSString *)url isRefresh:(BOOL)isRefresh{
    __weak typeof(self)weakSelf=self;
    [_manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (responseObject) {
            if (weakSelf.page == 1) {
                [weakSelf.dataArr removeAllObjects];
            }
            NSDictionary *dict=[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
            NSArray *arr=dict[@"list"];
            for (NSDictionary *newDict in arr) {
                PrefectureModel *model=[[PrefectureModel alloc]init];
                [model setValuesForKeysWithDictionary:newDict];
                [weakSelf.dataArr addObject:model];
            }
            [weakSelf.tableView reloadData];
            [weakSelf endRefreshing];
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [weakSelf endRefreshing];
    }];
}
- (void)creatRefreshView {
    __weak typeof(self) weakSelf = self;
    [self.tableView addRefreshHeaderViewWithAniViewClass:[JHRefreshCommonAniView class] beginRefresh:^{
        if (weakSelf.isRefreshing) {
            return ;
        }
        weakSelf.page = 1;
        weakSelf.isRefreshing = YES;
        [weakSelf addTaskUrl:[NSString stringWithFormat:kPrefectureUrl,weakSelf.page] isRefresh:YES];
    }];
    
    [self.tableView addRefreshFooterViewWithAniViewClass:[JHRefreshCommonAniView class] beginRefresh:^{
        if (weakSelf.isLoadMoring) {
            return ;
        }
        weakSelf.isLoadMoring = YES;
        weakSelf.page++;
        [weakSelf addTaskUrl:[NSString stringWithFormat:kPrefectureUrl,weakSelf.page] isRefresh:YES];
    }];
}

- (void)endRefreshing {
    if (self.isRefreshing) {
        self.isRefreshing = NO;
        [self.tableView headerEndRefreshingWithResult:JHRefreshResultSuccess];
    }
    if (self.isLoadMoring) {
        self.isLoadMoring = NO;
        [self.tableView footerEndRefreshing];
    }
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataArr.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    PrefectureCell *cell=[tableView dequeueReusableCellWithIdentifier:@"PrefectureCell" forIndexPath:indexPath];
    PrefectureModel *model=_dataArr[indexPath.row];
    [cell showDataWithModel:model];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    SubPreViewController *sub=[[SubPreViewController alloc]init];
    PrefectureModel *model=_dataArr[indexPath.row];
    sub.subId=model.id;
    sub.navigationItem.title=model.title;
    [self.navigationController pushViewController:sub animated:YES];
}
@end
