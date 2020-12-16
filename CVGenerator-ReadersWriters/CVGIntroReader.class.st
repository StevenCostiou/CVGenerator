Class {
	#name : #CVGIntroReader,
	#superclass : #CVGReader,
	#category : #'CVGenerator-ReadersWriters-Readers'
}

{ #category : #reading }
CVGIntroReader class >> readFromDictionary: dic [

	|intro|
	intro := CVGIntro new.
	intro type: (CVGIntroType type: (self readSymbolProperty: #type in: dic)).
	intro title: (dic at: #title).
	intro text: (dic at: #text).
	intro keywords:(dic at: #keywords).
	^intro
]
