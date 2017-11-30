//
//  CustomNative.m
//  CustomNative
//
//  Created by KB_IOS_01 on 2017/11/30.
//  Copyright © 2017年 kuaibiwangluo. All rights reserved.
//
//http://mdsa.51cto.com/art/201605/510938.htm
#import "CustomNative.h"
#import "RCTLog.h"

@implementation CustomNative
@synthesize bridge = _bridge;

//1、导出原生模块
RCT_EXPORT_MODULE(CustomNative);
//import { NativeModules } from 'react-native';
//var BGNativeModuleExample = NativeModules.BGNativeModuleExample;

//2、为原生模块添加方法
RCT_EXPORT_METHOD(testPrint:(NSString *)name info:(NSDictionary *)info) {
    RCTLogInfo(@"%@: %@", name, info);
}
//BGNativeModuleExample.testPrint("Jack", {
//height: '1.78m',
//weight: '7kg'
//});

//3、回调函数
RCT_EXPORT_METHOD(getNativeClass:(RCTResponseSenderBlock)callback) {
    callback(@[NSStringFromClass([self class])]);
}
//BGNativeModuleExample.getNativeClass(name => {
//    console.log("nativeClass: ", name);
//});

//5、promiss
//原生模块还可以使用promise来简化代码，搭配ES2016(ES7)标准的async/await语法则效果更佳。
//如果桥接原生方法的最后两 个参数是RCTPromiseResolveBlock和RCTPromiseRejectBlock，
//则对应的JS方法就会返回一个Promise对 象。
RCT_REMAP_METHOD(testRespondMethod,
                 name:(NSString *)name
                 resolver:(RCTPromiseResolveBlock)resolve
                 rejecter:(RCTPromiseRejectBlock)reject) {
    if([self respondsToSelector:NSSelectorFromString(name)]) {
        resolve(@YES);
    }
    else {
        reject(@"-1001", @"not respond this method", nil);
    }
}
//调用方式1
//BGNativeModuleExample.testRespondMethod("dealloc")
//.then(result => {
//    console.log("result is ", result);
//})
//.catch(error => {
//    console.log(error);
//});

//调用方式2
//async testRespond() {
//    try {
//        var result = BGNativeModuleExample.testRespondMethod("hell");
//        if(result) {
//            console.log("respond this method");
//        }
//    } catch (e) {
//        console.log(e);
//    }
//}

//6、导出常量
- (NSDictionary *)constantsToExport {
    return @{ @"BGModuleName" : @"BGNativeModuleExample",
              @"TestEventName": @"TestEventName"
              };
}
//console.log("BGModuleName value is ", BGNativeModuleExample.BGModuleName);

//??????#import "RCTEventDispatcher.h"有错误
//8、给JS发送事件
//即使没有被JS调用，本地模块也可以给JS发送事件通知。最直接的方式是使用eventDispatcher。

//- (void)receiveNotification:(NSNotification *)notification {
//    [self.bridge.eventDispatcher sendAppEventWithName:@"sendNotifyToJs" body:@{@"name": @"Jack"}];
//}
//NativeAppEventEmitter.addListener(BGNativeModuleExample.TestEventName, info => {
//    console.log(info);
//});

@end
