//
//  ReportViewController.m
//  MeleeLGame
//
//  Created by Jack Stenglein on 9/5/18.
//  Copyright © 2018 JackStenglein. All rights reserved.
//

#import "ReportViewController.h"

@interface ReportViewController ()

@end

@implementation ReportViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.player1Label setText: self.player1Name];
    [self.player2Label setText: self.player2Name];
    [self.player3Label setText: self.player3Name];
    [self.player4Label setText: self.player4Name];
    [self.team1Label setText: [NSString stringWithFormat:@"%@, %@", self.player1Name, self.player2Name]];
    [self.team2Label setText: [NSString stringWithFormat:@"%@, %@", self.player3Name, self.player4Name]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
