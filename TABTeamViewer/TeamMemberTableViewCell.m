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

// Override the layout subviews for cusomisation
-(void)layoutSubviews
{
    [super layoutSubviews];
    
    //make team members images into circles
    [[[self teamMemberImageView] layer] setMasksToBounds:YES];
    [[[self teamMemberImageView] layer] setCornerRadius:40.0f];

}

@end
