//
//  InspectionViewController.h
//  Inspections
//
//  Created by David Cabrera on 5/7/13.
//  Copyright (c) 2013 Rera Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetailViewController.h"

@interface InspectionViewController : UITableViewController {
    NSObject *bindings;
}

@property(strong, nonatomic) NSManagedObject *inspection;

@property(strong, nonatomic) IBOutlet UISwitch *completedSwitch;
@property(strong, nonatomic) IBOutlet UITextField *vinText;

@end
