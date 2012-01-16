//
//  Word_List.h
//  Wordsss
//
//  Created by Ren Chuan on 1/16/12.
//  Copyright (c) 2012 Ren Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class CSListWord, DotaListWord, MAListWord, PHListWord, Word;

@interface Word_List : NSManagedObject

@property (nonatomic, retain) NSNumber * id;
@property (nonatomic, retain) CSListWord *csListWord;
@property (nonatomic, retain) DotaListWord *dotaListWord;
@property (nonatomic, retain) Word *word;
@property (nonatomic, retain) MAListWord *maListWord;
@property (nonatomic, retain) PHListWord *phListWord;

@end
