//
//  Word_Association.h
//  Wordsss
//
//  Created by Ren Chuan on 12/29/11.
//  Copyright (c) 2011 Ren Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Association, Word;

@interface Word_Association : NSManagedObject

@property (nonatomic, retain) NSNumber * id;
@property (nonatomic, retain) NSString * meaning_cn;
@property (nonatomic, retain) Association *association;
@property (nonatomic, retain) Word *word;

@end
