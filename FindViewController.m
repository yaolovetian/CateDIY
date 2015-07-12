//
//  FindViewController.m
//  CateDIY
//
//  Created by Yang on 15-6-10.
//  Copyright (c) 2015年 MoYang. All rights reserved.
//

#import "FindViewController.h"
#import "PrefectureModel.h"
#import "JHRefresh.h"
#import "PrefectureCell.h"
#import "ResultViewController.h"
#import "SDImageCache.h"
@interface FindViewController ()<UISearchBarDelegate,UIActionSheetDelegate>
@end

@implementation FindViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self creatButton];
    [self creatPicture];
    [self creatSearchBar];
   
}
-(void)creatButton{
    UIImage *image=[[UIImage imageNamed:@"icon_setting"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIBarButtonItem *item=[[UIBarButtonItem alloc]initWithImage:image style:UIBarButtonItemStylePlain target:self action:@selector(btnClick:)];
    self.navigationItem.rightBarButtonItem=item;
}
-(CGFloat)getCachSize{
    NSUInteger imageCacheSize=[[SDImageCache sharedImageCache]getSize];
    NSString *myCachePath=[NSHomeDirectory() stringByAppendingPathComponent:@"Library/Caches/MyCaches"];
    NSDirectoryEnumerator *enumarator=[[NSFileManager defaultManager]enumeratorAtPath:myCachePath];
    __block NSInteger count=0;
    for (NSString *fileName in enumarator) {
        NSString *path = [myCachePath stringByAppendingPathComponent:fileName];
        NSDictionary *fileDict=[[NSFileManager defaultManager]attributesOfItemAtPath:path error:nil];
        count+=fileDict.fileSize;
    }
    CGFloat totalSize=((CGFloat)imageCacheSize+count)/1024/1024;
    return totalSize;
}
-(void)btnClick:(UIBarButtonItem *)item{
    UIAlertController *sheet=[UIAlertController alertControllerWithTitle:@"清理缓存" message:[NSString stringWithFormat:@"总共有%.2fM缓存",[self getCachSize]] preferredStyle:UIAlertControllerStyleActionSheet];
    [sheet addAction:[UIAlertAction actionWithTitle:@"删除" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action) {
        [[SDImageCache sharedImageCache]clearMemory];
        [[SDImageCache sharedImageCache]clearDisk];
        NSString *myCachePath=[NSHomeDirectory() stringByAppendingPathComponent:@"Library/Caches/MyCaches"];
        [[NSFileManager defaultManager]removeItemAtPath:myCachePath error:nil];
    }]];
    [sheet addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
        
    }]];
    [self presentViewController:sheet animated:YES completion:nil];
}
-(void)creatSearchBar{
   UISearchBar *searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 64, self.view.bounds.size.width, 45)];
    searchBar.delegate = self;
    searchBar.placeholder = @"输入食谱/菜谱 关键字";
    [self.view addSubview:searchBar];
}
-(void)creatPicture{
    UIImage *picture=[UIImage imageNamed:@"empty"];
    UIImageView *picView=[[UIImageView alloc]initWithImage:picture];
    picView.center=self.view.center;
    [self.view addSubview:picView];
}
- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar {
    [searchBar setShowsCancelButton:YES animated:YES];
    return YES;
}
- (BOOL)searchBarShouldEndEditing:(UISearchBar *)searchBar {
    [searchBar setShowsCancelButton:NO animated:YES];
    return YES;
}
- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    [searchBar resignFirstResponder];
    searchBar.text = @"";
}
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    [searchBar resignFirstResponder];
    ResultViewController *result=[[ResultViewController alloc]init];
    result.searcWord=searchBar.text;
    result.navigationItem.title=searchBar.text;
   [self.navigationController pushViewController:result animated:YES];
}

@end
