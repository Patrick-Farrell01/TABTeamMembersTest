//
//  TABTeamLoader.m
//  TABTeamViewer
//
//  Created by Patrick Farrell on 09/01/2014.
//  Copyright (c) 2014 PatrickFarrell. All rights reserved.
//

#import "TABTeamLoader.h"
#import "TeamMember.h"
#import "TFHpple.h"

@implementation TABTeamLoader

// Loads the TAB Team Members and returns an NSArray of Team Members
- (NSArray *) loadTABTeamMembers
{
    //the array of team members that will be returned from this method
    NSMutableArray * teamMembers = [[NSMutableArray alloc] initWithCapacity:0];
    
    /*  Using the TFHpple helpers, we will parse the HTML from the site.
        It starts by looking for a particular string that is somewhere in the doc. This 
        string is what is used to identify each profile of a TAB Team Member.
     */
    
    //define the url (hardcoded but could be variable or param if desired)
    NSURL * appBusinessTeamUrl = [NSURL URLWithString:@"http://www.theappbusiness.com/our-team/"];
    
    //get the data from the address
    NSData * teamHtmlData = [NSData dataWithContentsOfURL:appBusinessTeamUrl];
    
    //create parser object from data
    TFHpple * htmlParser = [TFHpple hppleWithHTMLData:teamHtmlData];
    
    //define the NSString that surrounds the div in the HTML for each team member
    NSString * profilesXpathQueryString = @"//div[@class='col col2']";
    
    //get all the nodes (each instance where the above HTML QueryString) exists in the doc
    NSArray * teamMemberNodes = [htmlParser searchWithXPathQuery:profilesXpathQueryString];
    
    //loop through all the elements in each node and extract the TeamMember info
    for (TFHppleElement * element in teamMemberNodes)
    {
        //create TeamMember object to populate data
        TeamMember * teamMember = [[TeamMember alloc] init];
        
        //loop through each child element
        for (TFHppleElement *child in element.children)
        {
            //Test if the current child is a div.
            //In this case, if its a div, then it contains the image url for the TeamMember
            if ([child.tagName isEqualToString:@"div"])
            {
                //the child is the first div, then the first element in the children array is the
                //image url for the TeamMember.
                TFHppleElement * imageDiv = [[child children] objectAtIndex:0];
                
                NSString * imageUrl;
                
                //check the tag name of the image div is img for safety
                if([[imageDiv tagName] isEqualToString:@"img"])
                {
                    //attempt to get the url for the img. If something wrong then set url to a simple error image
                    @try
                    {
                        imageUrl = [imageDiv objectForKey:@"src"];
                    }
                    @catch (NSException *e)
                    {
                        imageUrl = @"http://us.123rf.com/400wm/400/400/arcady31/arcady311011/arcady31101100012/8157731-404-error-sign.jpg";
                    }
                }
                
                //set the ImageURL property
                [teamMember setImageURL:imageUrl];
                
            }
            else if ([child.tagName isEqualToString:@"h3"]) // else check if its a header (this is always the TeamMember name)
            {
                NSString * fullName = [[child firstChild] content];
                [teamMember setFullName:fullName];
            }
            else if ([child.tagName isEqualToString:@"p"]) // else check if its a paragraph (this is either the job title or biography)
            {
                /* There are two paragraphs for the profile. The job title is always defined first.
                   Knowing this, we can check that if the JobTitle var of the teamMember has been set or not
                   to decide which property to set.
                 */
                
                NSString * jobTitleOrBio = [[child firstChild] content];
                
                if([[teamMember jobTitle] length] == 0)
                {
                    [teamMember setJobTitle:jobTitleOrBio];
                }
                else
                {
                    [teamMember setBiography:jobTitleOrBio];
                }
                
            }
        }
        
        //add the completed TeamMember object to the MutableArray of TeamMembers
        [teamMembers addObject:teamMember];
        
    }
    
    //return with all TeamMembers on the webpage
    return [teamMembers copy];
}

@end
