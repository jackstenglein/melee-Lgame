//
//  HomeViewController.m
//  MeleeLGame
//
//  Created by Jack Stenglein on 9/4/18.
//  Copyright © 2018 JackStenglein. All rights reserved.
//

#import "HomeViewController.h"
#import "ReportViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController {
    int team1Wins;
    int team2Wins;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    team1Wins = 0;
    team2Wins = 0;
    [self.playersLabel setText: [NSString stringWithFormat:@"%@, %@", self.player1Name, self.player2Name]];
    [self.recordLabel setText: [NSString stringWithFormat:@"%d-%d", team1Wins, team2Wins]];
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
    if ([[segue identifier] isEqualToString:@"homeVCToReportVC"]) {
        ReportViewController* reportVC = [segue destinationViewController];
        [reportVC setPlayer1Name: self.player1Name];
        [reportVC setPlayer2Name: self.player2Name];
        [reportVC setPlayer3Name: self.player3Name];
        [reportVC setPlayer4Name: self.player4Name];
    }
}


- (IBAction)reportGame:(id)sender {
    [self.characterSquareViews[0] setTeam1Result:GameWon player:@"Jack" stage:@"FD"];
    [self.characterSquareViews[15] setTeam1Result:GameWon player:@"Ruan" stage:@"FD"];
    [self.characterSquareViews[13] setTeam2Result:GameLost player:@"Noah" stage:@"FD"];
    [self.characterSquareViews[22] setTeam2Result:GameLost player:@"William" stage:@"FD"];
}

- (IBAction)toggleTeamDisplay:(UISegmentedControl*)sender {
    BOOL displayTeam1 = (sender.selectedSegmentIndex == 0);
    for (CharacterSquareView* characterSquareView in self.characterSquareViews) {
        [characterSquareView setDisplayTeam1:displayTeam1];
        [characterSquareView setNeedsDisplay];
    }
    
    if (displayTeam1) {
        [self.playersLabel setText: [NSString stringWithFormat:@"%@, %@", self.player1Name, self.player2Name]];
        [self.recordLabel setText: [NSString stringWithFormat:@"%d-%d", team1Wins, team2Wins]];
    } else {
        [self.playersLabel setText: [NSString stringWithFormat:@"%@, %@", self.player3Name, self.player4Name]];
        [self.recordLabel setText: [NSString stringWithFormat:@"%d-%d", team2Wins, team1Wins]];
    }
}
@end
