//
//  ReportViewController.h
//  MeleeLGame
//
//  Created by Jack Stenglein on 9/5/18.
//  Copyright © 2018 JackStenglein. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ReportViewController : UIViewController
@property (strong, nonatomic) NSString* player1Name;
@property (strong, nonatomic) NSString* player2Name;
@property (strong, nonatomic) NSString* player3Name;
@property (strong, nonatomic) NSString* player4Name;
@property (strong, nonatomic) IBOutlet UILabel *player1Label;
@property (strong, nonatomic) IBOutlet UILabel *player2Label;
@property (strong, nonatomic) IBOutlet UILabel *player3Label;
@property (strong, nonatomic) IBOutlet UILabel *player4Label;
@property (strong, nonatomic) IBOutlet UIButton *player1Button;
@property (strong, nonatomic) IBOutlet UIButton *player2Button;
@property (strong, nonatomic) IBOutlet UIButton *player3Button;
@property (strong, nonatomic) IBOutlet UIButton *player4Button;
@property (strong, nonatomic) IBOutlet UIButton *stageButton;
@property (strong, nonatomic) IBOutlet UILabel *team1Label;
@property (strong, nonatomic) IBOutlet UILabel *team2Label;
@property (strong, nonatomic) IBOutlet UISwitch *winnerSwitch;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *characterSelectTop;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *characterSelectBottom;
@property (strong, nonatomic) IBOutlet UILabel *characterSelectLabel;
- (IBAction)cancelCharacterSelect:(id)sender;
- (IBAction)chooseCharacter:(UIButton*)sender;
- (IBAction)openCharacterSelect:(UIButton *)sender;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *stageSelectTop;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *stageSelectBottom;
- (IBAction)cancelStageSelect:(id)sender;
- (IBAction)chooseStage:(UIButton *)sender;
- (IBAction)openStageSelect:(UIButton *)sender;
- (IBAction)save:(id)sender;

@end
