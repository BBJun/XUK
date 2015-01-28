//
//  MBaseTableView.h
//  XUK
//
//  Created by 123 on 15-1-28.
//  Copyright (c) 2015年 andy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EGORefreshTableHeaderView.h"

@protocol UITableViewEventDelegate;

@interface MBaseTableView : UITableView<EGORefreshTableHeaderDelegate,UITableViewDataSource,UITableViewDelegate>{
    EGORefreshTableHeaderView *_refreshHeaderView;
    BOOL _reloading;
    
    UIButton *_moreButton;                         //上拉加载更多button
}

@property (nonatomic, assign)BOOL refreshHeader;  //是否有下拉刷新
@property (nonatomic, retain)NSArray *data;       //为tableView提供数据
@property (nonatomic, retain)id<UITableViewEventDelegate> eventDelegate;

@property (nonatomic, assign)BOOL isMore;         //是否还有更多（下一页）

- (void)reloadTableViewDataSource;
- (void)doneLoadingTableViewData;

@end

@protocol UITableViewEventDelegate <NSObject>
@optional
//下拉
- (void)pullDown:(MBaseTableView *)tableView;
//上拉
- (void)pullUp:(MBaseTableView *)tableView;
//选择cell
- (void)tableView:(MBaseTableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;

@end
