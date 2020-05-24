"
I'm an abstract generator. I generate a set of CV documents using writers (html, latex, pillar...).
16/05/2020: only html.
"
Class {
	#name : #CVGGenerator,
	#superclass : #Object,
	#instVars : [
		'writerClass',
		'model',
		'stream'
	],
	#category : #'CVGenerator-ReadersWriters-Generators'
}

{ #category : #'instance creation' }
CVGGenerator class >> generateHTML: aCVGModel [
	^self new html; model: aCVGModel; generate
]

{ #category : #generation }
CVGGenerator >> generate [

	stream := WriteStream on: String new.
	self generatePublications.
	stream close
]

{ #category : #generation }
CVGGenerator >> generate: aCVGModel [
	model := aCVGModel.
	self generate
]

{ #category : #generation }
CVGGenerator >> generateAuthors: authors [
	| writer |
	writer := self newWriter.
	authors
		do: [ :author | 
			author isSelf
				ifTrue: [ writer bold: author fullName ]
				ifFalse: [ writer write: author fullName ].
			author = authors last
				ifTrue: [ writer writeDotSpace ]
				ifFalse: [ writer writeCommaSpace ] ]
]

{ #category : #generation }
CVGGenerator >> generatePublication: pub [
	| writer |
	writer := self newWriterFor: pub.
	writer openItem.
	writer bold: pub title.
	writer writeDotSpace.
	self generateAuthors: pub authors.
	writer writeDotSpace: pub publisher.
	writer writeDotSpace: pub year printString.
	writer writeURL: pub link.
	writer closeItem
]

{ #category : #generation }
CVGGenerator >> generatePublications [
	| writer |	
	writer := self newWriter.	
	writer section: 'Publications'.
	model sortedPublications
		do: [ :typedPublications | 
			| type pubs |
			type := typedPublications key.
			pubs := typedPublications value.
			pubs isEmpty
				ifFalse: [ writer subSection: type typeName.
					writer openItemList.
					pubs do: [ :pub | self generatePublication: pub ].
					writer closeItemList ] ]
]

{ #category : #initialization }
CVGGenerator >> html [
	writerClass := CVGHtmlWriter
]

{ #category : #initialization }
CVGGenerator >> model: aCVGCurriculum [
	model := aCVGCurriculum 
]

{ #category : #writers }
CVGGenerator >> newWriter [
	^ writerClass on: stream
]

{ #category : #writers }
CVGGenerator >> newWriterFor: aCVGElement [
	^ (writerClass for: aCVGElement) on: stream
]
