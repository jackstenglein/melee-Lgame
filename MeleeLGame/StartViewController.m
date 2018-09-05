//
//  StartViewController.m
//  MeleeLGame
//
//  Created by Jack Stenglein on 9/5/18.
//  Copyright © 2018 JackStenglein. All rights reserved.
//

#import "StartViewController.h"
#import "HomeViewController.h"

#define HOME_SEGUE_ID @"startVCToHomeVC"

@interface StartViewController ()

@end

@implementation StartViewController {
    NSString* player1Name;
    NSString* player2Name;
    NSString* player3Name;
    NSString* player4Name;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([[segue identifier] isEqualToString:HOME_SEGUE_ID]) {
        HomeViewController* homeVC = [segue destinationViewController];
        [homeVC setPlayer1Name: player1Name];
        [homeVC setPlayer2Name: player2Name];
        [homeVC setPlayer3Name: player3Name];
        [homeVC setPlayer4Name: player4Name];
    }
}


-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return NO;
}

- (IBAction)beginMatch:(id)sender {
    player1Name = [self.player1TextField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    player2Name = [self.player2TextField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    player3Name = [self.player3TextField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    player4Name = [self.player4TextField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    if (player1Name.length > 0 && player2Name.length > 0 && player3Name.length > 0 && player4Name.length > 0) {
        [self performSegueWithIdentifier:HOME_SEGUE_ID sender:nil];
    } else {
        [self.errorLabel setText: @"Please enter all four players' names"];
    }
}
@end
