Class {
	#name : #CVGAuthorReaderTest,
	#superclass : #TestCase,
	#category : #'CVGenerator-ReadersWriters-Tests'
}

{ #category : #tests }
CVGAuthorReaderTest >> testReadAuthorsFrom [
	|authorString authors|
	authorString := 'John Doe, John McLane, Jean Valjean'.
	authors := CVGAuthor readerClass readAuthorsFrom: authorString.
	self assert: authors size equals: 3.
	self assert: (authors allSatisfy: [ :auth| auth class == CVGAuthor ]).
	self assert: authors first name equals: 'John'.
	self assert: authors first surname equals: 'Doe'.
	self assert: authors second name equals: 'John'.
	self assert: authors second surname equals: 'McLane'.
	self assert: authors third name equals: 'Jean'.
	self assert: authors third surname equals: 'Valjean'.
]
