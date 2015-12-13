//
//  MASExampleListViewController.h
//  Masonry
//
//  Created by Jonas Budelmann on 21/07/13.
//  Copyright (c) 2013 cloudling. All rights reserved.
//

#import "MASExampleListViewController.h"
#import "MASExampleViewController.h"
#import "MASExampleBasicView.h"
#import "MASExampleConstantsView.h"
#import "MASExampleSidesView.h"
#import "MASExampleAnimatedView.h"
#import "MASExampleDebuggingView.h"
#import "MASExampleLabelView.h"
#import "MASExampleUpdateView.h"
#import "MASExampleRemakeView.h"
#import "MASExampleScrollView.h"
#import "MASExampleLayoutGuideViewController.h"
#import "MASExampleArrayView.h"
#import "MASExampleAttributeChainingView.h"
#import "MASExampleAspectFitView.h"
#import "MASExampleMarginView.h"
#import "MASExampleDistributeView.h"

static NSString * const kMASCellReuseIdentifier = @"kMASCellReuseIdentifier";

@interface MASExampleListViewController ()

@property (nonatomic, strong) NSArray *exampleControllers;

@end

@implementation MASExampleListViewController

- (id)init {
    self = [super init];
    if (!self) return nil;
    
    self.title = @"masonryDemo";
    
    self.exampleControllers = @[
        [[MASExampleViewController alloc] initWithTitle:@"基本使用"
                                              viewClass:MASExampleBasicView.class],
        [[MASExampleViewController alloc] initWithTitle:@"更新约束"
                                              viewClass:MASExampleUpdateView.class],
        [[MASExampleViewController alloc] initWithTitle:@"重标记约束"
                                              viewClass:MASExampleRemakeView.class],
        [[MASExampleViewController alloc] initWithTitle:@"使用约束"
                                              viewClass:MASExampleConstantsView.class],
        [[MASExampleViewController alloc] initWithTitle:@"复合边缘"
                                              viewClass:MASExampleSidesView.class],
        [[MASExampleViewController alloc] initWithTitle:@"方向适应"
                                              viewClass:MASExampleAspectFitView.class],
        [[MASExampleViewController alloc] initWithTitle:@"基础动画"
                                              viewClass:MASExampleAnimatedView.class],
        [[MASExampleViewController alloc] initWithTitle:@"调试帮助"
                                              viewClass:MASExampleDebuggingView.class],
        [[MASExampleViewController alloc] initWithTitle:@"重标签"
                                              viewClass:MASExampleLabelView.class],
        [[MASExampleViewController alloc] initWithTitle:@"滑动视图"
                                              viewClass:MASExampleScrollView.class],
        [[MASExampleViewController alloc] initWithTitle:@"数组"
                                              viewClass:MASExampleArrayView.class],
        [[MASExampleViewController alloc] initWithTitle:@"值链"
                                              viewClass:MASExampleAttributeChainingView.class],
        [[MASExampleViewController alloc] initWithTitle:@"边缘"
                                              viewClass:MASExampleMarginView.class],
        [[MASExampleViewController alloc] initWithTitle:@"视图分布"
                                              viewClass:MASExampleDistributeView.class],

    ];
    
    if ([UIViewController instancesRespondToSelector:@selector(topLayoutGuide)])
    {
        self.exampleControllers = [self.exampleControllers arrayByAddingObject:[[MASExampleLayoutGuideViewController alloc] init]];
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    [self.tableView registerClass:UITableViewCell.class forCellReuseIdentifier:kMASCellReuseIdentifier];
}

#pragma mark - UITableViewDataSource

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UIViewController *viewController = self.exampleControllers[indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kMASCellReuseIdentifier forIndexPath:indexPath];
    cell.textLabel.text = viewController.title;
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.exampleControllers.count;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UIViewController *viewController = self.exampleControllers[indexPath.row];
    [self.navigationController pushViewController:viewController animated:YES];
}

@end
