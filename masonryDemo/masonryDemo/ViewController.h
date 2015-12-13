//
//  ViewController.h
//  masonryDemo
//
//  Created by 黄 灿 on 15/12/11.
//  Copyright © 2015年 MCoder. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Masonry.h"
#define WS(weakSelf)  __weak __typeof(&*self)weakSelf = self;
@interface ViewController : UIViewController
@property(nonatomic,strong)UITableView *mainTable;
@property(nonatomic,strong)NSArray *dataArray;
@end

