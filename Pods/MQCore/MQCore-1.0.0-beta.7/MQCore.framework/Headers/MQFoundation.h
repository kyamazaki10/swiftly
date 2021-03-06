//
//  MQFoundation.h
//  ios-core-model
//
//  Copyright (c) 2013 MapQuest. All rights reserved.
//

#ifdef __cplusplus
#define MQ_EXTERN       extern "C" __attribute__((visibility ("default")))
#else
#define MQ_EXTERN       extern __attribute__((visibility ("default")))
#endif

#define MQ_CLASS_AVAILABLE(_macIntro, _iphoneIntro) __attribute__((visibility("default"))) NS_CLASS_AVAILABLE(_macIntro, _iphoneIntro)

#define MQ_CLASS_DEPRECATED(_macIntro,_macDep,_iphoneIntro,_iphoneDep) __attribute__((visibility("default"))) NS_DEPRECATED(_macIntro,_macDep,_iphoneIntro,_iphoneDep)

#ifndef VectorSDK_MQFoundation_h
#define VectorSDK_MQFoundation_h

#endif
