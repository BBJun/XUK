//
//  MBaseNavigationController.m
//  XUK
//
//  Created by 123 on 15-1-28.
//  Copyright (c) 2015年 andy. All rights reserved.
//

#import "MBaseNavigationController.h"

@interface MBaseNavigationController ()

@end

@implementation MBaseNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationBar.barTintColor = [UIColor colorWithRed:255.0/255 green:91.0/255 blue:1.0/255 alpha:1];
    
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

@end
