//
//  TeamMemberViewController.h
//  TABTeamViewer
//
//  Created by Patrick Farrell on 10/01/2014.
//  Copyright (c) 2014 PatrickFarrell. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TeamMember.h"

@interface TeamMemberViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIImageView *teamMemberImageView;
@property (strong, nonatomic) IBOutlet UILabel *teamMemberNameLabel;
@property (strong, nonatomic) IBOutlet UILabel *teamMemberJobTitleLabel;
@property (strong, nonatomic) IBOutlet UITextView *teamMemberBioTextView;

- (id) initWithTeamMember:(TeamMember *) teamMember;
- (void) populateViewData;


@end
