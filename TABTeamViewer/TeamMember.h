//
//  TeamMember.h
//  TABTeamViewer
//
//  Created by Patrick Farrell on 08/01/2014.
//  Copyright (c) 2014 PatrickFarrell. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TeamMember : NSObject

@property (nonatomic, strong) NSString * fullName;
@property (nonatomic, strong) NSString * jobTitle;
@property (nonatomic, strong) NSString * biography;
@property (nonatomic, strong) NSString * imageURL;

@end
