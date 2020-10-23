"
I am a utility class.
I instantiate a CVGCordee from a dictionary representing a cordee instance.
"
Class {
	#name : #CVGCordeesReader,
	#superclass : #CVGReader,
	#category : #'CVGenerator-ReadersWriters-Readers'
}

{ #category : #reading }
CVGCordeesReader class >> readFromDictionary: dic [

	|cordee|
	cordee := CVGCordee new.
	cordee type: (CVGAdditionalTeachingType type: (self readSymbolProperty: #type in: dic)).
	cordee title: (self readStringProperty: #title in: dic).
	cordee text: (dic at: #text).
	cordee year: (dic at: #year).
	cordee award: (dic at: #award).
	cordee thumb: (dic at: #thumb).
	cordee images: (dic at: #images).
	cordee press: (dic at: #press).
	cordee poster: (dic at: #poster).
	cordee students: (dic at: #students).
	cordee school: (dic at: #school).
	cordee over: (dic at: #over ifAbsent: [false]).	
	^cordee
]
