"
I read a full CVG model from a given data folder.

Format: 

** Data Folder structure **
This folder contains data files containing serialized instances of the CV in the STON format.
Each file contains an array of serialized instances of a CVG model class (e.g., publications).
An additional configuration file contains optional metadata regarding the CV.

** Data Files **
All objects are stored as STON dictionaries.
Each data file contains a STON array in which are serialized the STON dictionaries.
"
Class {
	#name : #CVGReader,
	#superclass : #Object,
	#category : #'CVGenerator-ReadersWriters-Readers'
}

{ #category : #reading }
CVGReader class >> readFromDictionary: dic [
	^ self subclassResponsibility
]

{ #category : #reading }
CVGReader class >> readIntegerProperty: aPropertyName in: aDictionary [
	^aDictionary at: aPropertyName ifAbsent:[-1]
]

{ #category : #reading }
CVGReader class >> readStringProperty: aPropertyName in: aDictionary [
	^aDictionary at: aPropertyName ifAbsent:['']
]

{ #category : #reading }
CVGReader class >> readSymbolProperty: aPropertyName in: aDictionary [
	^aDictionary at: aPropertyName ifAbsent:[#other]
]
