//
//  eventDetailsViewController.m
//  Visalia Fox Theatre
//
//  Created by Robert Kehoe on 6/9/13.
//  Copyright (c) 2013 OWWS. All rights reserved.
//

#import "eventDetailsViewController.h"

@interface eventDetailsViewController ()

@end

@implementation eventDetailsViewController

@synthesize eventTitle = _eventTitle;
@synthesize object = _object;
@synthesize dateLabel = _dateLabel;
@synthesize eventImage = _eventImage;
@synthesize descriptionWebView = _descriptionWebView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    
    [super viewDidLoad];
    
    //--- Event Title
    _eventTitle.text = [_object objectForKey:@"title"];
    
    //--- Event DescriptionNil
    NSString *eventDescription = [_object objectForKey:@"description"];
    
    if(eventDescription.length > 0)
    {
        [_descriptionWebView loadHTMLString:[_object objectForKey:@"description"] baseURL:Nil];
    }
    else
    {
        [_descriptionWebView loadHTMLString:@"There is no information for this event." baseURL:Nil];
    }
    
    //--- Date
    NSDate *date = [_object objectForKey:@"date"];
    
    if(date != NULL)
    {
        
        NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"MM/dd/yyyy"];
        NSString *dateString = [dateFormatter stringFromDate:date];
        
        if(dateString.length > 0)
        {
            
            _dateLabel.text = dateString;
            
        }
        
    }
    else
    {
        
        _dateLabel.text = @"N/A";
        
    }
    
    //--- Event Image
    PFFile *eventImageFile = [_object objectForKey:@"image"];
    
    if(eventImageFile != NULL)
    {
        
        PFImageView *eventImage = [[PFImageView alloc] init];
        eventImage.file = eventImageFile;
        
        [eventImage loadInBackground:^(UIImage *image, NSError *error)
         {
             
             if(!error)
             {
                 
                 [_eventImage setImage:image];
                 
             }
             
         }];
        
    }
    
}

- (void)didReceiveMemoryWarning
{
    
    [super didReceiveMemoryWarning];
    
}

- (IBAction)viewEventPhotos:(id)sender
{
    
    
    
}

- (IBAction)buyTickets:(id)sender
{
    
    NSString *ticketUrl = [_object objectForKey:@"ticket_link"];
    
    if(ticketUrl)
    {
        
        NSURL *ticketURL = [NSURL URLWithString:ticketUrl];
        [[UIApplication sharedApplication] openURL:ticketURL];
        
    }
    else
    {
        
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Sorry..." message:@"Tickets are not currently available for this event." delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:Nil, nil];
        [alertView show];
        
    }
    
}
@end
