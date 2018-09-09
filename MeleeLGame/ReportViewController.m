//
//  ReportViewController.m
//  MeleeLGame
//
//  Created by Jack Stenglein on 9/5/18.
//  Copyright © 2018 JackStenglein. All rights reserved.
//

#import "ReportViewController.h"
#import "HomeViewController.h"

@interface ReportViewController ()

@end

@implementation ReportViewController {
    CGFloat screenHeight;
    UIButton* selectedButton;
    NSArray<NSString*>* characterNames;
    NSNumber* player1Character;
    NSNumber* player2Character;
    NSNumber* player3Character;
    NSNumber* player4Character;
    NSNumber* stage;
    BOOL saved;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    saved = NO;
    player1Character = player2Character = player3Character = player4Character = stage = [NSNumber numberWithInt:-1];
    [self.player1Label setText: self.player1Name];
    [self.player2Label setText: self.player2Name];
    [self.player3Label setText: self.player3Name];
    [self.player4Label setText: self.player4Name];
    [self.team1Label setText: [NSString stringWithFormat:@"%@, %@", self.player1Name, self.player2Name]];
    [self.team2Label setText: [NSString stringWithFormat:@"%@, %@", self.player3Name, self.player4Name]];
    screenHeight = [UIScreen mainScreen].bounds.size.height;
    self.characterSelectTop.constant = screenHeight;
    self.characterSelectBottom.constant = screenHeight;
    self.stageSelectTop.constant = screenHeight;
    self.stageSelectBottom.constant = screenHeight;
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
    if ([[segue identifier] isEqualToString:@"reportVCToHomeVC"] && saved) {
        HomeViewController* homeVC = [segue destinationViewController];
        BOOL team1Winner = !self.winnerSwitch.isOn;
        NSDictionary* gameReport = [NSDictionary dictionaryWithObjects:@[player1Character, player2Character, player3Character, player4Character, stage, [NSNumber numberWithBool:team1Winner]] forKeys:@[self.player1Name, self.player2Name, self.player3Name, self.player4Name, @"stage", @"winner"]];
        homeVC.gameReport = gameReport;
    }
}


- (IBAction)cancelCharacterSelect:(id)sender {
    [UIView animateWithDuration:0.3 animations:^{
        self.characterSelectTop.constant = self->screenHeight;
        self.characterSelectBottom.constant = self->screenHeight;
        [self.view layoutIfNeeded];
    }];
}

- (IBAction)chooseCharacter:(UIButton*)sender {
    [selectedButton setBackgroundImage:sender.currentBackgroundImage forState:UIControlStateNormal];
    NSNumber* selectedChararacter = [NSNumber numberWithLong: sender.tag];
    int selectedButtonIndex = (int)selectedButton.tag;
    switch(selectedButtonIndex) {
        case 0:
            player1Character = selectedChararacter;
            break;
        case 1:
            player2Character = selectedChararacter;
            break;
        case 2:
            player3Character = selectedChararacter;
            break;
        case 3:
            player4Character = selectedChararacter;
            break;
    }
    [self cancelCharacterSelect:nil];
}

- (IBAction)openCharacterSelect:(UIButton *)sender {
    selectedButton = sender;
    int selectedButtonIndex = (int)sender.tag;
    switch(selectedButtonIndex) {
        case 0:
            [self.characterSelectLabel setText:[NSString stringWithFormat:@"Choose a character for %@", self.player1Name]];
            break;
        case 1:
            [self.characterSelectLabel setText:[NSString stringWithFormat:@"Choose a character for %@", self.player2Name]];
            break;
        case 2:
            [self.characterSelectLabel setText:[NSString stringWithFormat:@"Choose a character for %@", self.player3Name]];
            break;
        case 3:
            [self.characterSelectLabel setText:[NSString stringWithFormat:@"Choose a character for %@", self.player4Name]];
            break;
    }
    [UIView animateWithDuration:0.3 animations:^{
        self.characterSelectTop.constant = 0;
        self.characterSelectBottom.constant = 0;
        [self.view layoutIfNeeded];
    }];
}

- (IBAction)cancelStageSelect:(id)sender {
    [UIView animateWithDuration:0.3 animations:^{
        self.stageSelectTop.constant = self->screenHeight;
        self.stageSelectBottom.constant = self->screenHeight;
        [self.view layoutIfNeeded];
    }];
}

- (IBAction)chooseStage:(UIButton *)sender {
    [selectedButton setBackgroundImage:sender.currentBackgroundImage forState:UIControlStateNormal];
    stage = [NSNumber numberWithLong: sender.tag];
    [self cancelStageSelect: nil];
}

- (IBAction)openStageSelect:(UIButton *)sender {
    selectedButton = sender;
    [UIView animateWithDuration:0.3 animations:^{
        self.stageSelectTop.constant = 0;
        self.stageSelectBottom.constant = 0;
        [self.view layoutIfNeeded];
    }];
}

- (IBAction)save:(id)sender {
    if (player1Character.intValue < 0 || player2Character.intValue < 0 || player3Character.intValue < 0 || player4Character.intValue < 0 || stage.intValue < 0) {
        [self showErrorAlert:@"Please choose all four characters and a stage."];
    } else if (player1Character.intValue == player2Character.intValue || player3Character.intValue == player4Character.intValue) {
        [self showErrorAlert:@"Teammates cannot play the same character. Please choose valid characters."];
    } else {
        saved = YES;
        [self performSegueWithIdentifier:@"reportVCToHomeVC" sender:nil];
    }
}

-(void)showErrorAlert:(NSString*)message {
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Error" message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction* action = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
    [alert addAction:action];
    [self presentViewController:alert animated:YES completion:nil];
}
@end
