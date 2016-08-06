//
//  ChooseProView.h
//  YX_SelectView
//
//  Created by yang on 16/8/5.
//  Copyright © 2016年 poplary. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol ChooseProViewDelegate <NSObject>

-(void)ChooseProViewRelodedata:(UICollectionView *)collectionView;

@end
@interface ChooseProView : UIView
@property (nonatomic, strong)id<ChooseProViewDelegate>proDelegate;
@property (nonatomic, strong)NSMutableArray *titleArr;
@property (nonatomic, strong)NSString *cellTitle;
@end
