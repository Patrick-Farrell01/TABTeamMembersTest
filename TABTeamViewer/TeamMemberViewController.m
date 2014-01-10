//
//  TeamMemberViewController.m
//  TABTeamViewer
//
//  Created by Patrick Farrell on 10/01/2014.
//  Copyright (c) 2014 PatrickFarrell. All rights reserved.
//

#import "TeamMemberViewController.h"
#import "UIImageView+WebCache.h"

@interface TeamMemberViewController ()

@property (nonatomic, strong) TeamMember * teamMember;

@end

@implementation TeamMemberViewController

- (id) initWithTeamMember:(TeamMember *) teamMember
{
    self = [super initWithNibName:nil bundle:nil];
    
    if(self)
    {
        [self setTeamMember:teamMember];
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Do any additional setup after loading the view from its nib.
    [self populateViewData];
    
    //make team members images into circle
    [[[self teamMemberImageView] layer] setMasksToBounds:YES];
    [[[self teamMemberImageView] layer] setCornerRadius:40.0f];

}

// Populates the View's data
- (void) populateViewData
{
    //get the fullname property
    NSString * fullName = [[self teamMember] fullName];
    
    //make a substring to get the first name only
    NSArray * substringArray = [fullName componentsSeparatedByString:@" "];
    
    //set the title in navbar to first name which is first element in substring array
    [self setTitle:[substringArray objectAtIndex:0]];
    

    //set subview properties
    [[self teamMemberNameLabel] setText:fullName];
    [[self teamMemberJobTitleLabel] setText:[[self teamMember] jobTitle]];
    
    [[self teamMemberImageView] setImageWithURL:[NSURL URLWithString:[[self teamMember] imageURL]]
                               placeholderImage:[UIImage imageNamed:nil]];
    
    [[self teamMemberBioTextView] setText:[[self teamMember] biography]];
}


@end
