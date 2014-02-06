//
//  FontPickerViewController.m
//  iFastFood
//
//  Created by Renan Santos Soares on 2/6/14.
//  Copyright (c) 2014 Mackenzie. All rights reserved.
//

#import "FontPickerViewController.h"

@interface FontPickerViewController ()
{
    NSString *selectedColor;
}
@end

@implementation FontPickerViewController


- (void)viewDidLoad
{
    [self.collorPicker setDelegate:self];
    [self.collorPicker setDataSource:self];
    
    self.colorArray  = [[NSArray alloc] initWithObjects:@"Blue",@"Green",@"Orange",@"Purple",@"Red",@"Black" , nil];
    
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return 5;
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row   forComponent:(NSInteger)component
{
    
    return [self.colorArray objectAtIndex:row];
    
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row   inComponent:(NSInteger)component
{
    
    selectedColor = [self.colorArray objectAtIndex:row];
    self.exampleColor.text = selectedColor;
    switch (row) {
        case 0:
            self.exampleColor.textColor = [UIColor blueColor];
            break;
            
        case 1:
            self.exampleColor.textColor = [UIColor greenColor];
            break;
            
        case 2:
            self.exampleColor.textColor = [UIColor orangeColor];
            break;
        case 3:
            
            self.exampleColor.textColor = [UIColor purpleColor];
            break;
        case 4:
            
            self.exampleColor.textColor = [UIColor redColor];
            break;
            
        case 5:
            self.exampleColor.textColor = [UIColor blackColor];
            break;
            
        default:
            break;
    }
    
 
    
}

@end
