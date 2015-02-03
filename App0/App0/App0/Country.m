//
//  Country.m
//  App0
//
//  Created by David Rivera on 2/2/15.
//  Copyright (c) 2015 David Rivera. All rights reserved.
//

#import "Country.h"

@implementation Country

//@synthesize flag = _flag;
@synthesize name = _name;
@synthesize capital = _capital;
@synthesize size = _size;
@synthesize population = _population;

- (id)initWithName:(NSString *)newName
{
    self = [super init];
    if (self)
    {
        _name = newName;
    }
    return self;
}

//Load country's information
-(BOOL)loadCountryInfo
{
    //Hard coded instance
    if([self.name  isEqual: @"USA"])
    {
        [self setCapital:@"Washington D.C"];
        [self setFlag:[UIImage imageNamed:@"usaFlag.png"]];
        [self setPopulation:@"320206000"];
        [self setSize:@"3805927"];
    }
    else if([self.name  isEqual: @"Canada"])
    {
        [self setCapital:@"Ottawa"];
        [self setFlag:[UIImage imageNamed:@"canadaFlag.png"]];
        [self setPopulation:@"35675834"];
        [self setSize:@"3854085"];
    }
    if([self.name  isEqual: @"Mexico"])
    {
        [self setCapital:@"Mexico City"];
        [self setFlag:[UIImage imageNamed:@"mexicoFlag.png"]];
        [self setPopulation:@"118395054"];
        [self setSize:@"761606"];
    }
    return true;
}

//Getters
- (NSString *)getName
{
    return _name;
}
- (NSString *)getCapital
{
    return _capital;
}
- (NSString *)getPopulation
{
    return _population;
}
- (NSString *)getSize
{
    return _size;
}


//Setters

- (void)setFlag:(UIImage *)image
{
    _flag = image;
}
- (void)setName:(NSString *)newName
{
    _name = newName;
}
- (void)setCapital:(NSString *)newCapital
{
    _capital = newCapital;
}
- (void)setPopulation:(NSString *)newPopulation
{
    _population = newPopulation;
}
- (void)setSize:(NSString *)newSize
{
    _size = newSize;
}

@end


