//
//  OweDBDAO.h
//  Owe
//
//  Created by Patrick Farrell on 08/12/2013.
//  Copyright (c) 2013 PatrickFarrellApps. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDatabaseManager.h"
#import "FMDatabaseAdditions.h"
#import "TeamMember.h"

@interface DatabaseDAO : NSObject

+ (id) sharedInstance;

@property (nonatomic, strong) FMDatabase * database;
@property (nonatomic, strong) NSString * databaseName;


- (void) openDB;
- (void) closeDB;
- (void) createTeamMemberInDB:(TeamMember *) memberToCreate;
- (int) readTeamMembersDBCount;
- (NSArray *) readAllTeamMembersFromDB;

@end
