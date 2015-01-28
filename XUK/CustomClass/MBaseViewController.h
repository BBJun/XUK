//
//  MBaseViewController.h
//  XUK
//
//  Created by 123 on 15-1-28.
//  Copyright (c) 2015年 andy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"

@interface MBaseViewController : UIViewController

//是否有返回按钮
@property(nonatomic,assign)BOOL isBackButton;

//HUD提示视图
-(void)showDataError;
-(void)showConnectionError;
-(void)showMBProgress;
-(void)hideMBProgress;
-(void)showHUDWithString:(NSString *)str;

@end
