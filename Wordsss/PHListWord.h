//
//  PHListWord.h
//  Wordsss
//
//  Created by Ren Chuan on 1/16/12.
//  Copyright (c) 2012 Ren Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Word_List;

@interface PHListWord : NSManagedObject

@property (nonatomic, retain) NSNumber * id;
@property (nonatomic, retain) NSString * meaning;
@property (nonatomic, retain) Word_List *word_list;

@end
