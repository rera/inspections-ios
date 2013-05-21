//
//  InspectionViewController.h
//  Inspections
//
//  Created by David Cabrera on 5/7/13.
//  Copyright (c) 2013 Rera Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetailViewController.h"
#import "OilChangeInspectionViewController.h"
#import "SafetyInspectionChecklistViewController.h"
#import "TrailerSafetyInspectionViewController.h"

@interface InspectionViewController : UITableViewController {
    NSDictionary *bindings;
    int numberOfPages;
    bool pageControlUsed;
}

@property(strong, nonatomic) NSManagedObject *inspection;

@property(strong, nonatomic) IBOutlet UISegmentedControl *inspectionTypeSegmentedControl;

@property(strong, nonatomic) IBOutlet OilChangeInspectionViewController *oilChangeInspectionViewController;
@property(strong, nonatomic) IBOutlet UIView *oilChangeContainerView;
@property(strong, nonatomic) IBOutlet SafetyInspectionChecklistViewController *safetyInspectionChecklistViewController;
@property(strong, nonatomic) IBOutlet UIView *safetyContainerView;
@property(strong, nonatomic) IBOutlet TrailerSafetyInspectionViewController *trailerSafetyInspectionViewController;
@property(strong, nonatomic) IBOutlet UIView *trailerSafetyContainerView;


@property(strong, nonatomic) IBOutlet UISwitch *completedSwitch;
@property(strong, nonatomic) IBOutlet UITextField *vinText;

@end
