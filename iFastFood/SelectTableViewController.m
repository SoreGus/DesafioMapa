//
//  SelectTableViewController.m
//  iFastFood
//
//  Created by Lucas on 05/02/14.
//  Copyright (c) 2014 Mackenzie. All rights reserved.
//

#import "SelectTableViewController.h"
#import "CollorPickerViewController.h"

@interface SelectTableViewController ()
{
    NSArray *fastFoods;
    NSIndexPath *previousIndex;
}
@end

@implementation SelectTableViewController



- (void)viewDidLoad
{
    fastFoods = [NSArray arrayWithObjects:@"McDonalds", @"Burger King", @"Bobs", @"Subway", @"Pizza Hut", @"Starbucks", @"Dominos", @"KFC", @"Carls Jr", @"Wendys", @"Taco Bell", @"Dunkin Donuts", @"Outback", @"Papa Johns", @"Applebees", nil];
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
    return fastFoods.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    cell.textLabel.text = fastFoods[indexPath.row];
    NSString *formattedName = cell.textLabel.text;
    formattedName = [formattedName lowercaseString];
    formattedName = [formattedName stringByReplacingOccurrencesOfString:@" " withString:@""];
    cell.imageView.image = [UIImage imageNamed:formattedName];
    
        
    //verifica se a string fastFoodName nao é nula
    if (_fastFoodName) {
        //verifica se é a cell do restaurante selecionadoa anteriormente
        if ([cell.textLabel.text isEqualToString:_fastFoodName])
        {
            //coloca um checkmark
            cell.accessoryType = UITableViewCellAccessoryCheckmark;
            //define como o ultimo index selecionado
            previousIndex = indexPath;
        }
    }
    
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    //remove o checkmark da cell que estava selecionada
    if (previousIndex && (previousIndex.row != indexPath.row)) {
        UITableViewCell *cell = [tableView cellForRowAtIndexPath:previousIndex];
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    //adiciona ou remove o checkmark, dependendo do estado atual da cell
    if (cell.accessoryType == UITableViewCellAccessoryNone) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
        _fastFoodName = cell.textLabel.text;
    } else {
        cell.accessoryType = UITableViewCellAccessoryNone;
        _fastFoodName = nil;
    }
    
    //define como o ultimo index selecionado
    previousIndex = indexPath;
}

@end
