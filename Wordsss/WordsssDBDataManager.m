//
//  WordsssDBDataManager.m
//  Wordsss
//
//  Created by Kelvin Ren on 12/11/11.
//  Copyright (c) 2011 Ren Inc. All rights reserved.
//

#import "WordsssDBDataManager.h"

static WordsssDBDataManager* sharedWordsssDBDataManager = nil;

@implementation WordsssDBDataManager

@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

+ (WordsssDBDataManager*)wordsssDBDataManager
{
    if (!sharedWordsssDBDataManager) {
        sharedWordsssDBDataManager = [[WordsssDBDataManager alloc] init];
    }
    
    return sharedWordsssDBDataManager;
}

#pragma mark - Instance method

- (Word*)getWordWithId:(NSNumber*)wordId
{
    return [Word wordWithId:wordId inManagedObjectContext:self.managedObjectContext];
}

- (NSArray*)getRandomAssociations:(int)count
{
    NSArray* array = [NSArray array];
    
    // Get 
    NSFetchRequest* request = [[NSFetchRequest alloc] initWithEntityName:@"Association"];
    NSArray* fetchResult = [self.managedObjectContext executeFetchRequest:request error:nil];
    
    // Rand
    NSMutableIndexSet* indexSet = [NSMutableIndexSet indexSet];
    for (int i = 0; i < count; i++) {
        [indexSet addIndex:(rand() % [fetchResult count])];
    }
    
    // Set
    array = [fetchResult objectsAtIndexes:indexSet];
    
    return array;
}

- (NSArray*)getRandomRootaffixs:(int)count
{
    NSArray* array = [NSArray array];
    
    // Get 
    NSFetchRequest* request = [[NSFetchRequest alloc] initWithEntityName:@"Rootaffix"];
    NSArray* fetchResult = [self.managedObjectContext executeFetchRequest:request error:nil];
    
    // Rand
    NSMutableIndexSet* indexSet = [NSMutableIndexSet indexSet];
    for (int i = 0; i < count; i++) {
        [indexSet addIndex:(rand() % [fetchResult count])];
    }
    
    // Set
    array = [fetchResult objectsAtIndexes:indexSet];
    
    return array;
}

- (NSArray*)getRandomSenses:(int)count
{
    NSArray* array = [NSArray array];
    
    // Get 
    NSFetchRequest* request = [[NSFetchRequest alloc] initWithEntityName:@"Sense"];
//    [request setPredicate:[NSPredicate predicateWithFormat:@""]];
    NSArray* fetchResult = [self.managedObjectContext executeFetchRequest:request error:nil];
    
    // Rand
    NSMutableIndexSet* indexSet = [NSMutableIndexSet indexSet];
    for (int i = 0; i < count; i++) {
        [indexSet addIndex:(rand() % [fetchResult count])];
    }
    
    // Set
    array = [fetchResult objectsAtIndexes:indexSet];
    
    return array;
}

#pragma mark - Core Data

- (void)saveContext
{
    NSError *error = nil;
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil)
    {
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error])
        {
            /*
             Replace this implementation with code to handle the error appropriately.
             
             abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development. If it is not possible to recover from the error, display an alert panel that instructs the user to quit the application by pressing the Home button.
             */
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        } 
    }
}

#pragma mark - Core Data stack

/**
 Returns the managed object context for the application.
 If the context doesn't already exist, it is created and bound to the persistent store coordinator for the application.
 */
- (NSManagedObjectContext *)managedObjectContext
{
    if (_managedObjectContext != nil)
    {
        return _managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (coordinator != nil)
    {
        _managedObjectContext = [[NSManagedObjectContext alloc] init];
        [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    }
    return _managedObjectContext;
}

/**
 Returns the managed object model for the application.
 If the model doesn't already exist, it is created from the application's model.
 */
- (NSManagedObjectModel *)managedObjectModel
{
    if (_managedObjectModel != nil)
    {
        return _managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"WordsssDB" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];    
    return _managedObjectModel;
}

/**
 Returns the persistent store coordinator for the application.
 If the coordinator doesn't already exist, it is created and the application's store added to it.
 */
- (NSPersistentStoreCoordinator *)persistentStoreCoordinator
{
    if (_persistentStoreCoordinator != nil)
    {
        return _persistentStoreCoordinator;
    }
    
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"WordsssDB.sqlite"];
    
    // If no WordsssDB.sqlite
//    NSString* filePath = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingPathComponent:@"WordsssDB.sqlite"];	
//    if (![[NSFileManager defaultManager] fileExistsAtPath:filePath]) {
//        NSString* filePathRes = [[NSBundle mainBundle]  pathForResource:@"WordsssDB" ofType:@"sqlite"];
//        [[NSFileManager defaultManager] copyItemAtPath:filePathRes toPath:filePath error:NULL];
//    }
    
    NSError *error = nil;
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error])
    {
        /*
         Replace this implementation with code to handle the error appropriately.
         
         abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development. If it is not possible to recover from the error, display an alert panel that instructs the user to quit the application by pressing the Home button.
         
         Typical reasons for an error here include:
         * The persistent store is not accessible;
         * The schema for the persistent store is incompatible with current managed object model.
         Check the error message to determine what the actual problem was.
         
         
         If the persistent store is not accessible, there is typically something wrong with the file path. Often, a file URL is pointing into the application's resources directory instead of a writeable directory.
         
         If you encounter schema incompatibility errors during development, you can reduce their frequency by:
         * Simply deleting the existing store:
         [[NSFileManager defaultManager] removeItemAtURL:storeURL error:nil]
         
         * Performing automatic lightweight migration by passing the following dictionary as the options parameter: 
         [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithBool:YES], NSMigratePersistentStoresAutomaticallyOption, [NSNumber numberWithBool:YES], NSInferMappingModelAutomaticallyOption, nil];
         
         Lightweight migration will only work for a limited set of schema changes; consult "Core Data Model Versioning and Data Migration Programming Guide" for details.
         
         */
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }    
    
    return _persistentStoreCoordinator;
}

#pragma mark - Application's Documents directory

/**
 Returns the URL to the application's Documents directory.
 */
- (NSURL *)applicationDocumentsDirectory
{
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

@end
