//
//  Country.h
//  App0
//
//  Created by David Rivera on 2/2/15.
//  Copyright (c) 2015 David Rivera. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Country : NSObject

//@property UI *flag;
@property NSString *name;
@property NSString *capital;
@property NSString *population;
@property NSString *size;

//Constructors
- (id)initWithName:(NSString *)newName;

//Load country's information
-(BOOL)loadCountryInfo;

//Getters
- (NSString *)getName;
- (NSString *)getCapital;
- (NSString *)getPopulation;
- (NSString *)getSize;

//Setters
//- (void)setFlag:(UIImage *)image;
- (void)setName:(NSString *)newName;
- (void)setCapital:(NSString *)newCapital;
- (void)setPopulation:(NSString *)newPopulation;
- (void)setSize:(NSString *)newSize;

@end