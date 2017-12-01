//
//  RNBaiduMapViewManager.h
//  CustomNative
//
//  Created by KB_IOS_01 on 2017/12/1.
//  Copyright © 2017年 kuaibiwangluo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RNBaiduMapView.h"

@interface RNBaiduMapViewManager : RCTViewManager<BMKMapViewDelegate>

+(void)initSDK:(NSString *)key;

-(void)sendEvent:(RNBaiduMapView *)mapView params:(NSDictionary *)params;


@end
