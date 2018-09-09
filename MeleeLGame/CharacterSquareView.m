//
//  CharacterSquareView.m
//  MeleeLGame
//
//  Created by Jack Stenglein on 9/4/18.
//  Copyright © 2018 JackStenglein. All rights reserved.
//

#import "CharacterSquareView.h"

@implementation CharacterSquareView {
    NSString* team1Stage;
    NSString* team2Stage;
    NSString* team1Player;
    NSString* team2Player;
    int team1Game;
    int team2Game;
    GameResultType team1Result;
    GameResultType team2Result;
}

+(UIColor*)winColor {
    return [UIColor colorWithRed:0 green:170.0/255 blue:0 alpha:1.0];
}

-(instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self customInit];
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self customInit];
    }
    return self;
}

-(void)customInit {
    [[NSBundle mainBundle] loadNibNamed:@"CharacterSquare" owner:self options:nil];
    [self addSubview:self.contentView];
    self.contentView.frame = self.bounds;
    self.contentView.layer.borderWidth = 1.5f;
    self.contentView.layer.borderColor = [UIColor blackColor].CGColor;
    self.displayTeam1 = YES;
    self.characterLabel.layer.borderColor = [UIColor whiteColor].CGColor;
    self.characterLabel.layer.borderWidth = 1.5f;
}

-(void)setTeam1Result:(GameResultType)result player:(NSString*)player stage:(NSString *)stage gameNumber:(int)game {
    team1Result = result;
    team1Player = player;
    team1Stage = stage;
    team1Game = game;
    [self setNeedsDisplay];
}

-(void)setTeam2Result:(GameResultType)result player:(NSString*)player stage:(NSString *)stage gameNumber:(int)game {
    team2Result = result;
    team2Player = player;
    team2Stage = stage;
    team2Game = game;
    [self setNeedsDisplay];
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    [self.characterLabel setText: self.characterName];
    NSString* playerName = nil;
    NSString* stageName = nil;
    int game;
    UIColor* backgroundColor = [UIColor whiteColor];
    UIColor* borderColor = [UIColor blackColor];
    
    if (self.displayTeam1) {
        playerName = team1Player;
        stageName = team1Stage;
        game = team1Game;
        switch (team1Result) {
            case GameWon:
                backgroundColor = [CharacterSquareView winColor];
                borderColor = [CharacterSquareView winColor];
                break;
            case GameLost:
                backgroundColor = [UIColor redColor];
                borderColor = [UIColor redColor];
            default:
                break;
        }
    } else {
        playerName = team2Player;
        stageName = team2Stage;
        game = team2Game;
        switch (team2Result) {
            case GameWon:
                backgroundColor = [CharacterSquareView winColor];
                borderColor = [CharacterSquareView winColor];
                break;
            case GameLost:
                backgroundColor = [UIColor redColor];
                borderColor = [UIColor redColor];
            default:
                break;
        }
    }
    
    [self.playerLabel setText: playerName];
    [self.stageLabel setText: stageName];
    [self.gameNumberLabel setText: [NSString stringWithFormat:@"%d", game]];
    self.contentView.layer.borderColor = borderColor.CGColor;
    [self.contentView setBackgroundColor: backgroundColor];
    [self.characterLabel setBackgroundColor: borderColor];
}


@end
