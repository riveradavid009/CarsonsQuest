//
//  Country.m
//  App0
//
//  Created by David Rivera on 2/2/15.
//  Copyright (c) 2015 David Rivera. All rights reserved.
//

#import "Country.h"
#import "CountriesDB.h"

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
-(void)loadCountryInfo
{
    Country *temp = [CountriesDB getCountry:self.name];
    [self setCapital:temp.capital];
    [self setPopulation:temp.population];
    [self setSize:temp.size];
    [self setFlag:temp.flag];
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


