//
//  Country.m
//  App0
//
//  Created by David Rivera on 2/2/15.
//  Copyright (c) 2015 David Rivera. All rights reserved.
//

#import "Country.h"

@implementation Country

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

//Getters
- (NSString *)getName
{
    return _name;
}
- (NSString *)getCapital
{
    return _capital;
}
- (int)getPopulation
{
    return _population;
}
- (int)getSize
{
    return _size;
}


//Setters
- (void)setName:(NSString *)newName
{
    _name = newName;
}
- (void)setCapital:(NSString *)newCapital
{
    _capital = newCapital;
}
- (void)setPopulation:(int)newPopulation
{
    _population = newPopulation;
}
- (void)setSize:(int)newSize
{
    _size = newSize;
}

@end


