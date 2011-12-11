//
//  XMLParser.m
//  Wordsss
//
//  Created by Kelvin Ren on 12/6/11.
//  Copyright (c) 2011 Ren Inc. All rights reserved.
//

#import "XMLParser.h"

static XMLParser* sharedXMLParser;

static enum IterStat_M ism = MNONE;
static enum IterStat_D isd = DNONE;
static enum IterStat_T ist = TNONE;
static enum IterStat_R isr = RNONE;
static enum IterStat_F isf = FNONE;

NSManagedObject* object = nil;

static NSDictionary* attrDict;

@implementation XMLParser

#pragma mark -

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

#pragma mark -

// get xmlParser
+ (XMLParser*)xmlParser
{
    if (!sharedXMLParser) {
        sharedXMLParser = [[XMLParser alloc] init];
    }
    
    return sharedXMLParser;
}

#pragma mark -

- (void)createXmlParser
{
    NSString* pathRes = [[NSBundle mainBundle] pathForResource:@"WordsssDB" ofType:@"xml"];
    NSURL* pathUrl = [NSURL fileURLWithPath:pathRes];
    
    _parser = [[NSXMLParser alloc] initWithContentsOfURL:pathUrl];
    
    [_parser setDelegate:self];
}

#pragma mark -

// generate WordsssDB.sqlite
- (void)go
{
    _dbm = [WordsssDBDataManager wordsssDBDataManager];
    
    // CreateXMLParser
    [self createXmlParser];
    
    // Start parse
    [_parser parse];
    
    // Save context
    [_dbm saveContext];
}

#pragma mark -

- (void)createObject
{
    // M
    switch (ism) {
        case MNONE:
        {
            break;
        }
        case MMYSQLDUMP:
        {
            // D
            switch (isd) {
                case DNONE:
                {
                    break;
                }
                case DDATABASE:
                {
                    // T
                    switch (ist) {
                        case TNONE:
                        {
                            break;
                        }
                        case TTABLESTRUCTURE:
                        {
                            break;
                        }
                        case TTABLEDATA:
                        {
                            break;
                        }
                        case TTABLEDATA_WORD:   // word
                        {
                            object = (Word*)[NSEntityDescription insertNewObjectForEntityForName:@"Word" inManagedObjectContext:[_dbm managedObjectContext]];
                            
                            break;
                        }
                        default:
                        {
                            break;
                        }
                    }
                    
                    break;
                }
                default:
                {
                    break; 
                }
            }
            
            break;
        }
        default:
        {
            break;
        }
    }
}

- (void)setField:(NSString*)string
{
    // M
    switch (ism) {
        case MNONE:
        {
            break;
        }
        case MMYSQLDUMP:
        {
            // D
            switch (isd) {
                case DNONE:
                {
                    break;
                }
                case DDATABASE:
                {
                    // T
                    switch (ist) {
                        case TNONE:
                        {
                            break;
                        }
                        case TTABLESTRUCTURE:
                        {
                            break;
                        }
                        case TTABLEDATA:
                        {
                            break;
                        }
                        case TTABLEDATA_WORD:   // word
                        {
                            //
                            NSString* field = [attrDict objectForKey:@"name"];
                            
                            if (field && [field compare:@"word_id"] == NSOrderedSame) {
                                ((Word*)object).name = string;
                            }
                            
                            break;
                        }
                        default:
                        {
                            break;
                        }
                    }
                    
                    break;
                }
                default:
                {
                    break; 
                }
            }
            
            break;
        }
        default:
        {
            break;
        }
    }
}

- (void)insertObject
{
    // M
    switch (ism) {
        case MNONE:
        {
            break;
        }
        case MMYSQLDUMP:
        {
            // D
            switch (isd) {
                case DNONE:
                {
                    break;
                }
                case DDATABASE:
                {
                    // T
                    switch (ist) {
                        case TNONE:
                        {
                            break;
                        }
                        case TTABLESTRUCTURE:
                        {
                            break;
                        }
                        case TTABLEDATA:
                        {
                            break;
                        }
                        case TTABLEDATA_WORD:   // word
                        {
                            //
                            
                            break;
                        }
                        default:
                        {
                            break;
                        }
                    }
                    
                    break;
                }
                default:
                {
                    break; 
                }
            }
            
            break;
        }
        default:
        {
            break;
        }
    }
}

#pragma mark -
#pragma mark NSXMLParserDelegate

- (void)parserDidStartDocument:(NSXMLParser *)parser
{
    
}

- (void)parserDidEndDocument:(NSXMLParser *)parser
{
    
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qualifiedName attributes:(NSDictionary *)attributeDict
{
    NSLog(@"%@", elementName);
    
    if ([elementName compare:@"mysqldump"] == NSOrderedSame) {
        ism = MMYSQLDUMP;
    }
    else if ([elementName compare:@"database"] == NSOrderedSame) {
        isd = DDATABASE;
    }
    else if ([elementName compare:@"table_structure"] == NSOrderedSame) {
        ist = TTABLESTRUCTURE;
    }
    else if ([elementName compare:@"table_data"] == NSOrderedSame) {
        ist = TTABLEDATA;
        NSString* name = [attributeDict objectForKey:@"name"];
        if ([name compare:@"word"] == NSOrderedSame) {
            ist = TTABLEDATA_WORD;
        }
    }
    else if ([elementName compare:@"row"] == NSOrderedSame) {
        isr = RROW;
        
        // Create object
        [self createObject];
    }
    else if ([elementName compare:@"field"] == NSOrderedSame) {
        isf = FFIELD;
        
        // Store field info
        attrDict = attributeDict;
    }
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    if ([elementName compare:@"mysqldump"] == NSOrderedSame) {
        ism = MNONE;
    }
    else if ([elementName compare:@"database"] == NSOrderedSame) {
        isd = DNONE;
    }
    else if ([elementName compare:@"table_structure"] == NSOrderedSame) {
        ist = TNONE;
    }
    else if ([elementName compare:@"table_data"] == NSOrderedSame) {
        ist = TNONE;
    }
    else if ([elementName compare:@"row"] == NSOrderedSame) {
        isr = RNONE;
        
        // Insert object
        [self insertObject];
    }
    else if ([elementName compare:@"field"] == NSOrderedSame) {
        isf = FNONE;
    }
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    [self setField:string];
}

@end
