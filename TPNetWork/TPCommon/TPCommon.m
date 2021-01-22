//
//  TPCommon.m
//  TPNetWork
//
//  Created by MrPlusZhao on 2021/1/18.
//

#import "TPCommon.h"
#import <MBProgressHUD/MBProgressHUD.h>

@interface TPCommon ()

@property (nonatomic, weak)   MBProgressHUD *commonHUD;
@property (nonatomic, strong) MBProgressHUD *requestHUD;

@end

@implementation TPCommon

static TPCommon *shared = nil;

+ (TPCommon *)shared{
    @synchronized(self){
        if (shared == nil){
            shared = [[TPCommon alloc] init];
        }
    }
    return shared;
}
//- (void)showMessage:(NSString *)message
//                   detailsMessge:(NSString *)detailsMessage
//     afterDelayTime:(float) afterDelayTime subView:(nullable UIView*)subView
//{
//    if (_commonHUD) {return;}
//    if (subView) {
//
//    }
//    MBProgressHUD *commonHUD = [MBProgressHUD showHUDAddedTo:[[UIApplication sharedApplication].delegate window] animated:YES];
//    _commonHUD = commonHUD;
//    commonHUD.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
//    commonHUD.bezelView.color = UIColor.blackColor;    //背景颜色
//    commonHUD.userInteractionEnabled= NO;
//    _commonHUD.mode = MBProgressHUDModeText;
//    commonHUD.label.textColor = UIColor.whiteColor;
//    commonHUD.detailsLabel.textColor = UIColor.whiteColor;
//    commonHUD.label.numberOfLines = 0;
//
//    if ([message isEqualToString:@""])
//    {
//        _commonHUD.label.text = @"加载中...";
//    }else{
//        _commonHUD.label.text = message;
//    }
//    _commonHUD.detailsLabel.text = detailsMessage;
//
//    [_commonHUD showAnimated:YES];
//    if (afterDelayTime > 0) {
//        [_commonHUD hideAnimated:YES afterDelay:afterDelayTime];
//    }else{
//        [_commonHUD hideAnimated:YES afterDelay:1.0];
//    }
//}

@end
