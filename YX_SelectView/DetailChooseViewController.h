//
//  DetailChooseViewController.h
//  YX_SelectView
//
//  Created by yang on 16/8/5.
//  Copyright © 2016年 poplary. All rights reserved.
//
#import <UIKit/UIKit.h>

@protocol DetailChooseDelegate <NSObject>

-(void)detailChooseDidSelectRow:(NSIndexPath *)indexPath;

@end

@interface DetailChooseViewController : UIViewController
@property (nonatomic, strong) id<DetailChooseDelegate>dcDelegate;
@property (nonatomic, strong) NSString *viewTitle;
@property (nonatomic, strong) NSArray *professionArr;
@end
