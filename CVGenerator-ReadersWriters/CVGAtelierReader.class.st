"
I am a utility class.
I instantiate a CVGAtelier from a dictionary representing an atelier instance.
"
Class {
	#name : #CVGAtelierReader,
	#superclass : #CVGReader,
	#category : #'CVGenerator-ReadersWriters-Readers'
}

{ #category : #reading }
CVGAtelierReader class >> readFromDictionary: dic [

	|atelierOrVulga|
	atelierOrVulga := CVGAtelier new.
	atelierOrVulga type: (CVGAdditionalTeachingType type: (self readSymbolProperty: #type in: dic)).
	atelierOrVulga title: (dic at: #title).
	atelierOrVulga text: (dic at: #text).
	atelierOrVulga dateString: (dic at: #dateString).
	atelierOrVulga over: (dic at: #over ifAbsent: [false]).	
	^atelierOrVulga
]
