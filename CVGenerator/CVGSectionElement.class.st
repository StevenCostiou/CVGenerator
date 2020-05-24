"
I represent a section element or sub-elements.
"
Class {
	#name : #CVGSectionElement,
	#superclass : #Object,
	#instVars : [
		'type',
		'title'
	],
	#category : #'CVGenerator-elements'
}

{ #category : #accessing }
CVGSectionElement class >> htmlWriterClass [
	^ CVGHtmlWriter 
]

{ #category : #accessing }
CVGSectionElement class >> readerClass [
	^ self subclassResponsibility
]

{ #category : #'data sorting' }
CVGSectionElement class >> sortedElements: flattenedData [
	^flattenedData
	
	
]

{ #category : #accessing }
CVGSectionElement >> htmlWriterClass [
	^ self class htmlWriterClass
]

{ #category : #accessing }
CVGSectionElement >> title [
	^ title
]

{ #category : #accessing }
CVGSectionElement >> title: anObject [
	title := anObject
]

{ #category : #accessing }
CVGSectionElement >> type [
	^ type
]

{ #category : #accessing }
CVGSectionElement >> type: anObject [
	type := anObject
]
