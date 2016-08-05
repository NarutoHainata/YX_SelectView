//
//  DetailChooseViewController.m
//  YX_SelectView
//
//  Created by yang on 16/8/5.
//  Copyright © 2016年 poplary. All rights reserved.
//

#import "DetailChooseViewController.h"

@interface DetailChooseViewController ()<UITableViewDelegate,UITableViewDataSource>{
    NSIndexPath *previousIndexPath;
}
@property (nonatomic, strong) UITableView *detailTableView;
@property (nonatomic, strong) UIImageView *imageView;
@end

@implementation DetailChooseViewController
- (UITableView *)detailTableView {
    if (!_detailTableView) {
        _detailTableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _detailTableView.delegate = self;
        _detailTableView.dataSource = self;
        _detailTableView.rowHeight = 45;
    }
    return _detailTableView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = self.viewTitle;
    [self.navigationController.navigationBar setBarTintColor:[UIColor greenColor]];
    //previousIndexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.view addSubview:self.detailTableView];
    //自定义导航左边右边的按钮
    UIButton *leftBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 30, 20)];
    [leftBtn addTarget:self action:@selector(leftBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [leftBtn setBackgroundImage:[UIImage imageNamed:@"cancel.png"] forState:UIControlStateNormal];
    
    UIBarButtonItem *leftBtnItem = [[UIBarButtonItem alloc]initWithCustomView:leftBtn];
    self.navigationItem.leftBarButtonItem = leftBtnItem;
    
    UIButton *rightBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 30, 20)];
    [rightBtn addTarget:self action:@selector(rightBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [rightBtn setBackgroundImage:[UIImage imageNamed:@"confir.png"] forState:UIControlStateNormal];
    
    UIBarButtonItem *rightBtnItem = [[UIBarButtonItem alloc]initWithCustomView:rightBtn];
    self.navigationItem.rightBarButtonItem = rightBtnItem;

    
}
-(void)leftBtnClick{
    
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)rightBtnClick{
    
    if ([self.dcDelegate respondsToSelector:@selector(detailChooseDidSelectRow:)]) {
        [self.dcDelegate detailChooseDidSelectRow:previousIndexPath];
       
    }

    [self.navigationController popViewControllerAnimated:YES];
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.professionArr.count;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    //cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    cell.textLabel.text = [self.professionArr objectAtIndex:indexPath.row];
    self.imageView = [[UIImageView alloc]initWithFrame:CGRectMake(self.detailTableView.frame.size.width-40, 0, 40, self.detailTableView.rowHeight)];
    self.imageView.image = [UIImage imageNamed:@"select"];
    //_imageView.hidden = YES;
    cell.accessoryView = self.imageView;
    if (!(indexPath.section == 0 && indexPath.row == 0)) {
        cell.accessoryView.hidden = YES;
        previousIndexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    }
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
  
    if (indexPath != previousIndexPath) {
        UITableViewCell *selectCell = [tableView cellForRowAtIndexPath:indexPath];
        selectCell.accessoryView.hidden = NO;
        UITableViewCell *Cell = [tableView cellForRowAtIndexPath:previousIndexPath];
        Cell.accessoryView.hidden = YES;
        previousIndexPath = indexPath;
    }
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
