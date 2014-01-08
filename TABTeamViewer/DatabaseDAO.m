//
//  OweDBDAO.m
//  Owe
//
//  Created by Patrick Farrell on 08/12/2013.
//  Copyright (c) 2013 PatrickFarrellApps. All rights reserved.
//

#import "DatabaseDAO.h"

@implementation DatabaseDAO
@synthesize database, databaseName;


#pragma mark Class Access

// Return singleton object of the OweDAO object
+(DatabaseDAO *) sharedInstance
{
    static dispatch_once_t pred;
    static DatabaseDAO * shared = nil;
    
    dispatch_once(&pred, ^{
        shared = [[DatabaseDAO alloc] init];
    });
    
    return shared;
}

#pragma Instance Methods

// Override Init for customisation
- (id)init
{
    self = [super init];
    if (self)
    {
        [self setDatabaseName:@"interview.db"];
    }
    return self;
}

// Opens the database for interaction
- (void) openDB
{
    [self setDatabase:[[FMDatabaseManager sharedInstance] openDb:[self databaseName]]];
}

// Closes the database for interaction
- (void) closeDB
{
    [[self database] close];
}


#pragma mark Create 

- (void) createTeamMemberInDB:(TeamMember *) memberToCreate;
{
    NSString * insert = @"INSERT INTO TeamMembers";
    NSString * values = @"(Name, JobTitle, Biography, ImageURL) VALUES (?,?,?,?)";
    
    NSString * sql = [insert stringByAppendingString:values];
    
    if([self database] != NULL)
    {
        [[self database] executeUpdate:sql,
         [memberToCreate fullName],
         [memberToCreate jobTitle],
         [memberToCreate biography],
         [memberToCreate imageURL]];
    }

}

#pragma Read

// Reads the DB and returns the number of records in the Team Members table
- (int) readTeamMembersDBCount
{
    int rowCount = 0;
    
    if([self database] != NULL)
    {
        rowCount = [[self database] intForQuery:@"SELECT COUNT(Name) FROM TeamMembers"];
    }
    
    return rowCount;
}

// Read all the Team Members from DB
- (NSArray *) readAllTeamMembersFromDB
{
    //build array of users that have a friend ID that match the current users id
    NSMutableArray * members = [[NSMutableArray alloc] init];
    
    if([self database] != NULL)
    {
        //construct sql and build resutls set
        NSString * sql = @"SELECT * FROM TeamMembers";
        FMResultSet *results = [[self database] executeQuery:sql];
        
        while([results next])
        {
            TeamMember * teamMember = [[TeamMember alloc] init];
            
            [teamMember setFullName:[results stringForColumn:@"Name"]];
            [teamMember setJobTitle:[results stringForColumn:@"JobTitle"]];
            [teamMember setBiography:[results stringForColumn:@"Biography"]];
            [teamMember setImageURL:[results stringForColumn:@"ImageURL"]];
            
            [members addObject:teamMember];
        }
    }
    
    return [members copy];
}

#pragma Update


#pragma Delete


@end
