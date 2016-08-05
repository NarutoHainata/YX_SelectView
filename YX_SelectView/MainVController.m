//
//  MainVController.m
//  YX_SelectView
//
//  Created by yang on 16/8/5.
//  Copyright © 2016年 poplary. All rights reserved.
//

#import "MainVController.h"
#import "DetailChooseViewController.h"
@interface MainVController ()<UITableViewDelegate,UITableViewDataSource,DetailChooseDelegate>{
    NSIndexPath *saveIndexPath;
    NSInteger index;
}
@property(nonatomic, strong) DetailChooseViewController *dcVC;
@property(nonatomic, strong) UITableView *tableView;
//数据
@property(nonatomic, strong) NSArray *dataArr;
@property(nonatomic, strong) UIView *showView;
@property(nonatomic, strong) UIButton *showBtn;

@property(nonatomic, strong) NSArray *detailArr;
@end

@implementation MainVController

//-(DetailChooseViewController *)dcVC{
//    if (!_dcVC) {
//        _dcVC = [[DetailChooseViewController alloc]init];
//        _dcVC.dcDelegate = self;
//    }
//    return _dcVC;
//}
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, self.view.frame.size.height-164) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}
-(NSArray *)dataArr{
    if (_dataArr == nil) {
        _dataArr = @[@"计算机编程",@"电子信息",@"物流",@"银行",@"公务员",@"翻译",@"演员",@"业务员",@"煤炭",@"电力资源"];
    }
    return _dataArr;
}
-(UIView *)showView{
    if (_showView == nil) {
        _showView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 100)];
        _showView.backgroundColor = [UIColor greenColor];
    }
    return _showView;
}
-(NSArray *)detailArr{
    if (_detailArr == nil) {
        _detailArr = @[
                       @[@"ios开发",@"安卓开发",@"前端后台"],
                       @[@"工程",@"器械",@"维护"],
                       @[@"通信",@"支付",@"电子开发"],
                       @[@"主管",@"业务员",@"司机"],
                       @[@"行长",@"职员",@"大堂经理"],
                       @[@"低级",@"高级",@"终极"],
                       @[@"英语",@"日语",@"火星语"],
                       @[@"群演",@"大明星",@"大猩猩"],
                       @[@"挖煤",@"技术员",@"勘测"],
                       @[@"发电员",@"天气预报",@"用户"],
                       ];
  
    }
    return _detailArr;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"选择职业";
    self.edgesForExtendedLayout = UIRectEdgeNone;
    [self.view addSubview:self.tableView];
    [self.view addSubview:self.showView];
    index = 0;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArr.count;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.textLabel.text = [self.dataArr objectAtIndex:indexPath.row];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    saveIndexPath = indexPath;
    DetailChooseViewController *dvc = [[DetailChooseViewController alloc]init];
    dvc.viewTitle = [self.dataArr objectAtIndex:indexPath.row];
    dvc.professionArr = [self.detailArr objectAtIndex:indexPath.row];
    dvc.dcDelegate = self;
    [self.navigationController pushViewController:dvc animated:YES];
}
-(void)detailChooseDidSelectRow:(NSIndexPath *)indexPath{
    index = index+1;
    NSString *profession = [[NSString alloc]init];
    profession = [[self.detailArr objectAtIndex:saveIndexPath.row] objectAtIndex:indexPath.row];
   
    self.showBtn = [[UIButton alloc]initWithFrame:CGRectMake(60*index+10*(index+1), 0, 60, 20)];
    self.showBtn.titleLabel.font = [UIFont fontWithName:@"Arial" size:12];
    [self.showBtn setBackgroundImage:[UIImage imageNamed:@"delete.png"] forState:UIControlStateNormal];
    [self.showBtn setTitle:profession forState:UIControlStateNormal];
    [self.showBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.showBtn setTag:index];
    [self.showBtn addTarget:self action:@selector(deleteBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.showView addSubview:self.showBtn];
}
-(void)deleteBtn:(UIButton *)sender{
    UIButton *btn = (UIButton *)[self.showView viewWithTag:sender.tag];
    [btn removeFromSuperview];
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
