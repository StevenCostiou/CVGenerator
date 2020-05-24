"
I represent a CV section.
"
Class {
	#name : #CVGSection,
	#superclass : #Object,
	#instVars : [
		'type',
		'title',
		'dataPath',
		'data'
	],
	#category : #'CVGenerator-core'
}

{ #category : #accessing }
CVGSection >> data [
	^ data
]

{ #category : #accessing }
CVGSection >> data: anObject [
	data := anObject
]

{ #category : #accessing }
CVGSection >> dataPath [
	^ dataPath
]

{ #category : #accessing }
CVGSection >> dataPath: anObject [
	dataPath := anObject
]

{ #category : #paths }
CVGSection >> dataPathFilename [
	^dataPath, '.ston'
]

{ #category : #printing }
CVGSection >> printOn: aStream [
	aStream << title
]

{ #category : #accessing }
CVGSection >> sortedElements [
	^type sortedElements: data
]

{ #category : #accessing }
CVGSection >> title [
	^ title
]

{ #category : #accessing }
CVGSection >> title: anObject [
	title := anObject
]

{ #category : #accessing }
CVGSection >> type [
	^ type
]

{ #category : #accessing }
CVGSection >> type: anObject [
	type := anObject
]
