//
//  FontPickerViewController.h
//  iFastFood
//
//  Created by Renan Santos Soares on 2/6/14.
//  Copyright (c) 2014 Mackenzie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FontPickerViewController : UIViewController<UIPickerViewDelegate,UIPickerViewDataSource>
@property (weak, nonatomic) IBOutlet UIPickerView *collorPicker;
@property (weak, nonatomic) IBOutlet UILabel *exampleColor;

@property (retain,nonatomic) NSArray *colorArray ;
@end
