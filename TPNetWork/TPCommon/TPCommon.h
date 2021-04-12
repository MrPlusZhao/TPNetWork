//
//  TPCommon.h
//  TPNetWork
//
//  Created by MrPlusZhao on 2021/4/12.
//

#import <MBProgressHUD/MBProgressHUD.h>

NS_ASSUME_NONNULL_BEGIN

@interface TPCommon : MBProgressHUD

/// 非网络请求提示语,加在window上,或者加在View上,有倒计时
+ (void)ShowNomal:(nullable NSString *)text afterDelay:(NSTimeInterval)delay;
+ (void)ShowNomal:(nullable NSString *)text view:(nullable UIView *)view afterDelay:(NSTimeInterval)delay;

/// 网络请求提示语,加在window上,或者加在View上,没有倒计时
+ (TPCommon *)ShowLoading:(nullable NSString *)message;
+ (TPCommon *)ShowLoading:(nullable NSString *)message toView:(nullable UIView *)view;


+ (void)hideHUD;
+ (void)hideHUDForView:(nullable UIView *)view;

@end

NS_ASSUME_NONNULL_END
