//
//  SnusType.h
//  Snus
//
//  Created by Arthur Onoszko on 20/01/14.
//  Copyright (c) 2014 Arthur Onoszko. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SnusType : NSObject

+(NSArray*) getTypesWithImages;

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) UIImage *image;
@end
