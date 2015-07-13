//
//  Visitor+AppFunction.h
//  ZeroGo_Tools
//
//  Created by colorful-MBP on 15/4/18.
//  Copyright (c) 2015年 colorful-MBP. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Reachability.h"
/**********************************************************
 *  常用控件简单封装（需与UIView+MoreUISet配合使用）
 **********************************************************/
@interface Visitor_AppFunction : NSObject

/**
 *  1.UIViewu
 */
+ (UIView *)ViewWithFrame:(CGRect)rect withBackColor:(UIColor *)backColor;
/**
 *  2.UIImageView
 */
+ (UIImageView *)ImageViewWithFrame:(CGRect)rect withImage:(NSString *)imageName;
/**
 *  3.1 UIButton
 */
+ (UIButton *)ButtonWithFrame:(CGRect)rect title:(NSString *)title titleColor:(UIColor *)titleColor font:(int)size withTarget:(id)target withAction:(SEL)action withBackColor:(UIColor *)backColor withBackgroundImage:(NSString*)name withSelectBackgroundImage:(NSString*)selectName;
/**
 *  3.2 UIButton
 */
//+ (UIButton *)ButtonWithFrame:(CGRect)rect backImage:(NSString *)imageName withTarget:(id)target withAction:(SEL)action;
/**
 *  4.1 UILabel
 */
+ (UILabel *)LabelWithFrame:(CGRect)rect withText:(NSString *)text withTextColor:(UIColor *)textColor withFont:(int)fontSize withTextAlignment:(NSTextAlignment)alignment withBackColor:(UIColor *)backColor;
/**
 *  4.2 UILabel
 */
+ (UILabel *)LabelWithFrame:(CGRect)rect withText:(NSString *)text withTextColor:(UIColor *)textColor withFont:(int)fontSize withTextAlignment:(NSTextAlignment)alignment withBackColor:(UIColor *)backColor andNumberOfLine:(NSInteger)numberOfLine andLineBreakMode:(NSLineBreakMode)lineBreakMode;
/**
 *  5. UITextField
 */
+ (UITextField *)TextFieldWithFrame:(CGRect)rect withPlaceholder:(NSString *)placeholder withFont:(int)fontSize withBackColor:(UIColor *)backColor;
/**
 *  6. UITableView
 */
+ (UITableView *)TableViewWithFrame:(CGRect)rect withTableViewStyle:(UITableViewStyle)style withDelegate:(id)delegate withDataSourec:(id)dataSource;
/**
 *  7. UIScrollView
 */
+ (UIScrollView *)ScrollViewWithFrame:(CGRect)rect withContentSize:(CGSize)size withDelegate:(id)delegate showsHorizontal:(BOOL)horizontal showsVertical:(BOOL)vertical withBackColor:(UIColor *)backcolor;
/**
 *  8. AlertView
 */
+ (UIAlertView *)alertTitle:(NSString *)title message:(NSString *)msg delegate:(id)aDeleagte cancelBtn:(NSString *)cancelName otherBtnName:(NSString *)otherbuttonName;



//判断旋转
+ (CGAffineTransform) XSZ_RotateTransformForOrientTation:(UIInterfaceOrientation)orientation;


+ (void)showLabelWithFrame:(CGRect)rect
                  andTitle:(NSString *)title
               andComplete:(void(^)())complete;

#pragma mark - 闪烁标签（收藏成功，收藏失败，取消收藏成功）
+ (void)showLabelWithFrame:(CGRect)rect
                  andTitle:(NSString *)title
              andSuperView:(UIViewController *)superViewController
               andComplete:(void(^)())complete;
@end
