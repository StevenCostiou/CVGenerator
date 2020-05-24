"
I am a utility class.
I instantiate a CVGPublication from a dictionary representing a CVGPublication instance.
"
Class {
	#name : #CVGPublicationReader,
	#superclass : #CVGReader,
	#category : #'CVGenerator-ReadersWriters-Readers'
}

{ #category : #reading }
CVGPublicationReader class >> readFromDictionary: dic [

	|publication|
	publication := CVGPublication new.
	publication type: (CVGPublicationType type: (self readSymbolProperty: #type in: dic)).
	publication title: (self readStringProperty: #title in: dic).
	publication authors: (CVGAuthor readerClass readAuthorsFrom: (self readStringProperty: #authors in: dic)).
	publication year: (self readIntegerProperty: #year in: dic).
	publication publisher: (self readStringProperty: #publisher in: dic).
	publication doi: (self readStringProperty: #doi in: dic).
	publication link: (self readStringProperty: #link in: dic).
	^publication
]
