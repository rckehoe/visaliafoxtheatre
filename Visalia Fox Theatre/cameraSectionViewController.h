//
//  cameraSectionViewController.h
//  Visalia Fox Theatre
//
//  Created by Robert Kehoe on 6/10/13.
//  Copyright (c) 2013 OWWS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface cameraSectionViewController : UIViewController<UIActionSheetDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *imagePreview;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *shareButton;

- (IBAction)newPhotoAction:(id)sender;
-(void)saveImage:(NSData *)data;
- (IBAction)shareAction:(id)sender;

@end
