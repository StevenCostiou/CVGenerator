Class {
	#name : #CVGPublicationReaderTest,
	#superclass : #TestCase,
	#category : #'CVGenerator-ReadersWriters-Tests'
}

{ #category : #accessing }
CVGPublicationReaderTest >> sampleDictionary [
	^STON fromString: self sampleSTON
]

{ #category : #accessing }
CVGPublicationReaderTest >> sampleSTON [
	^'
  {
    #type: #journal,
    #title: ''Lub: A pattern for fine grained behavior adaptation at runtime'',
    #authors: ''Steven Costiou, Mickaël Kerboeuf, Glenn Cavarlé, Alain Plantec'',
    #year: 2018,
    #publisher: ''Science of Computer Programming, Volume 161, ISSN 0167-6423'',
    #doi: ''https://doi.org/10.1016/j.scico.2017.09.006'',
    #link: ''pdf/papers/lub-pattern.pdf''
  }'
]

{ #category : #accessing }
CVGPublicationReaderTest >> testReadIntegerPropertyIn [
	self assert: (CVGPublicationReader readIntegerProperty: #year in: self sampleDictionary) equals: 2018.
	self assert: (CVGPublicationReader readIntegerProperty: #absent in: self sampleDictionary) equals: -1. 
]

{ #category : #accessing }
CVGPublicationReaderTest >> testReadStringPropertyIn [
	self assert: (CVGPublicationReader readStringProperty: #title in: self sampleDictionary) equals: 'Lub: A pattern for fine grained behavior adaptation at runtime'.
	self assert: (CVGPublicationReader readStringProperty: #absent in: self sampleDictionary) equals: ''. 
]

{ #category : #accessing }
CVGPublicationReaderTest >> testReadSymbolPropertyIn [
	self assert: (CVGPublicationReader readSymbolProperty: #type in: self sampleDictionary) equals: #journal.
	self assert: (CVGPublicationReader readSymbolProperty: #absent in: self sampleDictionary) equals: #other. 
]
