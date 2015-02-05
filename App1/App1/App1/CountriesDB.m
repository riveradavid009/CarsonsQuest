//
//  CountriesDB.m
//  App1
//
//  Created by David Rivera on 2/4/15.
//  Copyright (c) 2015 David Rivera. All rights reserved.
//

#import "CountriesDB.h"

@implementation CountriesDB

+(Country *)getCountry:(NSString *)country
{
    NSString *sqLiteDb = [[NSBundle mainBundle] pathForResource:@"countries" ofType:@"sqlite3"];
    
    sqlite3 *_database;
    
    if (sqlite3_open_v2([sqLiteDb UTF8String], &_database, SQLITE_OPEN_READONLY, NULL ) != SQLITE_OK)
    {
        NSLog(@"Failed to open database!");
    }
    
    sqlite3_stmt *statement;
    
    NSString *query = [NSString stringWithFormat:@"SELECT * FROM countries Where name ='%@%s",country,"'"];
    //NSString *query = @"SELECT * FROM countries Where name = '";
    NSLog(@"%@",query);
    //sqlite3_stmt *statement;
    Country *temp = [[Country alloc] initWithName:country];
    if (sqlite3_prepare_v2(_database, [query UTF8String], -1, &statement, nil) == SQLITE_OK)
    {
        while (sqlite3_step(statement) == SQLITE_ROW)
        {
            char *capitalChars = (char *) sqlite3_column_text(statement, 1);
            char *sizeChars = (char *) sqlite3_column_text(statement, 2);
            char *populationChars = (char *) sqlite3_column_text(statement, 3);
            //UIImage *flag = [UIImage imageWithData:(NSData *)CFBridgingRelease(sqlite3_column_blob(statement, 4))];
            NSData *dataForCachedImage = [[NSData alloc] initWithBytes:sqlite3_column_blob(statement, 4) length: sqlite3_column_bytes(statement, 4)];
            UIImage *flag = [UIImage imageWithData:dataForCachedImage];
    
            //char *nameChars = (char *) sqlite3_column_text(statement, 0);
            NSString *capital = [[NSString alloc] initWithUTF8String:capitalChars];
            NSString *population = [[NSString alloc] initWithUTF8String:populationChars];
            NSString *size = [[NSString alloc] initWithUTF8String:sizeChars];
            
            [temp setCapital:capital];
            [temp setPopulation:population];
            [temp setSize:size];
            [temp setFlag:flag];
        }
        sqlite3_finalize(statement);
    }
    
    sqlite3_close(_database);
    return temp;
}

+(NSMutableArray *)getCountries
{
    NSString *sqLiteDb = [[NSBundle mainBundle] pathForResource:@"countries" ofType:@"sqlite3"];
    
    sqlite3 *_database;
    
    if (sqlite3_open_v2([sqLiteDb UTF8String], &_database, SQLITE_OPEN_READONLY, NULL ) != SQLITE_OK)
    {
        NSLog(@"Failed to open database!");
    }
    
    sqlite3_stmt *statement;
    
    NSMutableArray *retval = [[NSMutableArray alloc] init];
    NSString *query = @"SELECT name FROM countries";
    //sqlite3_stmt *statement;
    
    if (sqlite3_prepare_v2(_database, [query UTF8String], -1, &statement, nil) == SQLITE_OK)
    {
        while (sqlite3_step(statement) == SQLITE_ROW)
        {
            char *nameChars = (char *) sqlite3_column_text(statement, 0);
            NSString *name = [[NSString alloc] initWithUTF8String:nameChars];
            Country *info = [[Country alloc] initWithName:name];
            [retval addObject:info];

        }
        sqlite3_finalize(statement);
    }
    
    sqlite3_close(_database);
    return retval;
}

@end

