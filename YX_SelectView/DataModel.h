//
//  DataModel.h
//  YX_SelectView
//
//  Created by yang on 16/8/9.
//  Copyright © 2016年 poplary. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataModel : NSObject
@property (nonatomic, strong) NSString *title;
@property (nonatomic ,assign) BOOL index;
@property (nonatomic, assign) NSInteger selected;   //  这个记录被选中的行索引
@property (nonatomic, assign, getter=isSele) BOOL sele;  //  这个记录这组是否有被选中的记录
@end
