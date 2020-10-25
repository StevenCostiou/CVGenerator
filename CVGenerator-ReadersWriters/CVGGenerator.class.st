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
		'stream',
		'generatorWriter',
		'translated'
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
	generatorWriter := writerClass on: self stream.
	self generateCV
]

{ #category : #generation }
CVGGenerator >> generateAtelier: aCVGAtelier [ 
	
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
CVGGenerator >> generateCap: aCVGCap [ 
	
]

{ #category : #generation }
CVGGenerator >> generateCordee: aCVGCordee [ 
	
]

{ #category : #generation }
CVGGenerator >> generateCourse: aCVGCourse [ 
	
]

{ #category : #generation }
CVGGenerator >> generateHeader: aCVGHeader [ 
	| writer |
	writer := self newWriterFor: aCVGHeader.
	writer div: 'profile'.
	writer div: 'profile-picture'.
	writer image: (self imageDirectory, aCVGHeader photo).
	writer closeDiv.
	writer div: 'profile-info'.
	writer title: (self translated: aCVGHeader title) h: 'h5' class: 'title-name'.
	writer writeNewLine.
	writer title: ((self translated: aCVGHeader rank), ' ', aCVGHeader institution) h: 'h5' class: 'title-name'.
	"writer writeNewLine.
	writer writeUrl: aCVGHeader team second labeled: aCVGHeader team first. 
	writer writeNewLine.
	writer writeUrl: aCVGHeader lab second labeled: aCVGHeader lab first. "
	writer closeDiv.
	writer closeDiv

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
CVGGenerator >> generateResearch: aCVGResearch [ 

]

{ #category : #generation }
CVGGenerator >> generateSection: aSection [
	| writer |
	self resetStream.
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
	outputDic at: aSection put: stream contents
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

{ #category : #generation }
CVGGenerator >> generateStudent: aCVGStudent [ 

]

{ #category : #generation }
CVGGenerator >> generateTalk: t [
	| writer |
	writer := self newWriterFor: t.
	writer openItem.
	writer bold: t title.
	writer writeDotSpace.
	writer write: t description.
	writer writeCommaSpace.
	t date ifNotNil:[:date|
			writer write: date ddmmyyyy.
			writer writeCommaSpace.].
	writer write: t location.
	writer writeDotSpace.
	writer writeURL: t link.
	writer closeItem
]

{ #category : #generation }
CVGGenerator >> generateWorkStudy: aCVGWorkStudy [ 

]

{ #category : #initialization }
CVGGenerator >> html [
	writerClass := CVGSimpleHtmlWriter
]

{ #category : #generation }
CVGGenerator >> htmlPagePostface [
	^'</div></body></html>'
]

{ #category : #generation }
CVGGenerator >> htmlPagePreamble [
	^'<!DOCTYPE html>
	<html>
	<head>
	<meta charset="utf-8">
	<title>Dr. Steven Costiou - CV</title>
	<meta name="description" content="">
	<meta name="author" content="">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="//fonts.googleapis.com/css?family=Raleway:400,300,600" rel="stylesheet" type="text/css">
	<link rel="stylesheet" href="css/normalize.css"> <link rel="stylesheet" href="css/skeleton.css"> 	<link rel="stylesheet" href="styles/main-s.css">
	<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
	<link rel="icon" type="image/png" href="images/favicon.png">
	</head>
	<body> 
	<div class="container">'
]

{ #category : #accessing }
CVGGenerator >> imageDirectory [
	^'images/'
]

{ #category : #initialization }
CVGGenerator >> initialize [
	outputDic := Dictionary new
]

{ #category : #initialization }
CVGGenerator >> model: aCVGCurriculum [
	model := aCVGCurriculum 
]

{ #category : #streams }
CVGGenerator >> newStream [
	^ WriteStream on: String new
]

{ #category : #writers }
CVGGenerator >> newWriterFor: aCVGElement [
	^ (writerClass for: aCVGElement) on: self stream
]

{ #category : #streams }
CVGGenerator >> resetStream [
	stream := self newStream
]

{ #category : #streams }
CVGGenerator >> stream [
	^ stream ifNil: [ stream := self newStream ]
]

{ #category : #accessing }
CVGGenerator >> translated [
	^ translated ifNil:[translated := false]
]

{ #category : #generation }
CVGGenerator >> translated: anArray [
	self translated ifTrue:[^anArray second].
	^anArray first
]
