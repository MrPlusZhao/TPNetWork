//
//  TPNetWork.h
//  TPNetWork
//
//  Created by MrPlusZhao on 2021/1/11.
//

#import <Foundation/Foundation.h>
#import "AFHTTPSessionManager.h"

NS_ASSUME_NONNULL_BEGIN

typedef enum : NSUInteger {
    TPTYPE_POST,
    TPTYPE_GET,
    TPTYPE_PUT,
} TPRequestType;

@interface TPNetWork : NSObject

+ (AFHTTPSessionManager *)shareManager;

+ (void)post:(NSString *)URLString
   parameter:(nullable NSDictionary *)parameter
     success:(void (^)(id resultObject))successCallback
     failure:(void (^)(id resultObject))failureCallback
       error:(nullable void (^)(NSError *error))errorCallBack;

+ (void)get:(NSString *)URLString
  parameter:(nullable NSDictionary *)parameter
    success:(void (^)(id resultObject))successCallback
    failure:(void (^)(id resultObject))failureCallback
      error:(nullable void (^)(NSError *error))errorCallBack;

+ (void)put:(NSString *)URLString
  parameter:(nullable NSDictionary *)parameter
    success:(void (^)(id resultObject))successCallback
    failure:(void (^)(id resultObject))failureCallback
      error:(nullable void (^)(NSError *error))errorCallBack;

+ (void)request:(TPRequestType)type
                  url:(NSString *)URLString
            parameter:(nullable NSDictionary *)parameter
              headers:(nullable NSDictionary <NSString *, NSString *> *)headers
          needLoading:(BOOL)loading
              success:(void (^)(id resultObject))successCallback
              failure:(void (^)(id resultObject))failureCallback
                error:(nullable void (^)(NSError *error))errorCallBack;

@end

NS_ASSUME_NONNULL_END
