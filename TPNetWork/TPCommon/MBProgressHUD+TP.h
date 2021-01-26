//
//  MBProgressHUD+TP.h
//  BasicNetWorking
//
//  Created by MrPlusZhao on 2021/1/22.
//  Copyright © 2021 iOSCoderZhao. All rights reserved.
//

#import "MBProgressHUD.h"

NS_ASSUME_NONNULL_BEGIN

@interface MBProgressHUD (TP)

/// 非网络请求提示语,加在window上,或者加在View上,有倒计时
+ (void)TPShowNomal:(nullable NSString *)text afterDelay:(NSTimeInterval)delay;
+ (void)TPShowNomal:(nullable NSString *)text view:(nullable UIView *)view afterDelay:(NSTimeInterval)delay;

/// 网络请求提示语,加在window上,或者加在View上,没有倒计时
+ (MBProgressHUD *)TPShowLoading:(nullable NSString *)message;
+ (MBProgressHUD *)TPShowLoading:(nullable NSString *)message toView:(nullable UIView *)view;


+ (void)hideHUD;
+ (void)hideHUDForView:(nullable UIView *)view;

@end

NS_ASSUME_NONNULL_END
