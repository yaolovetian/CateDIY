//
//  ThirdViewController.m
//  CateDIY
//
//  Created by Yang on 15-6-13.
//  Copyright (c) 2015年 MoYang. All rights reserved.
//

#import "ThirdViewController.h"
#import "PrefectureModel.h"
#import "StepCell.h"
#import "TopPictureView.h"
@interface ThirdViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self dataInit];
    [self creatTableView];
    [self creatHeadView];
    [self loadData];
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
    self.tableView.rowHeight = 110;
    self.tableView.showsVerticalScrollIndicator = NO;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.tableView registerNib:[UINib nibWithNibName:@"StepCell" bundle:nil] forCellReuseIdentifier:@"StepCell"];
    [self.view addSubview:self.tableView];
}
-(void)creatHeadView{
    TopPictureView *topView=[[[NSBundle mainBundle]loadNibNamed:@"TopPictureView" owner:nil options:nil]lastObject];
    self.tableView.tableHeaderView=topView;
}

-(void)loadData{
    NSString *url=[NSString stringWithFormat:kThirdUrl,self.objid];
    __weak typeof(self) myself=self;
    [_manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (responseObject) {
            NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
            NSArray *stepArr=dict[@"steps"];
            for (NSDictionary *stepDic in stepArr) {
                PrefectureModel *model=[[PrefectureModel alloc]init];
                [model setValuesForKeysWithDictionary:stepDic];
                [myself.dataArr addObject:model];
            }
        }
        [myself.tableView reloadData];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataArr.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
        StepCell *cell=[tableView dequeueReusableCellWithIdentifier:@"StepCell" forIndexPath:indexPath];
        PrefectureModel *model=_dataArr[indexPath.row];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        [cell showDataWithModel:model];
        return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
