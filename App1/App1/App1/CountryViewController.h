//
//  CountryViewController.h
//  App1
//
//  Created by David Rivera on 2/3/15.
//  Copyright (c) 2015 David Rivera. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CountryViewController : UIViewController
{
    UIImage *flag;
    NSString *lbName;
    NSString *lbCapital;
    NSString *lbSize;
    NSString *lbPop;
}
@property (weak, nonatomic) IBOutlet UIImageView *flagImage;
@property (weak, nonatomic) IBOutlet UILabel *lable_Capital;
@property (weak, nonatomic) IBOutlet UILabel *lable_Country;
@property (weak, nonatomic) IBOutlet UILabel *lable_Population;
@property (weak, nonatomic) IBOutlet UILabel *lable_Area;

-(void)setImage:(UIImage *)image;
-(void)setLableName:(NSString *)text;
-(void)setLableCapital:(NSString *)test;
-(void)setLableSize:(NSString *)test;
-(void)setLablePopulation:(NSString *)test;


@end