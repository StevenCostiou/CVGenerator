Class {
	#name : #CVGResearchReader,
	#superclass : #CVGReader,
	#category : #'CVGenerator-ReadersWriters-Readers'
}

{ #category : #reading }
CVGResearchReader class >> readFromDictionary: dic [

	|researchOrCollaboration|
	researchOrCollaboration := CVGResearch new.
	researchOrCollaboration type: (CVGResearchWorkType type: (self readSymbolProperty: #type in: dic)).
	researchOrCollaboration title: (dic at: #title).
	researchOrCollaboration text: (dic at: #text).
	researchOrCollaboration dateString: (dic at: #dateString).
	researchOrCollaboration over: (dic at: #over ifAbsent: [false]).
	^researchOrCollaboration
]
