//
//  LoginTableViewController.m
//  LockFoo
//
//  Created by Wayne Cochran on 6/10/14.
//  Copyright (c) 2014 WSUV. All rights reserved.
//

#import "LoginTableViewController.h"
#import "AppDelegate.h"

@interface LoginTableViewController ()

@end

@implementation LoginTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.usernameTextField becomeFirstResponder];
}

// STATIC CELLS

- (IBAction)login:(id)sender {
    
    NSString *username = [self.usernameTextField text];
    NSString *password = [self.passwordTextfield text];
    
    NSLog(@"login: username=%@, password=%@", username, password);
    
    if ([username isEqualToString:@"foo"] && [password isEqualToString:@"bar"]) {
        AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
        appDelegate.userLoggedIn = YES;
        [self dismissViewControllerAnimated:YES completion:^{
            if ([self.loginDelegate respondsToSelector:@selector(didLogin)]) {
                [self.loginDelegate didLogin];
            }
        }];
    } else {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Bogus User/Password"
                                                        message:@"Username and/or password incorrect"
                                                       delegate:nil
                                              cancelButtonTitle:@"Retry" otherButtonTitles:nil];
        [alert show];
    }
}

@end
