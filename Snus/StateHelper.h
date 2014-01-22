//
//  StateHelper.h
//  Snus
//
//  Created by Arthur Onoszko on 20/01/14.
//  Copyright (c) 2014 Arthur Onoszko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SnusType.h"
#import "SnusBrand.h"
#define KEY_ALL_INTAKES @"Intakes"
#define KEY_DATE @"Date"
#define KEY_TYPE @"Type"
#define KEY_MANUFACTURER @"Manufacturer"
#define KEY_NAME @"Name"
@interface StateHelper : NSObject

+(NSInteger) getDayCount;
+(NSString *) getDateString:(NSDate*)date;

+(void) addSnusIntakeTodayWithType:(SnusType *)snusType Brand:(SnusBrand *)snusBrand;
+(NSMutableArray *) getAllSavedIntakesSortedByDate;

@end
