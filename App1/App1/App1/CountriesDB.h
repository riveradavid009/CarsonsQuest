//
//  CountriesDB.h
//  App1
//
//  Created by David Rivera on 2/4/15.
//  Copyright (c) 2015 David Rivera. All rights reserved.
//


#import <Foundation/Foundation.h>
#import "sqlite3.h"
#import "Country.h"

@interface CountriesDB : NSObject
{
    sqlite3 *_database;
}

//+ (CountriesDB *)database;
+(Country *)getCountry:(NSString *)country;
+(NSMutableArray *)getCountries;

@end
