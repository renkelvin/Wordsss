//
//  DotaListWord.h
//  Wordsss
//
//  Created by Kelvin Ren on 12/21/11.
//  Copyright (c) 2011 Ren Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Word_List;

@interface DotaListWord : NSManagedObject

@property (nonatomic, retain) Word_List *word_list;

@end
