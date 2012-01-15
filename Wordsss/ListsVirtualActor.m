//
//  ListsVirtualActor.m
//  Wordsss
//
//  Created by Ren Chuan on 1/14/12.
//  Copyright (c) 2012 Ren Inc. All rights reserved.
//

#import "ListsVirtualActor.h"

static ListsVirtualActor* sharedListsVirtualActor = nil;

@implementation ListsVirtualActor

+ (ListsVirtualActor*)listsVirtualActor
{
    if (!sharedListsVirtualActor) {
        sharedListsVirtualActor = [[ListsVirtualActor alloc] init];
        
        [sharedListsVirtualActor prepare];
    }
    
    return sharedListsVirtualActor;
}

- (void)prepare
{
    // Get WordsssDBDataManager
    WordsssDBDataManager* wdm = [WordsssDBDataManager wordsssDBDataManager];
    
    // Get
    NSFetchRequest* request = [[NSFetchRequest alloc] initWithEntityName:@"CSListWord"];
    _array = [wdm.managedObjectContext executeFetchRequest:request error:nil];
    
//    for (CSListWord* csListWord in _array) {
//        Word_List* wl = csListWord.word_list;
//        NSString* s = csListWord.fullname;
//        NSString* t = csListWord.meaning;
//        NSString* name = wl.word.name;
//        
//        NSLog(@"%@ - %@ - %@", name, t, s);
//    }
}

@end
