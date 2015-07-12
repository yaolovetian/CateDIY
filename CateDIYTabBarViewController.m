//
//  CateDIYTabBarViewController.m
//  CateDIY
//
//  Created by Yang on 15-6-10.
//  Copyright (c) 2015年 MoYang. All rights reserved.
//

#import "CateDIYTabBarViewController.h"
#import "BaseViewController.h"
@interface CateDIYTabBarViewController ()

@end

@implementation CateDIYTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self creatViewControllers];
}
-(void)creatViewControllers{
    NSArray *vcName=@[@"RecommendViewController",@"PrefectureViewController",@"FindViewController"];
    NSArray *titles=@[@"推荐",@"专区",@"发现"];
    NSArray *picName=@[@"item-rec",@"item-pre",@"item-scr"];
    NSMutableArray *vcArr=[[NSMutableArray alloc]init];
    for (NSInteger i=0; i<vcName.count; i++) {
        Class vcClass=NSClassFromString(vcName[i]);
        BaseViewController *app=[[vcClass alloc]init];
        UINavigationController *nvc=[[UINavigationController alloc]initWithRootViewController:app];
        app.title=titles[i];
        nvc.tabBarItem.title=titles[i];
        nvc.tabBarItem.image=[UIImage imageNamed:picName[i]];
        [vcArr addObject:nvc];
    }
    self.viewControllers=vcArr;
}


@end
