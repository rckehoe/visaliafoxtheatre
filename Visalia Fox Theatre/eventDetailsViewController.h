//
//  eventDetailsViewController.h
//  Visalia Fox Theatre
//
//  Created by Robert Kehoe on 6/9/13.
//  Copyright (c) 2013 OWWS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface eventDetailsViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *eventTitle;
@property (weak, nonatomic) PFObject *object;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UIImageView *eventImage;
@property (weak, nonatomic) IBOutlet UIWebView *descriptionWebView;
- (IBAction)viewEventPhotos:(id)sender;
- (IBAction)buyTickets:(id)sender;

@end
