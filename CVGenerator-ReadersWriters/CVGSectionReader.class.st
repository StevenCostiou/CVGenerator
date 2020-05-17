"
I am a utility class.
I instantiate a CVGSection from a dictionary representing a CVGSection instance.
I do not instantiate the data of the section.
"
Class {
	#name : #CVGSectionReader,
	#superclass : #CVGReader,
	#category : #'CVGenerator-ReadersWriters-Readers'
}

{ #category : #reading }
CVGSectionReader class >> readFromDictionary: dic [
	| section |
	section := CVGSection new.
	section
		type: (Smalltalk at: (self readSymbolProperty: #type in: dic)).
	section title: (self readStringProperty: #title in: dic).
	section dataPath: (self readStringProperty: #dataPath in: dic).
	^ section
]
