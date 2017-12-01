//
//  RNBaiduMapView.h
//  CustomNative
//
//  Created by KB_IOS_01 on 2017/12/1.
//  Copyright © 2017年 kuaibiwangluo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RCTViewManager.h"
#import "RCTConvert+CoreLocation.h"
#import <BaiduMapAPI_Map/BMKMapView.h>
#import <BaiduMapAPI_Map/BMKPinAnnotationView.h>
#import <BaiduMapAPI_Map/BMKPointAnnotation.h>

@interface RNBaiduMapView : BMKMapView <BMKMapViewDelegate>

@property (nonatomic, copy) RCTBubblingEventBlock onChange;


@end
