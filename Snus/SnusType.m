//
//  SnusType.m
//  Snus
//
//  Created by Arthur Onoszko on 20/01/14.
//  Copyright (c) 2014 Arthur Onoszko. All rights reserved.
//

#import "SnusType.h"

@implementation SnusType

+(NSDictionary*) getTypesWithImages
{
    NSDictionary* typesWithImages = @{@"Lös": [UIImage imageNamed:@"image-lossnus"],
                             @"Portion white": [UIImage imageNamed:@"image-white-portion"]};
    return typesWithImages;

}
@end
