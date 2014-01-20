//
//  StateHelper.m
//  Snus
//
//  Created by Arthur Onoszko on 20/01/14.
//  Copyright (c) 2014 Arthur Onoszko. All rights reserved.
//

#import "StateHelper.h"

@implementation StateHelper

+(void) saveDayCount:(NSInteger)dayCount
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setInteger:dayCount forKey:@"DayCount"];
    [userDefaults synchronize];
}

+(NSInteger) getDayCount
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    return [userDefaults integerForKey:@"DayCount"] ? : 0;
}
@end
