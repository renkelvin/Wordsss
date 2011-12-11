//
//  Rootaffix.h
//  Wordsss
//
//  Created by Kelvin Ren on 12/11/11.
//  Copyright (c) 2011 Ren Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Word;

@interface Rootaffix : NSManagedObject

@property (nonatomic, retain) NSNumber * id;
@property (nonatomic, retain) NSString * phrase;
@property (nonatomic, retain) NSString * deformation;
@property (nonatomic, retain) NSNumber * type;
@property (nonatomic, retain) NSString * origin;
@property (nonatomic, retain) NSString * meaning_cn;
@property (nonatomic, retain) NSString * meaning_en;
@property (nonatomic, retain) NSString * description_cn;
@property (nonatomic, retain) NSString * description_en;
@property (nonatomic, retain) NSSet *word;
@end

@interface Rootaffix (CoreDataGeneratedAccessors)

- (void)addWordObject:(Word *)value;
- (void)removeWordObject:(Word *)value;
- (void)addWord:(NSSet *)values;
- (void)removeWord:(NSSet *)values;

@end
