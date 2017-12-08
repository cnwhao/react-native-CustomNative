import {
    requireNativeComponent,
    View,
    NativeModules,
    Platform,
    DeviceEventEmitter
} from 'react-native';

import React, {
    Component,
    PropTypes
} from 'react';


import _BaiduMapView from './js/BaiduMapView.js';
export const BaiduMapView = _BaiduMapView;
