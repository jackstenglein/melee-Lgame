
//
//  CharacterSquareView.h
//  MeleeLGame
//
//  Created by Jack Stenglein on 9/4/18.
//  Copyright © 2018 JackStenglein. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    NotPlayed,
    GameWon,
    GameLost,
} GameResultType;

@interface CharacterSquareView : UIView
@property (strong, nonatomic) IBOutlet UIView *contentView;
@property (strong, nonatomic) IBOutlet UILabel *playerLabel;
@property (strong, nonatomic) IBOutlet UILabel *stageLabel;
@property BOOL displayTeam1;

@property (strong, nonatomic) IBInspectable NSString* characterName;
@property (strong, nonatomic) IBOutlet UILabel *characterLabel;

-(void)setTeam1Result:(GameResultType)result player:(NSString*)player stage:(NSString *)stage;
-(void)setTeam2Result:(GameResultType)result player:(NSString*)player stage:(NSString *)stage;
@end
