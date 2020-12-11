"
I represent a section element or sub-elements.
"
Class {
	#name : #CVGSectionElement,
	#superclass : #Object,
	#instVars : [
		'type',
		'title',
		'over'
	],
	#category : #'CVGenerator-elements'
}

{ #category : #'as yet unclassified' }
CVGSectionElement class >> generate: section with: aGenerator using: writer [
	
]

{ #category : #accessing }
CVGSectionElement class >> htmlWriterClass [
	^ CVGSimpleHtmlWriter 
]

{ #category : #accessing }
CVGSectionElement class >> readerClass [
	^ self subclassResponsibility
]

{ #category : #'data sorting' }
CVGSectionElement class >> sortedElements: flattenedData [
	| types |
	types := (flattenedData collect: #type) asSet.
	^ (types
		collect: [ :t | t -> (flattenedData select: [ :d | d type = t ]) ])
		reject: [ :assoc | assoc value isEmpty ]
]

{ #category : #accessing }
CVGSectionElement >> htmlWriterClass [
	^ self class htmlWriterClass
]

{ #category : #accessing }
CVGSectionElement >> over [ 
	^over ifNil:[false]
]

{ #category : #accessing }
CVGSectionElement >> over: aBoolean [ 
	over := aBoolean
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
