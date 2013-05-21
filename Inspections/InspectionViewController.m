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
    
    [self.vinText setText:[[self.inspection valueForKey:@"vehicleNumber"] stringValue]];
    [self.vinText addTarget:self action:@selector(textChanged:) forControlEvents:UIControlEventValueChanged];
    
    bindings = @{
                 @(self.completedSwitch.tag) : @"completed",
                 @(self.vinText.tag) : @"vehicleNumber"
                 };
    
    [self.inspectionTypeSegmentedControl addTarget:self action:@selector(typeChanged:) forControlEvents:UIControlEventValueChanged];
}

- (void)viewWillDisappear:(BOOL)animated {

    //********************* COMMIT CHANGES *********************//
    
    for (NSNumber *key in bindings) {
        NSString *title = [bindings objectForKey:key];
        id control = [self.view viewWithTag:[key intValue]];
        
        NSLog(@"%@ -> %@ -> %@",key,title,[[control class] description]);
        
        if([control isKindOfClass:[UITextField class]]) {
            UITextField *textControl = (UITextField*)control;
            [self.inspection setValue:textControl.text forKey:title];
        }
        else if([control isKindOfClass:[UISwitch class]]) {
            UISwitch *switchControl = (UISwitch*)control;
            [self.inspection setValue:@(switchControl.isOn) forKey:title];
        }
        else if([control isKindOfClass:[UISegmentedControl class]]) {
            UISegmentedControl *segmentedControl = (UISegmentedControl*)control;
            [self.inspection setValue:@(segmentedControl.selectedSegmentIndex) forKey:title];
        }
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSString *segueName = segue.identifier;
    if ([segueName isEqualToString: @"oilchange_embed"]) {
        OilChangeInspectionViewController *child = (OilChangeInspectionViewController *) [segue destinationViewController];
        child.inspection = self.inspection;
    }
    if ([segueName isEqualToString: @"safety_embed"]) {
        SafetyInspectionChecklistViewController *child = (SafetyInspectionChecklistViewController *) [segue destinationViewController];
        child.inspection = self.inspection;
    }
    if ([segueName isEqualToString: @"trailersafety_embed"]) {
        TrailerSafetyInspectionViewController *child = (TrailerSafetyInspectionViewController *) [segue destinationViewController];
        child.inspection = self.inspection;
    }
}

- (void)typeChanged:(id)sender {
    UISegmentedControl *chooser = (UISegmentedControl*)sender;
    
    self.oilChangeContainerView.hidden = YES;
    self.safetyContainerView.hidden = YES;
    self.trailerSafetyContainerView.hidden = YES;
    
    switch (chooser.selectedSegmentIndex) {
        case 0:
            self.oilChangeContainerView.hidden = NO;
            break;
        case 1:
            self.safetyContainerView.hidden = NO;
            break;
        case 2:
        default:
            self.trailerSafetyContainerView.hidden = NO;
            break;
    }
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
