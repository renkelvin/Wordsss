//
//  MwcDictWord.h
//  Wordsss
//
//  Created by Kelvin Ren on 12/11/11.
//  Copyright (c) 2011 Ren Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Word_Dict;

@interface MwcDictWord : NSManagedObject

@property (nonatomic, retain) Word_Dict *word_dict;

@end
