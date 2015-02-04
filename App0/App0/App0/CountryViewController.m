//
//  CountryViewController.m
//  App1
//
//  Created by David Rivera on 2/3/15.
//  Copyright (c) 2015 David Rivera. All rights reserved.
//

#import "CountryViewController.h"

@interface CountryViewController()

@end

@implementation CountryViewController

@synthesize flagImage =_flag;
@synthesize lable_Area =_area;
@synthesize lable_Capital=_capital;
@synthesize lable_Country=_country;
@synthesize lable_Population=_population;

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationController.navigationBar.translucent = NO;
    
    // Do any additional setup after loading the view, typically from a nib.
    [_flag setImage:flag];
    [_country setText:lbName];
    [_capital setText:lbCapital];
    [_population setText:lbPop];
    [_area setText:lbSize];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setImage:(UIImage *)image
{
    flag = [CountryViewController imageWithImage:image scaledToSize:CGSizeMake(300, 250)];
    //flag = image;
}
-(void)setLableName:(NSString *)text
{
    lbName = text;
}
-(void)setLableCapital:(NSString *)text
{
    lbCapital = text;
}
-(void)setLableSize:(NSString *)text
{
    lbSize = text;
}
-(void)setLablePopulation:(NSString *)text
{
    lbPop = text;
}
+ (UIImage *)imageWithImage:(UIImage *)image scaledToSize:(CGSize)newSize {
    //UIGraphicsBeginImageContext(newSize);
    // In next line, pass 0.0 to use the current device's pixel scaling factor (and thus account for Retina resolution).
    // Pass 1.0 to force exact pixel size.
    UIGraphicsBeginImageContextWithOptions(newSize, NO, 0.0);
    [image drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}@end