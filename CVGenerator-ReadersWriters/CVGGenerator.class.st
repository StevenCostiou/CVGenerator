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
		'outputDic',
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
	outputDic := Dictionary new.
	self generateCV
]

{ #category : #generation }
CVGGenerator >> generateAuthor: author [
	| writer |
	writer := self newWriterFor: author.
	author isSelf
		ifTrue: [ writer italic: author fullName ]
		ifFalse: [ writer write: author fullName ]
]

{ #category : #generation }
CVGGenerator >> generateCV [
	model sections do: [ :sec | sec acceptGenerator: self ]
]

{ #category : #generation }
CVGGenerator >> generatePublication: pub [
	| writer |
	writer := self newWriterFor: pub.
	writer openItem.
	writer bold: pub title.
	writer writeDotSpace.
	pub authors
		do: [ :auth | 
			auth acceptGenerator: self.
			pub authors last == auth
				ifTrue: [ writer writeDotSpace ]
				ifFalse: [ writer writeCommaSpace ] ].
	writer writeDotSpace: pub publisher.
	writer writeDotSpace: pub year printString.
	writer writeURL: pub link.
	writer closeItem
]

{ #category : #generation }
CVGGenerator >> generateSection: aSection [
	| writer |
	stream := self newStringWriteStream.
	writer := self newWriterFor: aSection type.
	writer section: aSection title.
	aSection sortedElements
		do: [ :typedElement | 
			| type elements |
			type := typedElement key.
			elements := typedElement value.
			elements isEmpty
				ifFalse: [ writer subSection: type typeName.
					writer openItemList.
					elements do: [ :e | e acceptGenerator: self ].
					writer closeItemList ] ].
	outputDic at: aSection title put: writer contents
]

{ #category : #generation }
CVGGenerator >> generateSoftware: s [
	| writer |
	writer := self newWriterFor: s.
	writer openItem.
	writer bold: s title.
	writer writeSpace.
	writer write: '(', s yearStart printString, ' - '.
	writer write: (s yearStop = 0 ifTrue:['...'] ifFalse:[s yearStop printString]), ')'.
	writer writeDotSpace.
	writer write: s description.
	writer writeDotSpace.
	writer writeURL: s link.
	writer closeItem
]

{ #category : #initialization }
CVGGenerator >> html [
	writerClass := CVGHtmlWriter
]

{ #category : #initialization }
CVGGenerator >> initialize [
	outputDic := Dictionary new
]

{ #category : #initialization }
CVGGenerator >> model: aCVGCurriculum [
	model := aCVGCurriculum 
]

{ #category : #writers }
CVGGenerator >> newStringWriteStream [
	^ WriteStream on: String new
]

{ #category : #writers }
CVGGenerator >> newWriterFor: aCVGElement [
	^ (writerClass for: aCVGElement) on: stream
]
