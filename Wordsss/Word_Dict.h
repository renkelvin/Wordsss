//
//  Word_Dict.h
//  Wordsss
//
//  Created by Kelvin Ren on 12/21/11.
//  Copyright (c) 2011 Ren Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class McecDictWord, MwcDictWord, Word;

@interface Word_Dict : NSManagedObject

@property (nonatomic, retain) NSNumber * id;
@property (nonatomic, retain) McecDictWord *mcecDictWord;
@property (nonatomic, retain) MwcDictWord *mwcDictWord;
@property (nonatomic, retain) Word *word;

+ (Word_Dict *)entityWithId:(NSNumber *)entityId inManagedObjectContext:(NSManagedObjectContext *)context;

@end
