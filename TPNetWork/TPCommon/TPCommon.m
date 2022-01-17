//
//  TPCommon.m
//  TPNetWork
//
//  Created by MrPlusZhao on 2021/4/12.
//

#import "TPCommon.h"

@implementation TPCommon

+ (void)showNomal:(nullable NSString *)text afterDelay:(NSTimeInterval)delay{
    [TPCommon showNomal:text view:nil afterDelay:delay];
}
+ (void)showNomal:(nullable NSString *)text view:(nullable UIView *)view afterDelay:(NSTimeInterval)delay
{
    if (view == nil) view = [[UIApplication sharedApplication].windows lastObject];
    // 快速显示一个提示信息
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
    hud.bezelView.backgroundColor = UIColor.blackColor;    //背景颜色
    hud.label.text = text;
    hud.mode = MBProgressHUDModeText;
    hud.label.textColor = UIColor.whiteColor;
    if (text.length > 16) {
        hud.label.text = @"温馨提示";
        hud.detailsLabel.text = text;
        hud.detailsLabel.font = [UIFont systemFontOfSize:16];
    }
    // 再设置模式
    // 隐藏时候从父控件中移除
    hud.removeFromSuperViewOnHide = YES;
    // 1秒之后再消失
    if (!delay) {
        delay = 2.0;
    }
    [hud hideAnimated:YES afterDelay:delay];
}
+ (TPCommon *)showLoading:(nullable NSString *)message toView:(nullable UIView *)view {
    if (view == nil) view = [[UIApplication sharedApplication].windows lastObject];
    // 快速显示一个提示信息
    TPCommon *hud = [TPCommon showHUDAddedTo:view animated:YES];
    hud.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
    hud.bezelView.backgroundColor = UIColor.blackColor;    //背景颜色
    hud.label.textColor = UIColor.whiteColor;
    hud.detailsLabel.textColor = UIColor.whiteColor;
    hud.label.text = message;
    hud.contentColor = UIColor.whiteColor;
    // 隐藏时候从父控件中移除
    hud.removeFromSuperViewOnHide = YES;
    return hud;
}

+ (TPCommon *)showLoading:(nullable NSString *)message
{
    return [self showLoading:message toView:nil];
}

+ (void)hideHUDForView:(nullable UIView *)view
{
    if (view == nil) view = [[UIApplication sharedApplication].windows lastObject];
    [self hideHUDForView:view animated:YES];
}

+ (void)hideHUD
{
    [self hideHUDForView:nil];
}

@end
