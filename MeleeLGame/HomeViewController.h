//
//  HomeViewController.h
//  MeleeLGame
//
//  Created by Jack Stenglein on 9/4/18.
//  Copyright © 2018 JackStenglein. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CharacterSquareView.h"

@interface HomeViewController : UIViewController
@property (strong, nonatomic) NSString* player1Name;
@property (strong, nonatomic) NSString* player2Name;
@property (strong, nonatomic) NSString* player3Name;
@property (strong, nonatomic) NSString* player4Name;
@property (strong, nonatomic) IBOutletCollection(CharacterSquareView) NSArray *characterSquareViews;
@property (strong, nonatomic) IBOutlet UILabel *playersLabel;
@property (strong, nonatomic) IBOutlet UILabel *recordLabel;

- (IBAction)reportGame:(id)sender;
- (IBAction)toggleTeamDisplay:(UISegmentedControl*)sender;

@end
