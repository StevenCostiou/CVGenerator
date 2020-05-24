"
I am a utility class.
I instantiate a CVGTalk from a dictionary representing a CVGSoftware instance.
"
Class {
	#name : #CVGTalkReader,
	#superclass : #CVGReader,
	#category : #'CVGenerator-ReadersWriters-Readers'
}

{ #category : #reading }
CVGTalkReader class >> readFromDictionary: dic [

	|talk dateString|
	talk := CVGTalk new.
	talk type: (CVGTalkType type: (self readSymbolProperty: #type in: dic)).
	talk title: (self readStringProperty: #title in: dic).
	dateString := (self readIntegerProperty: #date in: dic).
	dateString isEmpty 
		ifFalse:[talk date: (Date readFrom: dateString readStream)].
	talk description: (self readStringProperty: #description in: dic).
	talk location: (self readStringProperty: #location in: dic).
	talk link: (self readStringProperty: #link in: dic).
	^talk
]
