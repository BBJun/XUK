//
//  UIUtils.h
//  WXTime
//
//  Created by wei.chen on 12-7-22.
//  Copyright (c) 2012年 www.iphonetrain.com 无限互联ios开发培训中心 All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AppDelegate.h"

@interface UIUtils : NSObject

//获取documents下的文件路径
+ (NSString *)getDocumentsPath:(NSString *)fileName;

// date 格式化为 string
+ (NSString*) stringFromFomate:(NSDate*)date formate:(NSString*)formate;

// string 格式化为 date
+ (NSDate *) dateFromFomate:(NSString *)datestring formate:(NSString*)formate;

//Sat Jan 12 11:50:16 +0800 2013
+ (NSString *)fomateString:(NSString *)datestring;

//返回本机版本
+(float)OSVersion;

//获取AppDelegate
+ (AppDelegate *)instance;

//获取字符串高度
+ (float)heightForString:(NSString *)value fontSize:(float)fontSize andWidth:(float)width;

//获取字符串宽度
+ (float)widthForString:(NSString *)value fontSize:(float)fontSize andHeight:(float)height;

//MD5加密
+ (NSString *)md5:(NSString *)str;

//返回当前时间的时间戳
+ (NSString *)getCurrentDateStamp;

@end
