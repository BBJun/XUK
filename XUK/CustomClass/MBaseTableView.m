//
//  MBaseTableView.m
//  XUK
//
//  Created by 123 on 15-1-28.
//  Copyright (c) 2015年 andy. All rights reserved.
//

#import "MBaseTableView.h"

@implementation MBaseTableView

- (id)initWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
    self = [super initWithFrame:frame style:style];
    if (self) {
        
        [self _initView];
    }
    return self;
}

//xib创建
-(void)awakeFromNib
{
    [super awakeFromNib];
    [self _initView];
}

-(void)_initView
{
    //初始化下拉刷新
    _refreshHeaderView = [[EGORefreshTableHeaderView alloc] initWithFrame:CGRectMake(0.0f, 0.0f - self.bounds.size.height, self.frame.size.width, self.bounds.size.height)];
    _refreshHeaderView.delegate = self;
    
    self.delegate=self;
    self.dataSource=self;
    self.refreshHeader=YES;
    
    _moreButton=[UIButton buttonWithType:UIButtonTypeCustom];
    _moreButton.backgroundColor=[UIColor clearColor];
    _moreButton.titleLabel.font=[UIFont systemFontOfSize:16.0f];
    _moreButton.frame=CGRectMake(0, 0, ScreenWidth, 40);
    [_moreButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_moreButton setTitle:@"上拉加载更多..." forState:UIControlStateNormal];
    [_moreButton addTarget:self action:@selector(loadMoreAction) forControlEvents:UIControlEventTouchUpInside];
    
    UIActivityIndicatorView *activityView=[[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    activityView.tag=2014;
    [activityView stopAnimating];
    activityView.frame=CGRectMake(100, 10, 20,20 );
    [_moreButton addSubview:activityView];
    
    self.tableFooterView=_moreButton;
    
}

-(void)starLoadMore
{
    [_moreButton setTitle:@"正在加载..." forState:UIControlStateNormal];
    _moreButton.enabled=NO;
    UIActivityIndicatorView *activityView=(UIActivityIndicatorView *)[_moreButton viewWithTag:2014];
    [activityView startAnimating];
}

-(void)stopLoadMore
{
    if (self.data.count>0) {
        _moreButton.hidden=NO;
        [_moreButton setTitle:@"上拉加载更多..." forState:UIControlStateNormal];
        _moreButton.enabled=YES;
        UIActivityIndicatorView *activityView=(UIActivityIndicatorView *)[_moreButton viewWithTag:2014];
        [activityView stopAnimating];
        
        if (!self.isMore) {
            [_moreButton setTitle:@"加载完成" forState:UIControlStateNormal];
            _moreButton.enabled=NO;
        }
    }else{
        _moreButton.hidden=YES;
    }
    
}

-(void)reloadData
{
    [super reloadData];
    
    //停止加载更多
    [self stopLoadMore];
}

#pragma mark - actions

-(void)loadMoreAction
{
    if ([self.eventDelegate respondsToSelector:@selector(pullUp:)]) {
        [self.eventDelegate pullUp:self];
    }
}

//复写refreshHeader的Seting方法，判断是否有下拉刷新
-(void)setRefreshHeader:(BOOL)refreshHeader
{
    if (refreshHeader) {
        [self addSubview:_refreshHeaderView];
    }else{
        if ([_refreshHeaderView superview]) {
            [_refreshHeaderView removeFromSuperview];
        }
    }
}

#pragma mark -
#pragma mark UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.data count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    
    // Configure the cell.
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([self.eventDelegate respondsToSelector:@selector(tableView:didSelectRowAtIndexPath:)]) {
        [self.eventDelegate tableView:self didSelectRowAtIndexPath:indexPath];
    }
}

#pragma mark -
#pragma mark Data Source Loading / Reloading Methods

- (void)reloadTableViewDataSource{
    _reloading = YES;
    
}

- (void)doneLoadingTableViewData{
    _reloading = NO;
    [_refreshHeaderView egoRefreshScrollViewDataSourceDidFinishedLoading:self];
}


#pragma mark -
#pragma mark UIScrollViewDelegate Methods
//滑动的时候调用
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    [_refreshHeaderView egoRefreshScrollViewDidScroll:scrollView];
    
}

//手指放开时调用
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    
    [_refreshHeaderView egoRefreshScrollViewDidEndDragging:scrollView];
    
    if (!self.isMore) {
        return;
    }
    
    float offset=self.contentOffset.y;
    float contentHeight=self.contentSize.height;
    
    //当offset的偏移量滑到底部时，差值是scrollView得高度（例如：416）
    float sub=contentHeight-offset;
    if (sub-scrollView.height<30) {
        
        [self starLoadMore];
        
        if ([self.eventDelegate respondsToSelector:@selector(pullUp:)]) {
            [self.eventDelegate pullUp:self];
        }
    }
}


#pragma mark -
#pragma mark EGORefreshTableHeaderDelegate Methods
//下拉到一定距离，手指放开时调用
- (void)egoRefreshTableHeaderDidTriggerRefresh:(EGORefreshTableHeaderView*)view{
    
    [self reloadTableViewDataSource];
    
    //停止加载，弹回下拉
    [self performSelector:@selector(doneLoadingTableViewData) withObject:nil afterDelay:3.0];
}

- (BOOL)egoRefreshTableHeaderDataSourceIsLoading:(EGORefreshTableHeaderView*)view{
    
    return _reloading;
    
}

//取得下拉刷新的时间
- (NSDate*)egoRefreshTableHeaderDataSourceLastUpdated:(EGORefreshTableHeaderView*)view{
    
    return [NSDate date]; 
    
}

@end
