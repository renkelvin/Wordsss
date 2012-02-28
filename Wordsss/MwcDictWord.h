//
//  MwcDictWord.h
//  Wordsss
//
//  Created by Ren Chuan on 2/20/12.
//  Copyright (c) 2012 Ren Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class MwcDictMeaning, Word_Dict;

@interface MwcDictWord : NSManagedObject

@property (nonatomic, retain) NSNumber * id;
@property (nonatomic, retain) NSString * etymology;
@property (nonatomic, retain) NSString * function;
@property (nonatomic, retain) NSString * inflectform;
@property (nonatomic, retain) NSString * date;
@property (nonatomic, retain) NSMutableSet *meaning;
@property (nonatomic, retain) Word_Dict *word_dict;
@end

@interface MwcDictWord (CoreDataGeneratedAccessors)

- (void)addMeaningObject:(MwcDictMeaning *)value;
- (void)removeMeaningObject:(MwcDictMeaning *)value;
- (void)addMeaning:(NSSet *)values;
- (void)removeMeaning:(NSSet *)values;

- (NSString*)getFunction;
- (NSString*)getMeaningEN;
- (NSString*)getFullMeaningEN;

@end
