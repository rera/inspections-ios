//
//  InspectionViewController.m
//  Inspections
//
//  Created by David Cabrera on 5/7/13.
//  Copyright (c) 2013 Rera Inc. All rights reserved.
//

#import "InspectionViewController.h"

@interface InspectionViewController ()

@end

@implementation InspectionViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    DetailViewController *parentController = (DetailViewController *) self.tabBarController;
    self.inspection = parentController.detailItem;
    
    [self.completedSwitch setOn:[[self.inspection valueForKey:@"completed"] boolValue]];
    [self.completedSwitch addTarget:self action:@selector(switchChanged:) forControlEvents:UIControlEventValueChanged];
    
    [self.vinText setText:[[self.inspection valueForKey:@"vin"] stringValue]];
    [self.vinText addTarget:self action:@selector(textChanged:) forControlEvents:UIControlEventValueChanged];
    
    bindings = @{
                 [NSString stringWithFormat:@"%d",self.completedSwitch.tag] : @"completed",
                 [NSString stringWithFormat:@"%d",self.vinText.tag] : @"vin"
                 };
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)switchChanged:(id)sender {
    UISwitch *switchControl = (UISwitch *)sender;
    NSString *key = [bindings valueForKey:[NSString stringWithFormat:@"%d",switchControl.tag]];
    [self.inspection setValue:[NSNumber numberWithBool:switchControl.isOn] forKey:key];
}

- (void)textChanged:(id)sender {
    UITextField *textControl = (UITextField *)sender;
    NSString *key = [bindings valueForKey:[NSString stringWithFormat:@"%d",textControl.tag]];
    [self.inspection setValue:textControl.text forKey:key];
}

@end
