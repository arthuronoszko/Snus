//
//  SnusType.m
//  Snus
//
//  Created by Arthur Onoszko on 20/01/14.
//  Copyright (c) 2014 Arthur Onoszko. All rights reserved.
//

#import "SnusType.h"

@implementation SnusType

+(SnusType*) makeNewSnusTypeWithName:(NSString *)aName imagePath:(NSString *)aImagePath
{
    SnusType *snusType = [SnusType new];
    
    snusType.name = aName;
    
    snusType.image = [UIImage imageNamed:aImagePath];
    
    return snusType;
}

+(NSArray*) getTypesWithImages
{
    NSArray* types = @[
                       [SnusType makeNewSnusTypeWithName:@"Lös" imagePath:@"image-lossnus"],
                       [SnusType makeNewSnusTypeWithName:@"Portion white" imagePath:@"image-white-portion"]
                       ];
    return types;

}
@end
