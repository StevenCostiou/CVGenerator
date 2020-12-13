Class {
	#name : #CVGAdmin,
	#superclass : #CVGSectionElement,
	#instVars : [
		'institute',
		'election',
		'years'
	],
	#category : #'CVGenerator-elements'
}

{ #category : #accessing }
CVGAdmin class >> readerClass [
	^ CVGAdminReader 
]

{ #category : #visiting }
CVGAdmin >> acceptGenerator: aCVGGenerator [
	aCVGGenerator generateAdmin: self 
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
CVGAdmin >> years [
	^ years
]

{ #category : #accessing }
CVGAdmin >> years: anObject [
	years := anObject
]
