//
//  RkNavigationController.h
//  Wordsss
//
//  Created by RenKelvin on 11-10-4.
//  Copyright 2011年 Ren Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RKNavigationController : UINavigationController <UINavigationControllerDelegate>
{
    UIView *customNavigationbBarView;
}

@property (nonatomic, retain) IBOutlet UIButton* leftButton;
@property (nonatomic, retain) IBOutlet UILabel* titleLabel;
@property (nonatomic, retain) IBOutlet UIImageView* titleImageView;
@property (nonatomic, retain) IBOutlet UIButton* rightButton;

- (void)hideBuiltinNavigationBar;
- (void)showCustomNavigationBar;

- (void)setLeftButtonText:(NSString*)text image:(UIImage*)image;
- (void)setTitleLabelText:(NSString*)text;
- (void)setTitleImageViewImage:(UIImage*)image;
- (void)setTitleText:(NSString*)text image:(UIImage*)image;
- (void)setRightButtonText:(NSString*)text image:(UIImage*)image;

- (IBAction)leftButtonDown:(id)sender;
- (IBAction)rigntButtonDown:(id)sender;

@end
