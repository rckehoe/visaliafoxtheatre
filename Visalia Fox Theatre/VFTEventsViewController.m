//
//  VFTEventsViewController.m
//  Visalia Fox Theatre
//
//  Created by Robert Kehoe on 5/27/13.
//  Copyright (c) 2013 OWWS. All rights reserved.
//

#import "VFTEventsViewController.h"
#import "VFTEventCell.h"
#import "eventDetailsViewController.h"

@interface VFTEventsViewController ()

@end

@implementation VFTEventsViewController



- (id)initWithCoder:(NSCoder *)aCoder

{
    
	self = [super initWithCoder:aCoder];
    
	if (self)
        
    {
        
		// Customize the table
        
		// The className to query on
        
		self.parseClassName = @"Events";
        
		// The key of the PFObject to display in the label of the default cell style
        
		self.textKey = @"title";
        
		// Whether the built-in pull-to-refresh is enabled
        
		self.pullToRefreshEnabled = YES;
        
		// Whether the built-in pagination is enabled
        
		self.paginationEnabled = YES;
        
		// The number of objects to show per page
        
		self.objectsPerPage = 25;
        
	}
    
	return self;
    
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - Parse

- (void)objectsDidLoad:(NSError *)error
{
    
    [super objectsDidLoad:error];
    
}

- (void)objectsWillLoad
{
    
    [super objectsWillLoad];
    
}

/*
 // Override to customize what kind of query to perform on the class. The default is to query for
 // all objects ordered by createdAt descending.
 - (PFQuery *)queryForTable {
 PFQuery *query = [PFQuery queryWithClassName:self.className];
 
 // If no objects are loaded in memory, we look to the cache first to fill the table
 // and then subsequently do a query against the network.
 if ([objects count] == 0) {
 query.cachePolicy = kPFCachePolicyCacheThenNetwork;
 }
 
 [query orderByDescending:@"createdAt"];
 
 return query;
 }
 */

 // Override to customize the look of a cell representing an object. The default is to display
 // a UITableViewCellStyleDefault style cell with the label being the first key in the object.

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath object:(PFObject *)object
{
    
    static NSString *simpleTableIdentifier = @"eventCell";
    
    VFTEventCell *cell = (VFTEventCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil)
    {
        
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"EventTableCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
        
    }

    //--- Event Title
    cell.title.text = [object objectForKey:@"title"];
    
    //--- Event Date
    NSDate *date = [object objectForKey:@"date"];
    
    if(date != NULL)
    {
        
        NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"MM/dd/yyyy"];
        NSString *dateString = [dateFormatter stringFromDate:date];
        
        if(dateString.length > 0)
        {
        
            cell.date.text = dateString;
        
        }
        
    }
    else
    {
        cell.date.text = @"N/A";
    }
    
    //--- Event Image
    PFFile *eventImageFile = [object objectForKey:@"image"];
    
    if(eventImageFile != NULL)
    {
        
        PFImageView *eventImage = [[PFImageView alloc] init];
        eventImage.file = eventImageFile;
        
        [eventImage loadInBackground:^(UIImage *image, NSError *error)
        {
            
            if(!error)
            {
                
                [cell.image setImage:image];
                
            }
            
        }];
        
    }

    return cell;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 73;
}

/*
 // Override if you need to change the ordering of objects in the table.
 - (PFObject *)objectAtIndex:(NSIndexPath *)indexPath {
 return [objects objectAtIndex:indexPath.row];
 }
 */

/*
 // Override to customize the look of the cell that allows the user to load the next page of objects.
 // The default implementation is a UITableViewCellStyleDefault cell with simple labels.
 - (UITableViewCell *)tableView:(UITableView *)tableView cellForNextPageAtIndexPath:(NSIndexPath *)indexPath {
 static NSString *CellIdentifier = @"NextPage";
 
 UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
 
 if (cell == nil) {
 cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
 }
 
 cell.selectionStyle = UITableViewCellSelectionStyleNone;
 cell.textLabel.text = @"Load more...";
 
 return cell;
 }
 */

#pragma mark - Table view data source

/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
 {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
 }
 else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
 {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    PFObject *obj = [self.objects objectAtIndex:indexPath.row];
    
    eventDetailsViewController *eventsDetails = [[eventDetailsViewController alloc] init];
    
    [eventsDetails setObject:obj];
    
    [self.navigationController pushViewController:eventsDetails animated:YES];
    
}

@end
