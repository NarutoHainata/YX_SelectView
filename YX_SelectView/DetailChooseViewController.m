//
//  DetailChooseViewController.m
//  YX_SelectView
//
//  Created by yang on 16/8/5.
//  Copyright © 2016年 poplary. All rights reserved.
//

#import "DetailChooseViewController.h"
#import "DataModel.h"
@interface DetailChooseViewController ()<UITableViewDelegate,UITableViewDataSource>{
    NSIndexPath *previousIndexPath;
    NSInteger recordRow;
    NSIndexPath *current;
}
@property (nonatomic, strong) UITableView *detailTableView;
@property (nonatomic, strong) UIImageView *imageView;

@property (nonatomic, strong) DataModel *model;
@property (nonatomic, strong) NSMutableArray *saveModel;
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

    self.saveModel = [[NSMutableArray alloc]init];
    previousIndexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    for (int i = 0; i<self.professionArr.count; i++) {
        DataModel *model = [[DataModel alloc]init];
        model.title = [self.professionArr objectAtIndex:i];
        [self.saveModel addObject:model];
    }
   
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
    NSString *cellId = [NSString stringWithFormat:@"cell%ld%ld",(long)indexPath.row,(long)indexPath.section];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    
    cell.textLabel.text = [self.professionArr objectAtIndex:indexPath.row];
    
      if (indexPath.row == self.model.selected && self.model.sele == YES) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }else{
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    for (int i = 0; i<self.professionArr.count; i++) {
        UITableViewCell *cell = [tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:i inSection:0]];
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    UITableViewCell *selectCell = [tableView cellForRowAtIndexPath:indexPath];
    selectCell.accessoryType = UITableViewCellAccessoryCheckmark;
    self.model = [self.saveModel objectAtIndex:indexPath.row];
    self.model.sele = YES;
    self.model.selected = indexPath.row;
    [self.detailTableView reloadData];
    
}
- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{

//    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
//    
//    cell.accessoryType = UITableViewCellAccessoryNone;
    

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
