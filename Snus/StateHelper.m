//
//  StateHelper.m
//  Snus
//
//  Created by Arthur Onoszko on 20/01/14.
//  Copyright (c) 2014 Arthur Onoszko. All rights reserved.
//

#import "StateHelper.h"
#import "SnusBrand.h"
#import "SnusType.h"
#define KEY_ALL_INTAKES @"Intakes"
#define KEY_DATE @"Date"
#define KEY_TYPE @"Type"
#define KEY_MANUFACTURER @"Manufacturer"
#define KEY_NAME @"Name"

@implementation StateHelper

+(NSInteger) getDayCount
{
    NSMutableArray *allIntakes = [StateHelper getAllSavedIntakesSortedByDate];
    
    NSInteger dayCount = 0;
    
    for(NSDictionary *intake in allIntakes)
    {
        NSDate *intakeDate = [intake objectForKey:KEY_DATE];
        if([[StateHelper getDateString:intakeDate] isEqualToString:[StateHelper getDateString:[NSDate date]]])
        {
            dayCount++;
        }
    }
    
    return dayCount;
}

+(NSString *) getDateString:(NSDate*)date
{
    NSDateComponents *components = [[NSCalendar currentCalendar] components:NSDayCalendarUnit | NSMonthCalendarUnit | NSYearCalendarUnit fromDate:date];
    int year = [components year];
    int month = [components month];
    int day = [components day];
    NSString *dateString = [NSString stringWithFormat:@"%d-%d-%d", day, month, year ];
    return dateString;
}

+(void) addSnusIntakeTodayWithType:(SnusType *)snusType Brand:(SnusBrand *)snusBrand
{
    NSMutableArray *oldIntakes = [StateHelper getAllSavedIntakesSortedByDate];
    if(!oldIntakes)
    {
        oldIntakes = [NSMutableArray new];
    }
    NSDictionary *intakeInfo = @{
                                 KEY_DATE : [NSDate date],
                                 KEY_TYPE : snusType.name,
                                 KEY_MANUFACTURER : snusBrand.manufacturer,
                                 KEY_NAME : snusBrand.name
                                 };
    
    [oldIntakes addObject:intakeInfo];
    [StateHelper saveAllIntakes:oldIntakes];
    
}

+(NSMutableArray *) getAllSavedIntakesSortedByDate
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSMutableArray *allSavedIntakes = [[userDefaults objectForKey:KEY_ALL_INTAKES] mutableCopy];
    [allSavedIntakes sortUsingDescriptors:[NSArray arrayWithObjects:[NSSortDescriptor sortDescriptorWithKey:KEY_DATE ascending:YES], nil]];
    return allSavedIntakes;

}
+(void) saveAllIntakes:(NSMutableArray *)allIntakes
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:allIntakes forKey:KEY_ALL_INTAKES];
    [userDefaults synchronize];
}
@end
