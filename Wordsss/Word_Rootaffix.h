//
//  Word_Rootaffix.h
//  Wordsss
//
//  Created by Ren Chuan on 1/1/12.
//  Copyright (c) 2012 Ren Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Rootaffix, Word;

@interface Word_Rootaffix : NSManagedObject

@property (nonatomic, retain) NSNumber * id;
@property (nonatomic, retain) NSString * equation;
@property (nonatomic, retain) NSString * meaning_cn;
@property (nonatomic, retain) Rootaffix *rootaffix;
@property (nonatomic, retain) Word *word;

@end
