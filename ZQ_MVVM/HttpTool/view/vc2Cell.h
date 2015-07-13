//
//  vc2Cell.h
//  饮水设备
//
//  Created by qianfeng on 14-9-25.
//  Copyright (c) 2014年 Wei Yang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface vc2Cell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UIImageView *timeView;
@property (weak, nonatomic) IBOutlet UIImageView *urlImgView;

@end
