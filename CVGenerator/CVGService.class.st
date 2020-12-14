Class {
	#name : #CVGService,
	#superclass : #CVGSectionElement,
	#instVars : [
		'medium',
		'acronym',
		'years',
		'url'
	],
	#category : #'CVGenerator-elements'
}

{ #category : #'as yet unclassified' }
CVGService class >> generate: section with: aGenerator using: writer [
	^aGenerator generateServiceSection: section with: writer
]

{ #category : #accessing }
CVGService class >> readerClass [
	^ CVGServiceReader
]

{ #category : #accessing }
CVGService >> acronym [
	^ acronym
]

{ #category : #accessing }
CVGService >> acronym: anObject [
	acronym := anObject
]

{ #category : #accessing }
CVGService >> medium [
	^ medium
]

{ #category : #accessing }
CVGService >> medium: anObject [
	medium := anObject
]

{ #category : #accessing }
CVGService >> url [
	^ url
]

{ #category : #accessing }
CVGService >> url: anObject [
	url := anObject
]

{ #category : #accessing }
CVGService >> years [
	^ years
]

{ #category : #accessing }
CVGService >> years: anObject [
	years := anObject
]
