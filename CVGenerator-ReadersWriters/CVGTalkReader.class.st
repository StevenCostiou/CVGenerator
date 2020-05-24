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

	|softwareArtefact|
	softwareArtefact := CVGSoftware new.
	softwareArtefact type: (CVGTalkType type: (self readSymbolProperty: #type in: dic)).
	softwareArtefact title: (self readStringProperty: #title in: dic).
	softwareArtefact date: (Date readFrom: (self readIntegerProperty: #yearStart in: dic) readStream).
	softwareArtefact description: (self readStringProperty: #description in: dic).
	softwareArtefact location: (self readStringProperty: #location in: dic).
	softwareArtefact link: (self readStringProperty: #link in: dic).
	^softwareArtefact
]
