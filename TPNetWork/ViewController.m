//
//  ViewController.m
//  TPNetWork
//
//  Created by MrPlusZhao on 2021/1/11.
//

#import "ViewController.h"
#import "TPNetWork.h"
#import "MBProgressHUD+TP.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
    // Do any additional setup after loading the view.
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [MBProgressHUD TPShowLoading:@"加载中"];
    [self performSelector:@selector(xxxx) withObject:nil afterDelay:2.0];
    
}
- (void)xxxx{
    NSString *url = @"http://192.168.2.126:8888/dptweb/dptInterface/order/goodCount.action";
    [TPNetWork RequestType:TPTYPE_POST url:url parameter:nil headers:nil needLoading:YES success:^(id  _Nonnull resultObject) {
        NSLog(@"%@",resultObject);
        [MBProgressHUD hideHUD];
    } failure:^(id  _Nonnull resultObject) {
        [MBProgressHUD hideHUD];
        [MBProgressHUD TPShowNomal:@"failure" afterDelay:2.0];
    } error:^(NSError * _Nonnull error) {
        [MBProgressHUD hideHUD];
        
    }];
}
@end
