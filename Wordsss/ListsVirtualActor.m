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
    NSFetchRequest* request = [[NSFetchRequest alloc] initWithEntityName:@"List"];
    NSArray* array = [wdm.managedObjectContext executeFetchRequest:request error:nil];
    
    _listDictionary = [NSMutableDictionary dictionary];
    for (List* list in array) {
        [_listDictionary setValue:list forKey:list.name];
    }
}

- (NSDictionary*)getListDictionary;
{
    if (!_listDictionary) {
        [self prepare];
    }
    
    return _listDictionary;
}

@end
