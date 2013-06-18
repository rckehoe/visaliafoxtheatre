//
//  VFTEventCell.m
//  Visalia Fox Theatre
//
//  Created by Robert Kehoe on 5/27/13.
//  Copyright (c) 2013 OWWS. All rights reserved.
//

#import "VFTEventCell.h"

@implementation VFTEventCell
@synthesize image = _image;
@synthesize title = _title;
@synthesize date = _date;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self)
    {
        
    }
    
    return self;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    
    [super setSelected:selected animated:animated];
    
}

@end
