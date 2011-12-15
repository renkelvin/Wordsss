//
//  McecDictWord.h
//  Wordsss
//
//  Created by Kelvin Ren on 12/11/11.
//  Copyright (c) 2011 Ren Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class McecDictWordMeaning, Word_Dict;

@interface McecDictWord : NSManagedObject

@property (nonatomic, retain) NSNumber *id;
@property (nonatomic, retain) Word_Dict *word_dict;
@property (nonatomic, retain) NSSet *meaning;
@end

@interface McecDictWord (CoreDataGeneratedAccessors)

- (void)addMeaningObject:(McecDictWordMeaning *)value;
- (void)removeMeaningObject:(McecDictWordMeaning *)value;
- (void)addMeaning:(NSSet *)values;
- (void)removeMeaning:(NSSet *)values;

@end
