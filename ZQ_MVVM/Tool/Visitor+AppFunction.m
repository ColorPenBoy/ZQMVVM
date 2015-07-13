//
//  Visitor+AppFunction.m
//  ZeroGo_Tools
//
//  Created by colorful-MBP on 15/4/18.
//  Copyright (c) 2015年colorful-MBP. All rights reserved.
//



//判断网络是否可用，1判断直接默认网络可用，0不判断网络环境
#define isJudgeNet   0

#import "Visitor+AppFunction.h"
#import "AppDelegate.h"

@implementation Visitor_AppFunction

/**
 *  1.UIViewu
 */
+ (UIView *)ViewWithFrame:(CGRect)rect withBackColor:(UIColor *)backColor
{
    UIView *view = [[UIView alloc] initWithFrame:rect];
    if (backColor) {
        view.backgroundColor = backColor;
    }
    return view;
}
/**
 *  2.1 UIImageView
 */
+ (UIImageView *)ImageViewWithFrame:(CGRect)rect withImage:(NSString *)imageName
{
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:rect];
    
    if (imageName) {
        
        imageView.image = [UIImage imageNamed:imageName];
     
    }
//    imageView.userInteractionEnabled = YES;
    return imageView;
}

/**
 *  3.1 UIButton
 */
+ (UIButton *)ButtonWithFrame:(CGRect)rect title:(NSString *)title titleColor:(UIColor *)titleColor font:(int)size withTarget:(id)target withAction:(SEL)action withBackColor:(UIColor *)backColor withBackgroundImage:(NSString*)name withSelectBackgroundImage:(NSString*)selectName
{
    UIButton *button = [[UIButton alloc] initWithFrame:rect];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:titleColor forState:UIControlStateNormal];
    [button.titleLabel setFont:[UIFont systemFontOfSize:size]];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [button setBackgroundColor:backColor];
    //UIButton的title居左对齐
    //btn.contentHorizontalAlignment = 1;
    //使文字距离做边框保持10个像素的距离。
    //btn.contentEdgeInsets = UIEdgeInsetsMake(0,10, 0, 0);
    
    if (name) {
        [button setBackgroundImage:[UIImage imageNamed:name] forState:UIControlStateNormal];

    }
    if (selectName) {
        [button setBackgroundImage:[UIImage imageNamed:selectName] forState:UIControlStateSelected];

    }
    
    
    return button;
}
///**
// *  3.2 UIButton
// */
//+ (UIButton *)ButtonWithFrame:(CGRect)rect backImage:(NSString *)imageName withTarget:(id)target withAction:(SEL)action
//{
//    UIButton *button = [[UIButton alloc] initWithFrame:rect];
//    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
//    [button setBackgroundColor:[UIColor clearColor]];
//    [button setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
//    
//    return button;
//}
/**
 *  4. UILabel
 */
+ (UILabel *)LabelWithFrame:(CGRect)rect withText:(NSString *)text withTextColor:(UIColor *)textColor withFont:(int)fontSize withTextAlignment:(NSTextAlignment)alignment withBackColor:(UIColor *)backColor
{
    UILabel *label        = [[UILabel alloc] initWithFrame:rect];
    label.text            = text;
    label.textColor       = textColor;
    label.font            = [UIFont systemFontOfSize:fontSize];
    label.textAlignment   = alignment;
    
    label.backgroundColor = [UIColor clearColor];
    return label;
}
+ (UILabel *)LabelWithFrame:(CGRect)rect withText:(NSString *)text withTextColor:(UIColor *)textColor withFont:(int)fontSize withTextAlignment:(NSTextAlignment)alignment withBackColor:(UIColor *)backColor andNumberOfLine:(NSInteger)numberOfLine andLineBreakMode:(NSLineBreakMode)lineBreakMode
{
    UILabel *label        = [[UILabel alloc] initWithFrame:rect];
    label.text            = text;
    label.textColor       = textColor;
    label.font            = [UIFont systemFontOfSize:fontSize];
    label.textAlignment   = alignment;
    label.backgroundColor = backColor;
    label.lineBreakMode   = lineBreakMode;
    label.numberOfLines   = numberOfLine;
    return label;
}
/**
 *  5. UITextField
 */
