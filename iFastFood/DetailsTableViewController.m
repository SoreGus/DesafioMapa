//
//  DetailsTableViewController.m
//  iFastFood
//
//  Created by Lucas on 06/02/14.
//  Copyright (c) 2014 Mackenzie. All rights reserved.
//

#import "DetailsTableViewController.h"

@interface DetailsTableViewController ()
{
    MKMapItem *mapItem;
    NSString *formattedName;
}
@end

@implementation DetailsTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    formattedName = _name;
    formattedName = [formattedName lowercaseString];
    formattedName = [formattedName stringByReplacingOccurrencesOfString:@" " withString:@""];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return _routeDetails.steps.count + 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    if (indexPath.row == 0) {
        cell.imageView.image = [UIImage imageNamed:formattedName];
        cell.textLabel.text = _name;
        cell.textLabel.textColor = [UIColor whiteColor];
        cell.backgroundColor = [UIColor grayColor];
        return cell;
    }
    
    // Configure the cell...
    cell.textLabel.text = [_routeDetails.steps[indexPath.row -1] instructions];
    cell.textLabel.font = [UIFont systemFontOfSize:12.0];
    cell.textLabel.adjustsFontSizeToFitWidth = YES;
    cell.textLabel.numberOfLines = 1;
    return cell;
}

@end
