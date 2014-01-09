//
//  TeamMemberTableViewCell.h
//  TABTeamViewer
//
//  Created by Patrick Farrell on 09/01/2014.
//  Copyright (c) 2014 PatrickFarrell. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TeamMember.h"
#import "UIImageView+WebCache.h"

@interface TeamMemberTableViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UIImageView *teamMemberImageView;
@property (strong, nonatomic) IBOutlet UILabel *teamMemberNameLabel;
@property (strong, nonatomic) IBOutlet UILabel *jobTitleLabel;

- (void) setupWithTeamMember:(TeamMember *) teamMember;

@end
