"
I am a utility class.
I instantiate a CVGSoftware from a dictionary representing a CVGSoftware instance.
"
Class {
	#name : #CVGSoftwareReader,
	#superclass : #CVGReader,
	#category : #'CVGenerator-ReadersWriters-Readers'
}

{ #category : #reading }
CVGSoftwareReader class >> readFromDictionary: dic [

	|softwareArtefact|
	softwareArtefact := CVGSoftware new.
	softwareArtefact type: (CVGSoftwareType type: (self readSymbolProperty: #type in: dic)).
	softwareArtefact title: (self readStringProperty: #title in: dic).
	softwareArtefact yearStart: (self readIntegerProperty: #yearStart in: dic).
	softwareArtefact yearStop: (self readIntegerProperty: #yearStop in: dic).
	softwareArtefact description: (self readStringProperty: #description in: dic).
	softwareArtefact image: (self readStringProperty: #image in: dic).
	softwareArtefact link: (self readStringProperty: #link in: dic).
	^softwareArtefact
]
