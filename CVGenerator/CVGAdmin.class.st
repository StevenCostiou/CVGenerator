Class {
	#name : #CVGAdmin,
	#superclass : #CVGSectionElement,
	#instVars : [
		'institute',
		'election',
		'years',
		'items'
	],
	#category : #'CVGenerator-elements'
}

{ #category : #'as yet unclassified' }
CVGAdmin class >> generate: section with: aGenerator using: writer [
	^aGenerator generateAdminSection: section with: writer
]

{ #category : #accessing }
CVGAdmin class >> readerClass [
	^ CVGAdminReader 
]

{ #category : #visiting }
CVGAdmin >> acceptGenerator: aCVGGenerator [
	type acceptGenerator: aCVGGenerator for: self 
]

{ #category : #accessing }
CVGAdmin >> election [
	^ election
]

{ #category : #accessing }
CVGAdmin >> election: anObject [
	election := anObject
]

{ #category : #accessing }
CVGAdmin >> institute [
	^ institute
]

{ #category : #accessing }
CVGAdmin >> institute: anObject [
	institute := anObject
]

{ #category : #accessing }
CVGAdmin >> items [
	^ items
]

{ #category : #accessing }
CVGAdmin >> items: anObject [
	items := anObject
]

{ #category : #accessing }
CVGAdmin >> years [
	^ years
]

{ #category : #accessing }
CVGAdmin >> years: anObject [
	years := anObject
]
