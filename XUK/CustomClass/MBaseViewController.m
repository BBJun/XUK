//
//  MBaseViewController.m
//  XUK
//
//  Created by 123 on 15-1-28.
//  Copyright (c) 2015年 andy. All rights reserved.
//

#import "MBaseViewController.h"

@interface MBaseViewController ()

@end

@implementation MBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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


-(void)showMBProgress
{
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
}

-(void)hideMBProgress
{
    [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
}

-(void)showDataError
{
    [MBProgressHUD hideAllHUDsForView:self.view animated:NO];
    MBProgressHUD *hud = [[MBProgressHUD alloc] initWithView:self.view];
    hud.mode = MBProgressHUDModeText;
    hud.labelText = @"无相关数据，请稍后再试";
    [self.view addSubview:hud];
    [hud show:YES];
    [hud hide:YES afterDelay:2.0];
}

-(void)showConnectionError
{
    [MBProgressHUD hideAllHUDsForView:self.view animated:NO];
    MBProgressHUD *hud = [[MBProgressHUD alloc] initWithView:self.view];
    hud.mode = MBProgressHUDModeText;
    hud.labelText = @"网络异常，请检查一下你的网络设置";
    [self.view addSubview:hud];
    [hud show:YES];
    [hud hide:YES afterDelay:2.0];
}

-(void)showHUDWithString:(NSString *)str
{
    [MBProgressHUD hideAllHUDsForView:self.view animated:NO];
    MBProgressHUD *hud = [[MBProgressHUD alloc] initWithView:self.view];
    hud.mode = MBProgressHUDModeText;
    hud.labelText = str;
    [self.view addSubview:hud];
    [hud show:YES];
    [hud hide:YES afterDelay:2.0];
}

@end
