//
//  DetailViewController.h
//  Inspections
//
//  Created by David Cabrera on 5/7/13.
//  Copyright (c) 2013 Rera Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController <UISplitViewControllerDelegate>

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
