//
//  Word_List.h
//  Wordsss
//
//  Created by Ren Chuan on 1/14/12.
//  Copyright (c) 2012 Ren Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class CSListWord, DotaListWord, Word;

@interface Word_List : NSManagedObject

@property (nonatomic, retain) NSNumber * id;
@property (nonatomic, retain) DotaListWord *dotaListWord;
@property (nonatomic, retain) Word *word;
@property (nonatomic, retain) CSListWord *csListWord;

@end
