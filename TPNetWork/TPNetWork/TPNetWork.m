//
//  TPNetWork.m
//  TPNetWork
//
//  Created by MrPlusZhao on 2021/1/11.
//

#import "TPNetWork.h"
#import "TPCommon.h"

NSInteger const TPTimeoutInterval = 10;
NSInteger const TPSucceedCode = 200;


static AFHTTPSessionManager *shareManager;
static dispatch_once_t managerOnceToken;

@interface TPNetWork ()

@end

@implementation TPNetWork

+ (AFHTTPSessionManager *)shareManager
{
    dispatch_once(&managerOnceToken, ^{
        shareManager = [AFHTTPSessionManager manager];
        NSArray *acceptArr = @[@"text/html",
                               @"text/json",
                               @"application/json",
                               @"text/javascript",
                               @"application/javascript",
                               @"application/x-javascript",
                               @"text/plain",@"application/xml"
                               ,@"application/x-www-form-urlencoded"];
        shareManager.responseSerializer = [AFJSONResponseSerializer serializer];
        shareManager.responseSerializer.acceptableContentTypes = [NSSet setWithArray:acceptArr];
        shareManager.requestSerializer.timeoutInterval = TPTimeoutInterval;
    });
    return shareManager;
}
+ (void)post:(NSString *)URLString
   parameter:(nullable NSDictionary *)parameter
     success:(void (^)(id resultObject))successCallback
     failure:(void (^)(id resultObject))failureCallback
       error:(nullable void (^)(NSError *error))errorCallBack{
    
    [TPNetWork request:TPTYPE_POST url:URLString parameter:parameter headers:nil needLoading:YES success:^(id  _Nonnull resultObject) {
        if (successCallback) {
            successCallback(resultObject);
        }
    } failure:^(id  _Nonnull resultObject) {
        if (failureCallback) {
            failureCallback(resultObject);
        }
    } error:^(NSError * _Nonnull error) {
        if (errorCallBack) {
            errorCallBack(error);
        }
    }];
}

+ (void)get:(NSString *)URLString
  parameter:(nullable NSDictionary *)parameter
    success:(void (^)(id resultObject))successCallback
    failure:(void (^)(id resultObject))failureCallback
      error:(nullable void (^)(NSError *error))errorCallBack{
    
    [TPNetWork request:TPTYPE_GET url:URLString parameter:parameter headers:nil needLoading:YES success:^(id  _Nonnull resultObject) {
        if (successCallback) {
            successCallback(resultObject);
        }
    } failure:^(id  _Nonnull resultObject) {
        if (failureCallback) {
            failureCallback(resultObject);
        }
    } error:^(NSError * _Nonnull error) {
        if (errorCallBack) {
            errorCallBack(error);
        }
    }];
}

+ (void)put:(NSString *)URLString
  parameter:(nullable NSDictionary *)parameter
    success:(void (^)(id resultObject))successCallback
    failure:(void (^)(id resultObject))failureCallback
      error:(nullable void (^)(NSError *error))errorCallBack{
    
    [TPNetWork request:TPTYPE_PUT url:URLString parameter:parameter headers:nil needLoading:YES success:^(id  _Nonnull resultObject) {
        if (successCallback) {
            successCallback(resultObject);
        }
    } failure:^(id  _Nonnull resultObject) {
        if (failureCallback) {
            failureCallback(resultObject);
        }
    } error:^(NSError * _Nonnull error) {
        if (errorCallBack) {
            errorCallBack(error);
        }
    }];
}

+ (void)request:(TPRequestType)type
                  url:(NSString *)URLString
            parameter:(nullable NSDictionary *)parameter
              headers:(nullable NSDictionary <NSString *, NSString *> *)headers
          needLoading:(BOOL)loading
              success:(void (^)(id resultObject))successCallback
              failure:(void (^)(id resultObject))failureCallback
                error:(nullable void (^)(NSError *error))errorCallBack{
    switch (type) {
        case TPTYPE_POST:
        {
            [[self shareManager] POST:URLString parameters:parameter headers:headers progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                [TPNetWork afterRequest:URLString parameter:parameter response:responseObject error:nil];
                if ([responseObject[@"code"] integerValue] == TPSucceedCode) {
                    if (successCallback) {
                        successCallback(responseObject);
                    }
                }
                else{
                    if (failureCallback) {
                        failureCallback(responseObject);
                    }
                }
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                [TPNetWork afterRequest:URLString parameter:parameter response:nil error:error];
                if (errorCallBack) {
                    errorCallBack(error);
                }
            }];
        }
            break;
        case TPTYPE_GET:
        {
            [[self shareManager] GET:URLString parameters:parameter headers:headers progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                [TPNetWork afterRequest:URLString parameter:parameter response:responseObject error:nil];
                if ([responseObject[@"code"] integerValue] == TPSucceedCode) {
                    if (successCallback) {
                        successCallback(responseObject);
                    }
                }
                else{
                    if (failureCallback) {
                        failureCallback(responseObject);
                    }
                }
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                [TPNetWork afterRequest:URLString parameter:parameter response:nil error:error];
                if (errorCallBack) {
                    errorCallBack(error);
                }
            }];
        }
            break;
        case TPTYPE_PUT:
        {
            [[self shareManager] PUT:URLString parameters:parameter headers:headers success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                [TPNetWork afterRequest:URLString parameter:parameter response:responseObject error:nil];
                if ([responseObject[@"code"] integerValue] == TPSucceedCode) {
                    if (successCallback) {
                        successCallback(responseObject);
                    }
                }
                else{
                    if (failureCallback) {
                        failureCallback(responseObject);
                    }
                }
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                [TPNetWork afterRequest:URLString parameter:parameter response:nil error:error];
                if (errorCallBack) {
                    errorCallBack(error);
                }
            }];
        }
            break;
        default:
            [[self shareManager] POST:URLString parameters:parameter headers:headers progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                
                [TPNetWork afterRequest:URLString parameter:parameter response:responseObject error:nil];
                
                if ([responseObject[@"code"] integerValue] == TPSucceedCode) {
                    if (successCallback) {
                        successCallback(responseObject);
                    }
                }
                else{
                    if (failureCallback) {
                        failureCallback(responseObject);
                    }
                }
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                [TPNetWork afterRequest:URLString parameter:parameter response:nil error:error];
            }];
            break;
    }
    
}

+ (void)afterRequest:(NSString *)URLString parameter:(NSDictionary *)parameter response:(NSDictionary*)resp error:(NSError *)error{
    [TPCommon hideHUD];
    NSMutableDictionary *mutDict = [NSMutableDictionary dictionary];
    [mutDict setValue:URLString forKey:@"requestUrl"];
    [mutDict setValue:parameter?parameter:@"" forKey:@"requestPrameter"];
    [mutDict setValue:resp?resp:@"" forKey:@"response"];
    [mutDict setValue:error?error.description:@"success"forKey:@"Error"];
    NSLog(@"%@",mutDict);
}

@end
