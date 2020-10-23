Class {
	#name : #CVGAdditionalTeachingCapReader,
	#superclass : #CVGReader,
	#category : #'CVGenerator-ReadersWriters-Readers'
}

{ #category : #reading }
CVGAdditionalTeachingCapReader class >> readFromDictionary: dic [

	|cap|
	cap := CVGCap new.
	cap type: (CVGAdditionalTeachingType type: (self readSymbolProperty: #type in: dic)).
	cap title: (self readStringProperty: #title in: dic).
	cap text: (dic at: #text).
	cap sectionType: (dic at: #section).
	cap over: (dic at: #over ifAbsent: [false]).	
	^cap
]
