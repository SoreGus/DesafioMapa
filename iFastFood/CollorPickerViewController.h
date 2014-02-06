//
//  CollorPickerViewController.h
//  iFastFood
//
//  Created by Renan Santos Soares on 2/6/14.
//  Copyright (c) 2014 Mackenzie. All rights reserved.
//

#import <UIKit/UIKit.h> 

@interface CollorPickerViewController : UIViewController <UIPickerViewDataSource,UIPickerViewDelegate>
@property (weak, nonatomic) IBOutlet UILabel *color;
@property (weak, nonatomic) IBOutlet UIPickerView *picker;
@property (weak, nonatomic)          NSArray *colorArray;

@end
