//
//  cameraSectionViewController.m
//  Visalia Fox Theatre
//
//  Created by Robert Kehoe on 6/10/13.
//  Copyright (c) 2013 OWWS. All rights reserved.
//

#import "cameraSectionViewController.h"

@interface cameraSectionViewController ()

@end

@implementation cameraSectionViewController

@synthesize imagePreview = _imagePreview;
@synthesize shareButton = _shareButton;

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
    
    [self newPhotoAction:Nil];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    
    UIImage *image = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
    
    [self dismissViewControllerAnimated:YES completion:Nil];
    
    // Resize image
    UIGraphicsBeginImageContext(CGSizeMake(640, 960));
    [image drawInRect: CGRectMake(0, 0, 640, 960)];
    // UIImage *smallImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    // Upload image
    NSData *imageData = UIImageJPEGRepresentation(image, 0.05f);
    
    [self saveImage:imageData];
    
}

- (IBAction)newPhotoAction:(id)sender
{
    
    if ([UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypeCamera] == YES)
    {
        
        UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
        
        imagePicker.sourceType =  UIImagePickerControllerSourceTypeCamera;
        
        [self presentViewController:imagePicker animated:YES completion:Nil];
        
    }
    else
    {
        
        //--- Device has no camera
        UIImage *image;
        int r = arc4random() % 4;
        
        switch (r)
        {
            case 0:
                image = [UIImage imageNamed:@"Crowd.jpg"];
                break;
            case 1:
                image = [UIImage imageNamed:@"Desert.jpg"];
                break;
            case 2:
                image = [UIImage imageNamed:@"Lime.jpg"];
                break;
            case 3:
                image = [UIImage imageNamed:@"Sunflowers.jpg"];
                break;
            default:
                break;
        }
        
        // Resize image
        UIGraphicsBeginImageContext(CGSizeMake(640, 960));
        [image drawInRect: CGRectMake(0, 0, 640, 960)];
        // UIImage *smallImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        NSData *imageData = UIImageJPEGRepresentation(image, 0.05f);
        [self saveImage:imageData];
        
    }
    
}


-(void)saveImage:(NSData *)data
{
    
    UIImage *image = [[UIImage alloc] initWithData:data];
    
    [_imagePreview setImage:image];
    
    [_shareButton setEnabled:YES];
    
}

- (IBAction)shareAction:(id)sender
{
    
    /*
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"Save + Share" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:Nil otherButtonTitles:@"Share on Facebook", @"Share on Twitter", nil];
    
    [actionSheet showFromBarButtonItem:_shareButton animated:YES];
     
    
    // Create the item to share (in this example, a url)
	NSURL *url = [NSURL URLWithString:@"http://getsharekit.com"];
	//SHKItem *item = [SHKItem URL:url title:@"ShareKit is Awesome!"];
    SHKItem *item = [SHKItem URL:url title:@"ShareKit" contentType:Nil];
    
	// Get the ShareKit action sheet
	SHKActionSheet *actionSheet = [SHKActionSheet actionSheetForItem:item];
    
	// Display the action sheet
	[actionSheet showFromBarButtonItem:_shareButton animated:YES];
     */
    
}

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    
    switch(buttonIndex)
    {
        case 0:
            NSLog(@"Facebook clicked");
            break;
            
        case 1:
            NSLog(@"Twitter clicked");
            break;
            
        default:
            NSLog(@"Nothing...");
            break;
    }
    
}

@end
