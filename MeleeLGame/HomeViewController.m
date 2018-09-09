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
    NSArray* stageNames;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    team1Wins = 0;
    team2Wins = 0;
    [self.playersLabel setText: [NSString stringWithFormat:@"%@, %@", self.player1Name, self.player2Name]];
    [self.recordLabel setText: [NSString stringWithFormat:@"%d-%d", team1Wins, team2Wins]];
    stageNames = [NSArray arrayWithObjects:@"Yoshi's Story",@"Pokemon Stadium",@"Battlefield",@"Final Destination",@"Dreamland", nil];
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
        self.gameReport = nil;
    }
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

-(IBAction)unwindFromReportVC:(UIStoryboardSegue*)segue {
    NSLog(@"Report Dictionary: %@", self.gameReport);
    if (self.gameReport != nil) {
        BOOL team1Won = [self.gameReport[@"winner"] boolValue];
        GameResultType team1Result = team1Won ? GameWon : GameLost;
        GameResultType team2Result = team1Won ? GameLost : GameWon;
        NSString* stage = stageNames[[self.gameReport[@"stage"] intValue]];
        [self.characterSquareViews[[self.gameReport[self.player1Name] intValue]] setTeam1Result:team1Result player:self.player1Name stage:stage];
        [self.characterSquareViews[[self.gameReport[self.player2Name] intValue]] setTeam1Result:team1Result player:self.player2Name stage:stage];
        [self.characterSquareViews[[self.gameReport[self.player3Name] intValue]] setTeam2Result:team2Result player:self.player3Name stage:stage];
        [self.characterSquareViews[[self.gameReport[self.player4Name] intValue]] setTeam2Result:team2Result player:self.player4Name stage:stage];
    }
    
}
@end
