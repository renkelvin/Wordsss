//
//  MwcDictMeaning.h
//  Wordsss
//
//  Created by Ren Chuan on 2/20/12.
//  Copyright (c) 2012 Ren Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class MwcDictWord;

@interface MwcDictMeaning : NSManagedObject

@property (nonatomic, retain) NSNumber * id;
@property (nonatomic, retain) NSString * meaning_en;
@property (nonatomic, retain) MwcDictWord *mwcDictWord;

@end
