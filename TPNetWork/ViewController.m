//
//  ViewController.m
//  TPNetWork
//
//  Created by MrPlusZhao on 2021/1/11.
//

#import "ViewController.h"
#import "TPNetWork.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.redColor;
    // Do any additional setup after loading the view.
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
//    NSString *url = @"http://192.168.2.126:8888/dptweb/dptInterface/order/goodCount.action";
//    [TPNetWork RequestType:TPTYPE_POST url:url parameter:nil headers:nil needLoading:YES success:^(id  _Nonnull resultObject) {
//        NSLog(@"%@",resultObject);
//        } failure:^(id  _Nonnull resultObject) {
//            
//        } error:^(NSError * _Nonnull error) {
//            
//        }];
}

@end
