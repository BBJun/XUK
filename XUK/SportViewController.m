//
//  SportViewController.m
//  XUK
//
//  Created by 123 on 15-1-30.
//  Copyright (c) 2015年 andy. All rights reserved.
//

#import "SportViewController.h"
#import "ShoppingTable.h"

@interface SportViewController ()

@property (weak, nonatomic) IBOutlet ShoppingTable *tableView;
@property (weak, nonatomic) IBOutlet UIImageView *headImg;

@end

@implementation SportViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
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
