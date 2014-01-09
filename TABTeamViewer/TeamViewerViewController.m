//
//  TeamViewerViewController.m
//  TABTeamViewer
//
//  Created by Patrick Farrell on 09/01/2014.
//  Copyright (c) 2014 PatrickFarrell. All rights reserved.
//

#import "TeamViewerViewController.h"
#import "TABTeamLoader.h"
#import "TeamMember.h"

@interface TeamViewerViewController ()

@property (nonatomic, strong) NSArray * allTeamMembers;

@end

@implementation TeamViewerViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self populateTableData];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    NSUInteger count = [[self allTeamMembers] count];
    return count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell
    
    NSUInteger pos = [indexPath row];
    TeamMember * member = [[self allTeamMembers] objectAtIndex:pos];
    [[cell textLabel] setText:[member fullName]];
    
    return cell;
}

#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

#pragma mark - Instance Methods

- (void) populateTableData
{
    //create instance of the TABTeamLoader and load the team members and set array property
    
    TABTeamLoader * loader = [[TABTeamLoader alloc] init];
    [self setAllTeamMembers:[loader loadTABTeamMembers]];
}


@end