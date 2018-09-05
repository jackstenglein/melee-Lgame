//
//  StartViewController.h
//  MeleeLGame
//
//  Created by Jack Stenglein on 9/5/18.
//  Copyright © 2018 JackStenglein. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StartViewController : UIViewController <UITextFieldDelegate>
@property (strong, nonatomic) IBOutlet UITextField *player1TextField;
@property (strong, nonatomic) IBOutlet UITextField *player2TextField;
@property (strong, nonatomic) IBOutlet UITextField *player3TextField;
@property (strong, nonatomic) IBOutlet UITextField *player4TextField;
@property (strong, nonatomic) IBOutlet UILabel *errorLabel;
- (IBAction)beginMatch:(id)sender;

@end
