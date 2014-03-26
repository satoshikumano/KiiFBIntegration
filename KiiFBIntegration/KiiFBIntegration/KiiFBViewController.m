//
//  KiiFBViewController.m
//  KiiFBIntegration
//
//  Created by 熊野 聡 on 2014/03/26.
//  Copyright (c) 2014年 Kii. All rights reserved.
//

#import "KiiFBViewController.h"
#import "Const.h"
#import <KiiSDK/Kii.h>

@interface KiiFBViewController ()

@end

@implementation KiiFBViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onFBClicked:(id)sender {
    [KiiSocialConnect setupNetwork:kiiSCNFacebook withKey:kMyFBAppId andSecret:nil andOptions:nil];
    [KiiSocialConnect logIn:kiiSCNFacebook usingOptions:nil withDelegate:self andCallback:@selector(socialCallback:usingNetwork:withError:)];
}

- (void) socialCallback:(KiiUser*) user
           usingNetwork:(KiiSocialNetworkName) network
              withError:(NSError *)error {
    if (error != nil) {
        NSLog(@"Error: %@", error.description);
        return;
    }
    
    [user refreshWithBlock:^(KiiUser *user, NSError *error) {
        if (error != nil) {
            NSLog(@"Error: %@", error.description);
            return;
        }
        NSString *name = [KiiUser currentUser].displayName;
        NSLog(@"Disp Name: %@", name);
    }];
}

@end
