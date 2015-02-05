//
//  ViewController.m
//  App1
//
//  Created by David Rivera on 2/3/15.
//  Copyright (c) 2015 David Rivera. All rights reserved.
//

#import "ViewController.h"
#import "Country.h"
#import "CountryViewController.h"
#import "CountriesDB.h"

@interface ViewController ()
{
    NSArray *countries;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"Countries";
    
    countries = [CountriesDB getCountries];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [countries count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"SimpleTableItem";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    Country *newCountry = [countries objectAtIndex:indexPath.row];
    cell.textLabel.text = newCountry.name;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    Country *newCountry = [countries objectAtIndex:indexPath.row];
    [newCountry loadCountryInfo];
    
    CountryViewController *detailViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"CountryViewController"];
    
    [detailViewController setImage:newCountry.flag];
    [detailViewController setLableName:newCountry.getName];
    [detailViewController setLableCapital:newCountry.getCapital];
    [detailViewController setLableSize:newCountry.getSize];
    [detailViewController setLablePopulation:newCountry.getPopulation];

    [self.navigationController pushViewController:(detailViewController) animated:(YES)];

}

@end
