//
//  SnusBrand.m
//  Snus
//
//  Created by Arthur Onoszko on 20/01/14.
//  Copyright (c) 2014 Arthur Onoszko. All rights reserved.
//

#import "SnusBrand.h"

@implementation SnusBrand

+(NSArray *) getBrandNames
{
    NSArray *snusBrands = @[@"Göteborgs Rapé",
                            @"General",
                            @"Grov"];
    
    return snusBrands;
}
@end