+ (UITextField *)TextFieldWithFrame:(CGRect)rect withPlaceholder:(NSString *)placeholder withFont:(int)fontSize withBackColor:(UIColor *)backColor
{
    UITextField *textField = [[UITextField alloc] initWithFrame:rect];
    textField.placeholder  = placeholder;
    textField.font = [UIFont systemFontOfSize:fontSize];
    textField.backgroundColor = backColor;
    return textField;
}
/**
 *  6. UITableView
 */
+ (UITableView *)TableViewWithFrame:(CGRect)rect withTableViewStyle:(UITableViewStyle)style withDelegate:(id)delegate withDataSourec:(id)dataSource
{
    UITableView *tableView = [[UITableView alloc] initWithFrame:rect style:style];
    tableView.delegate     = delegate;
    tableView.dataSource   = dataSource;
    
    return tableView;
}
/**
 *  7. UIScrollView
 */
+ (UIScrollView *)ScrollViewWithFrame:(CGRect)rect withContentSize:(CGSize)size withDelegate:(id)delegate showsHorizontal:(BOOL)horizontal showsVertical:(BOOL)vertical withBackColor:(UIColor *)backcolor
{
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:rect];
    scrollView.delegate        = delegate;
    scrollView.contentSize     = size;
    scrollView.backgroundColor = backcolor;
    scrollView.showsVerticalScrollIndicator   = vertical;
    scrollView.showsHorizontalScrollIndicator = horizontal;
    
    return scrollView;
}
/**
 *  8. AlertView
 */
+ (UIAlertView *)alertTitle:(NSString *)title message:(NSString *)msg delegate:(id)aDeleagte cancelBtn:(NSString *)cancelName otherBtnName:(NSString *)otherbuttonName
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:msg delegate:aDeleagte cancelButtonTitle:cancelName otherButtonTitles:otherbuttonName, nil];
    [alert show];
    return alert;
}

//判断旋转
+ (CGAffineTransform)XSZ_RotateTransformForOrientTation:(UIInterfaceOrientation)orientation
{
    if (orientation == UIInterfaceOrientationLandscapeLeft)
    {
        return CGAffineTransformMakeRotation(M_PI*1.5);
    }
    else if(orientation == UIInterfaceOrientationLandscapeRight)
    {
        return CGAffineTransformMakeRotation(M_PI/2);
    }
    else if(orientation == UIInterfaceOrientationPortraitUpsideDown)
    {
        return CGAffineTransformMakeRotation(-M_PI);
    }
    else
        return CGAffineTransformIdentity;
}



#pragma mark - 闪烁标签（收藏成功，收藏失败，取消收藏成功）

+ (void)showLabelWithFrame:(CGRect)rect
                  andTitle:(NSString *)title
               andComplete:(void(^)())complete
{
    UILabel *label = [[UILabel alloc]initWithFrame:rect];
    label.text = title;
    label.layer.masksToBounds = YES;
    label.layer.cornerRadius = 8.0f;
    label.font = [UIFont systemFontOfSize:16];
    label.backgroundColor = [UIColor blackColor];
    label.alpha = 0;
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor whiteColor];
    
    AppDelegate *app = (AppDelegate *)[UIApplication sharedApplication].delegate;
    [app.window addSubview:label];
    
    [UIView animateWithDuration:2 animations:^{
        
        label.alpha = 1;
        
    } completion:^(BOOL finished) {
        
        [UIView animateWithDuration:0.5 animations:^{
            
            label.alpha = 0;
            
        } completion:^(BOOL finished) {
            
            [label removeFromSuperview];
            complete();
            
        }];
    }];
}

+ (void)showLabelWithFrame:(CGRect)rect
                  andTitle:(NSString *)title
              andSuperView:(UIViewController *)superViewController
               andComplete:(void(^)())complete
{
    UILabel *label = [[UILabel alloc]initWithFrame:rect];
    label.text = title;
    label.layer.masksToBounds = YES;
    label.layer.cornerRadius = 8.0f;
    label.font = [UIFont systemFontOfSize:16];
    label.backgroundColor = [UIColor blackColor];
    label.alpha = 0;
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor whiteColor];
    [superViewController.view addSubview:label];
    
    [UIView animateWithDuration:2 animations:^{
        label.alpha = 1;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:2 animations:^{
            label.alpha = 0;
        } completion:^(BOOL finished) {
            [label removeFromSuperview];
            if (complete) {
                complete();
            }
        }];
    }];
}
@end
