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
CVGPublicationReaderTest >> testReadFromDictionary [ 
	|cvgpub|
	cvgpub := CVGPublication readerClass  readFromDictionary: self sampleDictionary.
	self assert: cvgpub type typeKey equals: (self sampleDictionary at: #type).
	self assert: cvgpub title equals: (self sampleDictionary at: #title).
	self assert: cvgpub year equals: (self sampleDictionary at: #year).
	self assert: cvgpub publisher equals: (self sampleDictionary at: #publisher).
	self assert: cvgpub doi equals: (self sampleDictionary at: #doi).
	self assert: cvgpub link equals: (self sampleDictionary at: #link).
	
	
	self assert: cvgpub authors first fullName equals: 'Steven Costiou'.
	self assert: cvgpub authors second fullName equals: 'Mickaël Kerboeuf'.
	self assert: cvgpub authors third fullName equals: 'Glenn Cavarlé'.
	self assert: cvgpub authors fourth fullName equals: 'Alain Plantec'
]

{ #category : #accessing }
CVGPublicationReaderTest >> testReadIntegerPropertyIn [
	self assert: (CVGPublication readerClass readIntegerProperty: #year in: self sampleDictionary) equals: 2018.
	self assert: (CVGPublication readerClass readIntegerProperty: #absent in: self sampleDictionary) equals: -1. 
]

{ #category : #accessing }
CVGPublicationReaderTest >> testReadStringPropertyIn [
	self assert: (CVGPublication readerClass readStringProperty: #title in: self sampleDictionary) equals: 'Lub: A pattern for fine grained behavior adaptation at runtime'.
	self assert: (CVGPublication readerClass readStringProperty: #absent in: self sampleDictionary) equals: ''. 
]

{ #category : #accessing }
CVGPublicationReaderTest >> testReadSymbolPropertyIn [
	self assert: (CVGPublication readerClass readSymbolProperty: #type in: self sampleDictionary) equals: #journal.
	self assert: (CVGPublication readerClass readSymbolProperty: #absent in: self sampleDictionary) equals: #other. 
]
