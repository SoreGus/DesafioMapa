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

}
@end

@implementation FontPickerViewController


- (void)viewDidLoad
{
    [self.collorPicker setDelegate:self];
    [self.collorPicker setDataSource:self];
    
    self.colorArray  = [[NSArray alloc] initWithObjects:@"Blue",@"Green",@"Orange",@"Purple",@"Red",@"Black" , nil];
    self.fontArray  = [[NSArray alloc] initWithObjects:@"Damascus",@"Arial",@"Palatino",@"Papyrus",@"Courier",@"Didot" , nil];
    
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
    return 2;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (component == 0)
        return self.colorArray.count;
    else
        return self.fontArray.count;
}

//retorna as palavras das opcoes
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row   forComponent:(NSInteger)component
{
    if (component == 0) {
        return [self.colorArray objectAtIndex:row];
    }
   else if (component == 1)
       return [self.fontArray objectAtIndex:row];
    else
        return nil;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row   inComponent:(NSInteger)component
{
    
    
   self.exampleColor.text = @"Exemplo";
    if (component == 0) {
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
    
    if (component == 1) {
    
    switch (row) {
case 0:
            self.exampleColor.font = [UIFont fontWithName:@"Damascus"size:20];
    break;
    
case 1:
     self.exampleColor.font = [UIFont fontWithName:@"Arial"size:20];
    break;
    
case 2:
     self.exampleColor.font = [UIFont fontWithName:@"Palatino"size:20];
    break;
case 3:
    
     self.exampleColor.font = [UIFont fontWithName:@"Papyrus"size:20];
    break;
case 4:
    
     self.exampleColor.font = [UIFont fontWithName:@"Courier"size:20];
    break;
    
case 5:
    self.exampleColor.font = [UIFont fontWithName:@"Didot"size:20];
    break;
    
default:
    break;
}
                              }



}

@end
