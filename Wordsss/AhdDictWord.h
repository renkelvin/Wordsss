//
//  AhdDictWord.h
//  Wordsss
//
//  Created by Ren Chuan on 12/27/11.
//  Copyright (c) 2011 Ren Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

#import "DictWordCell.h"

#import "AhdDictMeaning.h"

@class Word_Dict;

@interface AhdDictWord : NSManagedObject

@property (nonatomic, retain) NSNumber * id;
@property (nonatomic, retain) NSNumber * type;
@property (nonatomic, retain) NSMutableSet *meaning;
@property (nonatomic, retain) Word_Dict *word_dict;
@end

@interface AhdDictWord (CoreDataGeneratedAccessors)

- (void)addMeaningObject:(NSManagedObject *)value;
- (void)removeMeaningObject:(NSManagedObject *)value;
- (void)addMeaning:(NSSet *)values;
- (void)removeMeaning:(NSSet *)values;

- (void)configCell:(DictWordCell*)cell;

- (NSString*)getTypeString;
- (NSString*)getBriefMeaning;
- (NSString*)getFullMeaningCN;

@end
