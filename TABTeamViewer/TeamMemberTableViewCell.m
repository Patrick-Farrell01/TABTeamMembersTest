//
//  TeamMemberTableViewCell.m
//  TABTeamViewer
//
//  Created by Patrick Farrell on 09/01/2014.
//  Copyright (c) 2014 PatrickFarrell. All rights reserved.
//

#import "TeamMemberTableViewCell.h"


@implementation TeamMemberTableViewCell

// Sets up the cell with the TeamMember data model
- (void) setupWithTeamMember:(TeamMember *) teamMember
{
    [[self teamMemberNameLabel] setText:[teamMember fullName]];
    [[self jobTitleLabel] setText:[teamMember jobTitle]];
   
    [[self teamMemberImageView] setImageWithURL:[NSURL URLWithString:[teamMember imageURL]]
                   placeholderImage:[UIImage imageNamed:nil]];
    
   
    
    
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    [[[self teamMemberImageView] layer] setMasksToBounds:YES];
    [[[self teamMemberImageView] layer] setCornerRadius:40.0f];
    
//    float imageY = 4.0;
//    float heightOfImageLayer  = self.bounds.size.height - imageY*2.0;
//    heightOfImageLayer = floorf(heightOfImageLayer);
//    mImageLayer.cornerRadius = heightOfImageLayer/2.0f;
//    mImageLayer.frame = CGRectMake(4.0, imageY, heightOfImageLayer, heightOfImageLayer);
//    mCellTtleLabel.frame = CGRectMake(heightOfImageLayer+10.0, floorf(heightOfImageLayer/2.0 - (21/2.0f))+4.0, self.contentView.bounds.sizewidth-heightOfImageLayer+10.0, 21.0);
    
}

@end
