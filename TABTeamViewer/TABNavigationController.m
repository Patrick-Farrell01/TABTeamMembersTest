//
//  TABNavigationController.m
//  TABTeamViewer
//
//  Created by Patrick Farrell on 09/01/2014.
//  Copyright (c) 2014 PatrickFarrell. All rights reserved.
//

#import "TABNavigationController.h"
#import "TeamViewerViewController.h"

@interface TABNavigationController ()

@end

@implementation TABNavigationController


- (id)init
{
    //create the root view controller and call through to super to init everything
    TeamViewerViewController * teamViewController = [[TeamViewerViewController alloc] init];
    
    self = [super initWithRootViewController:teamViewController];
    
    if (self)
    {
        [[UINavigationBar appearance] setBarTintColor:[UIColor orangeColor]];
        //[[UINavigationBar appearance] setTranslucent:NO];
        
        [[UINavigationBar appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                                              [UIColor whiteColor],
                                                              NSForegroundColorAttributeName,
                                                              [UIFont fontWithName:@"Helvetica-Neue"
                                                                              size:21.0],NSFontAttributeName, nil]];
    }
    
    return self;
}



- (id)initWithRootViewController:(UIViewController *)rootViewController
{
    if ((self = [super initWithRootViewController:rootViewController]))
    {
        
    }
    
    return self;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return NO;
}

-(NSUInteger)supportedInterfaceOrientations
{
    return [[self topViewController] supportedInterfaceOrientations];
}

-(BOOL)shouldAutorotate
{
    return NO;
}


@end
