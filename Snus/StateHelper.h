//
//  StateHelper.h
//  Snus
//
//  Created by Arthur Onoszko on 20/01/14.
//  Copyright (c) 2014 Arthur Onoszko. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StateHelper : NSObject

+(void) saveDayCount:(NSInteger)dayCount;
+(NSInteger) getDayCount;

@end
