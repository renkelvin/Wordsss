//
//  Word_Dict.h
//  Wordsss
//
//  Created by Kelvin Ren on 12/11/11.
//  Copyright (c) 2011 Ren Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Word;

@interface Word_Dict : NSManagedObject

@property (nonatomic, retain) NSNumber * id;
@property (nonatomic, retain) Word *word;
@property (nonatomic, retain) NSManagedObject *mcecDictWord;
@property (nonatomic, retain) NSManagedObject *mwcDictWord;

@end
