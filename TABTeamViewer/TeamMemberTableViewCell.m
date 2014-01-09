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

//// Override drawrect to customise any drawing
//- (void) drawRect:(CGRect)rect
//{
//    [super drawRect:rect];
//    
//    CGContextRef context = UIGraphicsGetCurrentContext();
//    CGContextSetStrokeColorWithColor(context, [[UIColor darkTextColor] CGColor]);
//    
//    // Draw them with a 1.0 stroke width so they are a bit more visible.
//    CGContextSetLineWidth(context, 3.0);
//    
//    int lineStartXPos = self.bounds.origin.x + 20;
//    int lineStartYPos = self.bounds.size.height - 5;
//    int lineFinishXPos = self.bounds.size.width - 20;
//    int lineFinishYPos = lineStartYPos;
//    
//    
//    CGContextMoveToPoint(context, lineStartXPos,lineFinishYPos); //start at this point
//    
//    CGContextAddLineToPoint(context, lineFinishXPos,lineFinishYPos); //draw to this point
//    
//    // and now draw the Path!
//    CGContextStrokePath(context);
//}

@end
