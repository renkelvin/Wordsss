//
//  TBBTListELViewController.h
//  Wordsss
//
//  Created by Ren Chuan on 7/12/12.
//  Copyright (c) 2012 Ren Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "List.h"

@interface TBBTListELViewController : UIViewController <UINavigationControllerDelegate, UITableViewDelegate, UITableViewDataSource>
{
    NSNumber* _seasonNum;
}

#pragma mark - Instance method

- (TBBTListELViewController*)initWithSeasonNum:(NSNumber*)seasonNum;

@end
