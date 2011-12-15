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

static NSDictionary* attrDict = nil;
static NSString* attrString = nil;

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

- (void)generateObject
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
                        case TTABLEDATA_WORD:   // Word
                        {
                            object = (Word*)[NSEntityDescription insertNewObjectForEntityForName:@"Word" inManagedObjectContext:[_dbm managedObjectContext]];
                            
                            break;
                        }
                        case TTABLEDATA_ASSOCIATION:   // Association
                        {
                            object = (Association*)[NSEntityDescription insertNewObjectForEntityForName:@"Association" inManagedObjectContext:[_dbm managedObjectContext]];
                            
                            break;
                        }
                        case TTABLEDATA_ROOTAFFIX:   // Rootaffix
                        {
                            object = (Rootaffix*)[NSEntityDescription insertNewObjectForEntityForName:@"Rootaffix" inManagedObjectContext:[_dbm managedObjectContext]];
                            
                            break;
                        }
                        case TTABLEDATA_SENSE:   // Sense
                        {
                            object = (Sense*)[NSEntityDescription insertNewObjectForEntityForName:@"Sense" inManagedObjectContext:[_dbm managedObjectContext]];
                            
                            break;
                        }
                        case TTABLEDATA_WORDDICT:   // WordDict
                        {
                            object = (Word_Dict*)[NSEntityDescription insertNewObjectForEntityForName:@"Word_Dict" inManagedObjectContext:[_dbm managedObjectContext]];
                            
                            break;
                        }
                        case TTABLEDATA_MCECDICTWORD:   // MCECDictWord
                        {
                            object = (McecDictWord*)[NSEntityDescription insertNewObjectForEntityForName:@"McecDictWord" inManagedObjectContext:[_dbm managedObjectContext]];
                            
                            break;
                        }
                        case TTABLEDATA_MCECDICTMEANING:   // MCECDcitMeaning
                        {
                            object = (McecDictMeaning*)[NSEntityDescription insertNewObjectForEntityForName:@"McecDictMeaning" inManagedObjectContext:[_dbm managedObjectContext]];
                            
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
                        case TTABLEDATA_WORD:   // Word
                        {
                            if (!attrDict)
                                break;
                            
                            attrString = [attrDict objectForKey:@"name"];
                            
                            if (!attrString)
                                break;
                            
                            if ([attrString compare:@"word_id"] == NSOrderedSame) {
                                ((Word*)object).id = [NSNumber numberWithInt:[string intValue]];
                                
                                NSLog(@"Word - id: %@", string);
                            }
                            else if ([attrString compare:@"word_name"] == NSOrderedSame) {
                                ((Word*)object).name = string;
                            }
                            
                            attrString = nil;
                            attrDict = nil;
                            
                            break;
                        }
                        case TTABLEDATA_ASSOCIATION:   // Association
                        {
                            if (!attrDict)
                                break;
                            
                            attrString = [attrDict objectForKey:@"name"];
                            
                            if (!attrString)
                                break;
                            
                            if ([attrString compare:@"association_id"] == NSOrderedSame) {
                                ((Association*)object).id = [NSNumber numberWithInt:[string intValue]];
                                
                                NSLog(@"Association - id: %@", string);
                            }
                            else if ([attrString compare:@"association_name"] == NSOrderedSame) {
                                ((Association*)object).type = [NSNumber numberWithInt:[string intValue]];
                            }
                            else if ([attrString compare:@"association_description_cn"] == NSOrderedSame) {
                                ((Association*)object).description_cn = string;
                            }
                            
                            attrString = nil;
                            attrDict = nil;
                            
                            break;
                        }
                        case TTABLEDATA_ROOTAFFIX:   // Rootaffix
                        {
                            if (!attrDict)
                                break;
                            
                            attrString = [attrDict objectForKey:@"name"];
                            
                            if (!attrString)
                                break;
                            
                            if ([attrString compare:@"rootaffix_id"] == NSOrderedSame) {
                                ((Rootaffix*)object).id = [NSNumber numberWithInt:[string intValue]];
                                
                                NSLog(@"Rootaffix - id: %@", string);
                            }
                            else if ([attrString compare:@"phrase"] == NSOrderedSame) {
                                ((Rootaffix*)object).phrase = string;
                            }
                            else if ([attrString compare:@"deformation"] == NSOrderedSame) {
                                ((Rootaffix*)object).deformation = string;
                            }
                            else if ([attrString compare:@"type"] == NSOrderedSame) {
                                ((Rootaffix*)object).type = [NSNumber numberWithInt:[string intValue]];
                            }
                            else if ([attrString compare:@"origin"] == NSOrderedSame) {
                                ((Rootaffix*)object).origin = string;
                            }
                            else if ([attrString compare:@"meaning_en"] == NSOrderedSame) {
                                ((Rootaffix*)object).meaning_en = string;
                            }
                            else if ([attrString compare:@"meaning_cn"] == NSOrderedSame) {
                                ((Rootaffix*)object).meaning_cn = string;
                            }
                            else if ([attrString compare:@"description_en"] == NSOrderedSame) {
                                ((Rootaffix*)object).description_en = string;
                            }
                            else if ([attrString compare:@"description_cn"] == NSOrderedSame) {
                                ((Rootaffix*)object).description_cn = string;
                            }
                            
                            attrString = nil;
                            attrDict = nil;
                            
                            break;
                        }
                        case TTABLEDATA_SENSE:   // Sense
                        {
                            if (!attrDict)
                                break;
                            
                            attrString = [attrDict objectForKey:@"name"];
                            
                            if (!attrString)
                                break;
                            
                            if ([attrString compare:@"sense_id"] == NSOrderedSame) {
                                ((Sense*)object).id = [NSNumber numberWithInt:[string intValue]];
                                
                                NSLog(@"Sense - id: %@", string);
                            }
                            else if ([attrString compare:@"meaning_en"] == NSOrderedSame) {
                                ((Rootaffix*)object).meaning_en = string;
                            }
                            else if ([attrString compare:@"meaning_cn"] == NSOrderedSame) {
                                ((Rootaffix*)object).meaning_cn = string;
                            }
                            
                            attrString = nil;
                            attrDict = nil;
                            
                            break;
                        }
                        case TTABLEDATA_MCECDICTWORD:   // MCECDictWord
                        {
                            if (!attrDict)
                                break;
                            
                            attrString = [attrDict objectForKey:@"name"];
                            
                            if (!attrString)
                                break;
                            
                            if ([attrString compare:@"mcec_dict_word_id"] == NSOrderedSame) {
                                ((McecDictWord*)object).id = [NSNumber numberWithInt:[string intValue]];
                                
                                NSLog(@"McecDictWord - id: %@", string);
                            }
                            
                            attrString = nil;
                            attrDict = nil;
                            
                            break;
                        }
                        case TTABLEDATA_MCECDICTMEANING:   // MCECDictWord
                        {
                            if (!attrDict)
                                break;
                            
                            attrString = [attrDict objectForKey:@"name"];
                            
                            if (!attrString)
                                break;
                            
                            if ([attrString compare:@"mcec_dict_meaning_id"] == NSOrderedSame) {
                                ((McecDictMeaning*)object).id = [NSNumber numberWithInt:[string intValue]];
                                
                                NSLog(@"McecDictMeaning - id: %@", string);
                            }
                            else if ([attrString compare:@"meaning_cn"] == NSOrderedSame) {
                                ((McecDictMeaning*)object).meaning_cn = string;
                            }
                            else if ([attrString compare:@"type"] == NSOrderedSame) {
                                ((McecDictMeaning*)object).type = [NSNumber numberWithInt:[string intValue]];
                            }
                            
                            attrString = nil;
                            attrDict = nil;
                            
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

#pragma mark - NSXMLParserDelegate

- (void)parserDidStartDocument:(NSXMLParser *)parser
{
    
}

- (void)parserDidEndDocument:(NSXMLParser *)parser
{
    
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qualifiedName attributes:(NSDictionary *)attributeDict
{
    
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
        
        // Specified table
        NSString* name = [attributeDict objectForKey:@"name"];
        if ([name compare:@"association"] == NSOrderedSame) {
            ist = TTABLEDATA_ASSOCIATION;
        }
        else if ([name compare:@"dota_list"] == NSOrderedSame) {
            ist = TTABLEDATA_DOTALIST;
        }
        else if ([name compare:@"mcec_dict_meaning"] == NSOrderedSame) {
            ist = TTABLEDATA_MCECDICTMEANING;
        }
        else if ([name compare:@"mcec_dict_word"] == NSOrderedSame) {
            ist = TTABLEDATA_MCECDICTWORD;
        }
        else if ([name compare:@"mwc_dict_meaning"] == NSOrderedSame) {
            ist = TTABLEDATA_MWCDICTMEANING;
        }
        else if ([name compare:@"mwc_dict_word"] == NSOrderedSame) {
            ist = TTABLEDATA_MWCDICTWORD;
        }
        else if ([name compare:@"rootaffix"] == NSOrderedSame) {
            ist = TTABLEDATA_ROOTAFFIX;
        }
        else if ([name compare:@"sense"] == NSOrderedSame) {
            ist = TTABLEDATA_SENSE;
        }
        else if ([name compare:@"sense_family"] == NSOrderedSame) {
            ist = TTABLEDATA_SENSEFAMILY;
        }
        else if ([name compare:@"word"] == NSOrderedSame) {
            ist = TTABLEDATA_WORD;
        }
        else if ([name compare:@"word_association"] == NSOrderedSame) {
            ist = TTABLEDATA_WORDASSOCIATION;
        }
        else if ([name compare:@"word_dict"] == NSOrderedSame) {
            ist = TTABLEDATA_WORDDICT;
        }
        else if ([name compare:@"word_list"] == NSOrderedSame) {
            ist = TTABLEDATA_WORDLIST;
        }
        else if ([name compare:@"word_rootaffix"] == NSOrderedSame) {
            ist = TTABLEDATA_WORDROOTAFFIX;
        }
        else if ([name compare:@"word_sense"] == NSOrderedSame) {
            ist = TTABLEDATA_WORDSENSE;
        }
    }
    else if ([elementName compare:@"row"] == NSOrderedSame) {
        isr = RROW;
        
        // Create object
        [self generateObject];
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
