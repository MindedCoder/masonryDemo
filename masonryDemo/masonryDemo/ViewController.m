//
//  ViewController.m
//  masonryDemo
//
//  Created by 黄 灿 on 15/12/11.
//  Copyright © 2015年 MCoder. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    WS(weakSelf);
    [super viewDidLoad];
    [self.view addSubview:self.mainTable];
    [self.mainTable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.view);
        make.right.equalTo(weakSelf.view);
        make.left.equalTo(weakSelf.view);
        make.bottom.equalTo(weakSelf.view);
    }];
    self.title = @"masonryDemo";
    _dataArray = @[@"View居中",@"view略小于superView",@"等间距排列",@"cell高度自适应",@"cell子View居中"];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - tableView datasource and delegate 
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *str = @"str";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:str];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:str];
    }
    cell.textLabel.text =_dataArray[indexPath.row];
    cell.textLabel.font =[UIFont fontWithName:@"Arial" size:16];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [_dataArray count];
}

#pragma mark - getter and setter
-(UITableView *)mainTable{
    if (!_mainTable) {
        _mainTable = [[UITableView alloc]init];
        _mainTable.delegate =self;
        _mainTable.dataSource = self;
        _mainTable.backgroundColor = [UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:1.0f];
    }
    return  _mainTable;
}
@end
