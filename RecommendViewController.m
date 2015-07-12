//
//  RecommendViewController.m
//  CateDIY
//
//  Created by Yang on 15-6-10.
//  Copyright (c) 2015年 MoYang. All rights reserved.
//

#import "RecommendViewController.h"
#import "PrefectureModel.h"
#import "RecommendCell.h"
#import "SubViewController.h"
#import "JHRefresh.h"
@interface RecommendViewController ()

@end

@implementation RecommendViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self dataInit];
    [self creatTableView];
    [self download];
    [self creatRefreshView];
}
#pragma mark - 数据初始化
-(void)dataInit{
    _manager=[[AFHTTPRequestOperationManager alloc]init];
    _manager.responseSerializer=[AFHTTPResponseSerializer serializer];
    _dataArr=[[NSMutableArray alloc]init];
}
#pragma mark - 创建表格视图
-(void)creatTableView{
    self.dataArr = [[NSMutableArray alloc] init];
    self.automaticallyAdjustsScrollViewInsets = YES;
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenSize.width, kScreenSize.height) style:UITableViewStylePlain];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.rowHeight = 310;
    self.tableView.showsVerticalScrollIndicator = NO;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.tableView registerNib:[UINib nibWithNibName:@"RecommendCell" bundle:nil] forCellReuseIdentifier:@"RecommendCell"];
    
    [self.view addSubview:self.tableView];
}
-(void)download{
    self.isRefreshing=NO;
    [self addTaskUrl:kRecommendUrl isRefresh:YES];
}
- (void)addTaskUrl:(NSString *)url isRefresh:(BOOL)isRefresh{
    __weak typeof(self) myself=self;
    [_manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (responseObject) {
            if ([url isEqual:kRecommendUrl]) {
                [myself.dataArr removeAllObjects];
            }
            NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
            NSDictionary *newData=[NSDictionary dictionaryWithDictionary:dict[@"data"]];
            NSArray *recommendArr=newData[@"recommend"];
            for (NSDictionary *recommendDic in recommendArr) {
                PrefectureModel *model=[[PrefectureModel alloc]init];
                [model setValuesForKeysWithDictionary:recommendDic];
                [myself.dataArr addObject:model];
            }
            [myself.tableView reloadData];
            [myself endRefreshing];
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [myself endRefreshing];
    }];
}
- (void)creatRefreshView {
    __weak typeof(self) weakSelf = self;
    [self.tableView addRefreshHeaderViewWithAniViewClass:[JHRefreshCommonAniView class] beginRefresh:^{
        if (weakSelf.isRefreshing) {
            return ;
        }
        weakSelf.isRefreshing = YES;
        [weakSelf addTaskUrl:kRecommendUrl isRefresh:YES];
    }];
}
- (void)endRefreshing {
    if (self.isRefreshing) {
        self.isRefreshing = NO;
        [self.tableView headerEndRefreshingWithResult:JHRefreshResultSuccess];
    }
}

#pragma mark - 实现协议
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataArr.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    RecommendCell *cell=[tableView dequeueReusableCellWithIdentifier:@"RecommendCell" forIndexPath:indexPath];
    PrefectureModel *model=_dataArr[indexPath.row];
    [cell showDataWiteModel:model];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    SubViewController *subView=[[SubViewController alloc]init];
    PrefectureModel *model=_dataArr[indexPath.row];
    subView.objid=model.objid;
    subView.navigationItem.title=model.title;
    [self.navigationController pushViewController:subView animated:YES];
}

@end
