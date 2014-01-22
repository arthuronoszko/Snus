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
    NSArray *snusBrands = @[
                            [SnusBrand makeNewSnusBrandWithManufacturer:@"British American Tobacco" brand:@"Camel"],
                            [SnusBrand makeNewSnusBrandWithManufacturer:@"British American Tobacco" brand:@"Lukcy Strike"],
                            [SnusBrand makeNewSnusBrandWithManufacturer:@"Gotlandssnus AB" brand:@"Jakobssons snus"],
                            [SnusBrand makeNewSnusBrandWithManufacturer:@"Gotlandssnus AB" brand:@"Julesnus"],
                            [SnusBrand makeNewSnusBrandWithManufacturer:@"Gotlandssnus AB" brand:@"Sommarsnus"]
                            ];
    
    return snusBrands;
}
@end


/*
 British American Tobacco
 Camel
 Lucky Strike
 Gotlandssnus AB
 Jakobssons snus
 Julesnus
 Sommarsnus
 Melon
 Fläder
 Mint
 Ice Fruit
 Lakrits
 GN Tobacco Sweden AB
 Oden`s
 Fiedler & Lundgren
 Mocca
 Granit
 Knekt
 Japan Tobacco International
 LD
 Camel
 Gustavus
 Philip Morris International
 1847
 Skruf
 Skruf
 Knox
 Smålands
 Swedish Match
 General
 Catch
 Göteborgs Prima Fint
 Göteborgs Rapé
 Probe
 Grovsnus
 Tre Ankare
 Ettan
 Röda Lacket
 Nick and Johnny
 Kronan
 Kardus
 Kaliber
 v2 Tobacco
 Phantom
 Offroad
 Thunder
 Megapole
 X2 Lössnus
 Scandinavian Premium Tobacco
 Montecristo
 Romeo y Julieta
 Taboca
 Övriga
 Elixyr
*/