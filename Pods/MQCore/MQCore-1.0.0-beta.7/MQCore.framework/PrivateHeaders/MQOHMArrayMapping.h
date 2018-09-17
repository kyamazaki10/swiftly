//
//  OHMArrayMapping.h
//  ObjectMapping
//
//  Created by Fabian Canas on 8/1/14.
//  Copyright (c) 2014 Fabian Canas. All rights reserved.
//

#ifndef MQOHMKit_OHMArrayMapping_h
#define MQOHMKit_OHMArrayMapping_h

/**
 Sets the passed dictionary as the array mapping dictionary for the class.

 The keys should correspond to keys on the model object that is of type NSArray, such as @p @@"favoriteColors". The values are the class of objects conforming to OHMMappable that the array should be populated with. When a mapping is performed, if a data source contains an array of dicitonaries for the given key, an array of target classes populated from those dictionaries will be set instead.

 @param class The class on which to set the mapping dictionary.
 @param classDictionary A dictionary source key of strings, and target values of OHMMappable classes.
 */
extern void MQOHMSetArrayClasses(__nonnull Class class, NSDictionary * __nullable classDictionary);

/**
 Adds the key value pairs from the passed dictionary to the existing array mapping dictionary.

 If there is no existing array mapping dictionary, one is created. If a value for a passed-in key exists, it will be overwritten.

 The key is a key a key on the model object that is of type NSArray, such as @p @@"favoriteColors". The values are the class of objects conforming to OHMMappable that the array should be populated with. When a mapping is performed, if a data source contains an array of dicitonaries for the given key, an array of target classes populated from those dictionaries will be set instead.

 @param class The class on which to set the mapping dictionary.
 @param classDictionary A dictionary source key of strings, and target values of OHMMappable classes.
 */
extern void MQOHMAddArrayClasses(__nonnull Class class, NSDictionary * __nullable classDictionary);

/**
 Remove the array mapping class for each key in @p keyArray on the given class.

 @param class The class whose array mappings should be removed.
 @param keyArray An array of keys to be removed from array mapping.
 */
extern void MQOHMRemoveArray(__nonnull Class class, NSArray * __nullable keyArray);

#endif
