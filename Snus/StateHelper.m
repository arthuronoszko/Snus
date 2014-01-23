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
#define KEY_BRAND_INDEX @"BrandIndex"
#define KEY_TYPE_INDEX @"TypeIndex"

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
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"dd-MM-yyyy"];
    return [formatter stringFromDate:date];
}
+(NSString *) getDateStringWithTime:(NSDate *)date
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"dd-MM-yyyy HH:mm"];
    return [formatter stringFromDate:date];
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

+(void) saveChosenBrand:(SnusBrand *)chosenBrand andChosenType:(SnusType *)chosenType
{
    NSArray *brands = [SnusBrand getBrands];
    NSArray *types = [SnusType getTypesWithImages];
    NSInteger brandIndex = 0;
    for(SnusBrand *brand in brands)
    {
        if([brand.name isEqualToString:chosenBrand.name] && [brand.manufacturer isEqualToString:chosenBrand.manufacturer])
        {
            brandIndex = [brands indexOfObject:brand];
            break;
        }
    }
    
    NSInteger typeIndex = 0;
    for(SnusType *type in types)
    {
        if([type.name isEqualToString:chosenType.name] && [type.image isEqual:chosenType.image])
        {
            typeIndex = [types indexOfObject:type];
            break;
        }
    }
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setInteger:brandIndex forKey:KEY_BRAND_INDEX];
    [userDefaults setInteger:typeIndex forKey:KEY_TYPE_INDEX];
    [userDefaults synchronize];
}

+(NSInteger) getSavedChosenBrandIndex
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSInteger chosenBrandIndex = [userDefaults integerForKey:KEY_BRAND_INDEX];
    return chosenBrandIndex;
}
+(NSInteger) getSavedChosenTypeIndex
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSInteger chosenTypeIndex = [userDefaults integerForKey:KEY_TYPE_INDEX];
    return chosenTypeIndex;
}
@end
