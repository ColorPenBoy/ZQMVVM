//
//  HomeTableViewDataSource.m
//  ZQ_MVVM
//
//  Created by colorPen on 15/7/1.
//  Copyright (c) 2015年 colorPen. All rights reserved.
//

#import "HomeTableViewDataSource.h"
#import "HomeModel.h"
#import "vc2Cell.h"
#import "UIImageView+WebCache.h"

@implementation HomeTableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.dataArray count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellName = @"cell";
    vc2Cell *cell = [tableView dequeueReusableCellWithIdentifier:cellName];
    if (cell == nil)
    {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"vc2Cell" owner:self options:nil]lastObject];
    }
    
    HomeModel *nm = [self.dataArray objectAtIndex:indexPath.row];
    cell.titleLabel.text = nm.title;
    cell.contentLabel.text = nm.content;
    cell.dateLabel.text = nm.dateStr;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    NSURL *url = [NSURL URLWithString:nm.uploadImg];
    [cell.urlImgView sd_setImageWithURL:url];
    
    return cell;
}

@end
