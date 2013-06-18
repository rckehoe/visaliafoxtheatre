//
//  VFTEventCell.h
//  Visalia Fox Theatre
//
//  Created by Robert Kehoe on 5/27/13.
//  Copyright (c) 2013 OWWS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VFTEventCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *date;

@end
