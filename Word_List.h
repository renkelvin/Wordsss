//
//  Word_List.h
//  Wordsss
//
//  Created by Kelvin Ren on 12/11/11.
//  Copyright (c) 2011 Ren Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Word;

@interface Word_List : NSManagedObject

@property (nonatomic, retain) NSNumber * id;
@property (nonatomic, retain) NSManagedObject *dotaListWord;
@property (nonatomic, retain) Word *word;

@end
