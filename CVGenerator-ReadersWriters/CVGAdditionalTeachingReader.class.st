Class {
	#name : #CVGAdditionalTeachingReader,
	#superclass : #CVGReader,
	#category : #'CVGenerator-ReadersWriters-Readers'
}

{ #category : #reading }
CVGAdditionalTeachingReader class >> readFromDictionary: dic [
	| type |
	type := self readSymbolProperty: #type in: dic.
	type = #cap
		ifTrue: [ ^ CVGAdditionalTeachingCapReader readFromDictionary: dic ].
	type = #cordees
		ifTrue: [ ^ CVGCordeesReader readFromDictionary: dic ].
	^ CVGAtelierReader readFromDictionary: dic
]
