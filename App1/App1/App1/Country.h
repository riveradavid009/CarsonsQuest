//
//  Country.h
//  App0
//
//  Created by David Rivera on 2/2/15.
//  Copyright (c) 2015 David Rivera. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Country : NSObject

@property NSString *name;
@property NSString *capital;
@property int population;
@property int size;

//Constructors
- (id)initWithName:(NSString *)newName;
//- (id)initWithAllAttributes:(NSString *) newName, (NSString *) newCapital, (int) newPop, (int) newSize;

//Getters
- (NSString *)getName;
- (NSString *)getCapital;
- (int)getPopulation;
- (int)getSize;

//Setters
- (void)setName:(NSString *)newName;
- (void)setCapital:(NSString *)newCapital;
- (void)setPopulation:(int)newPopulation;
-( void)setSize:(int)newSize;

@end