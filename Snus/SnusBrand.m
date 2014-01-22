//
//  SnusBrand.m
//  Snus
//
//  Created by Arthur Onoszko on 20/01/14.
//  Copyright (c) 2014 Arthur Onoszko. All rights reserved.
//

#import "SnusBrand.h"

@implementation SnusBrand

+(SnusBrand*) makeNewSnusBrandWithManufacturer:(NSString *)aManufacturer brand:(NSString *)abrand
{
    SnusBrand *snusBrand = [SnusBrand new];

    snusBrand.manufacturer = aManufacturer;
    snusBrand.name = abrand;
    
    return snusBrand;
}

+(NSArray *) getBrands
{
    NSMutableArray *snusBrands = [@[
                            [SnusBrand makeNewSnusBrandWithManufacturer:@"British American Tobacco" brand:@"Camel"],
                            [SnusBrand makeNewSnusBrandWithManufacturer:@"British American Tobacco" brand:@"Lucky Strike"],
                            [SnusBrand makeNewSnusBrandWithManufacturer:@"Gotlandssnus AB" brand:@"Jakobssons snus"],
                            [SnusBrand makeNewSnusBrandWithManufacturer:@"Gotlandssnus AB" brand:@"Julesnus"],
                            [SnusBrand makeNewSnusBrandWithManufacturer:@"Gotlandssnus AB" brand:@"Sommarsnus"],
                            [SnusBrand makeNewSnusBrandWithManufacturer:@"Gotlandssnus AB" brand:@"Melon"],
                            [SnusBrand makeNewSnusBrandWithManufacturer:@"Gotlandssnus AB" brand:@"Fläder"],
                            [SnusBrand makeNewSnusBrandWithManufacturer:@"Gotlandssnus AB" brand:@"Mint"],
                            [SnusBrand makeNewSnusBrandWithManufacturer:@"Gotlandssnus AB" brand:@"Ice Fruit"],
                            [SnusBrand makeNewSnusBrandWithManufacturer:@"Gotlandssnus AB" brand:@"Lakrits"],
                            [SnusBrand makeNewSnusBrandWithManufacturer:@"GN Tobacco Sweden AB" brand:@"Oden's"],
                            [SnusBrand makeNewSnusBrandWithManufacturer:@"Fiedler & Lundgren" brand:@"Mocca"],
                            [SnusBrand makeNewSnusBrandWithManufacturer:@"Fiedler & Lundgren" brand:@"Granit"],
                            [SnusBrand makeNewSnusBrandWithManufacturer:@"Fiedler & Lundgren" brand:@"Knekt"],
                            [SnusBrand makeNewSnusBrandWithManufacturer:@"Japan Tobacco International" brand:@"LD"],
                            [SnusBrand makeNewSnusBrandWithManufacturer:@"Japan Tobacco International" brand:@"Camel"],
                            [SnusBrand makeNewSnusBrandWithManufacturer:@"Japan Tobacco International" brand:@"Gustavus"],
                            [SnusBrand makeNewSnusBrandWithManufacturer:@"Philip Morris International" brand:@"1847"],
                            [SnusBrand makeNewSnusBrandWithManufacturer:@"Skruf" brand:@"Skruf"],
                            [SnusBrand makeNewSnusBrandWithManufacturer:@"Skruf" brand:@"Knox"],
                            [SnusBrand makeNewSnusBrandWithManufacturer:@"Skruf" brand:@"Smålands"],
                            [SnusBrand makeNewSnusBrandWithManufacturer:@"Swedish Match" brand:@"General"],
                            [SnusBrand makeNewSnusBrandWithManufacturer:@"Swedish Match" brand:@"Catch"],
                            [SnusBrand makeNewSnusBrandWithManufacturer:@"Swedish Match" brand:@"Göteborgs Prima Fint"],
                            [SnusBrand makeNewSnusBrandWithManufacturer:@"Swedish Match" brand:@"Göteborgs Rapé"],
                            [SnusBrand makeNewSnusBrandWithManufacturer:@"Swedish Match" brand:@"Probe"],
                            [SnusBrand makeNewSnusBrandWithManufacturer:@"Swedish Match" brand:@"Grovsnus"],
                            [SnusBrand makeNewSnusBrandWithManufacturer:@"Swedish Match" brand:@"Tre Ankare"],
                            [SnusBrand makeNewSnusBrandWithManufacturer:@"Swedish Match" brand:@"Ettan"],
                            [SnusBrand makeNewSnusBrandWithManufacturer:@"Swedish Match" brand:@"Röda Lacket"],
                            [SnusBrand makeNewSnusBrandWithManufacturer:@"Swedish Match" brand:@"Nick and Johnny"],
                            [SnusBrand makeNewSnusBrandWithManufacturer:@"Swedish Match" brand:@"Kronan"],
                            [SnusBrand makeNewSnusBrandWithManufacturer:@"Swedish Match" brand:@"Kardus"],
                            [SnusBrand makeNewSnusBrandWithManufacturer:@"Swedish Match" brand:@"Kaliber"],
                            [SnusBrand makeNewSnusBrandWithManufacturer:@"v2 Tobacco" brand:@"Phantom"],
                            [SnusBrand makeNewSnusBrandWithManufacturer:@"v2 Tobacco" brand:@"Offroad"],
                            [SnusBrand makeNewSnusBrandWithManufacturer:@"v2 Tobacco" brand:@"Thunder"],
                            [SnusBrand makeNewSnusBrandWithManufacturer:@"v2 Tobacco" brand:@"Megapole"],
                            [SnusBrand makeNewSnusBrandWithManufacturer:@"v2 Tobacco" brand:@"X2"],
                            [SnusBrand makeNewSnusBrandWithManufacturer:@"Scandinavian Premium Tobacco" brand:@"Montecristo"],
                            [SnusBrand makeNewSnusBrandWithManufacturer:@"Scandinavian Premium Tobacco" brand:@"Romeo y Julieta"],
                            [SnusBrand makeNewSnusBrandWithManufacturer:@"Scandinavian Premium Tobacco" brand:@"Taboca"],
                            [SnusBrand makeNewSnusBrandWithManufacturer:@"Rebel Tobacco" brand:@"Elixyr"]
                            ] mutableCopy];
    [snusBrands sortUsingDescriptors:[NSArray arrayWithObjects:[NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES], nil]];
    return snusBrands;
}
@end