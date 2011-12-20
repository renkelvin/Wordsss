//
//  McecDictWord.h
//  Wordsss
//
//  Created by Kelvin Ren on 12/21/11.
//  Copyright (c) 2011 Ren Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class McecDictMeaning, Word_Dict;

@interface McecDictWord : NSManagedObject

@property (nonatomic, retain) NSNumber * id;
@property (nonatomic, retain) NSSet *meaning;
@property (nonatomic, retain) Word_Dict *word_dict;
@end

@interface McecDictWord (CoreDataGeneratedAccessors)

- (void)addMeaningObject:(McecDictMeaning *)value;
- (void)removeMeaningObject:(McecDictMeaning *)value;
- (void)addMeaning:(NSSet *)values;
- (void)removeMeaning:(NSSet *)values;

+ (McecDictWord *)wordWithId:(NSNumber *)wordId inManagedObjectContext:(NSManagedObjectContext *)context;

@end
