Class {
	#name : #CVGStudent,
	#superclass : #CVGSectionElement,
	#instVars : [
		'description',
		'name',
		'yearStart',
		'level',
		'funding',
		'duration',
		'yearStop',
		'school',
		'academic',
		'supervision'
	],
	#category : #'CVGenerator-elements'
}

{ #category : #'as yet unclassified' }
CVGStudent class >> generate: section with: aGenerator using: writer [
	^aGenerator generateStudentSection: section with: writer
]

{ #category : #accessing }
CVGStudent class >> readerClass [
	^ CVGStudentReader
]

{ #category : #accessing }
CVGStudent >> academic [
	^ academic
]

{ #category : #accessing }
CVGStudent >> academic: anObject [
	academic := anObject
]

{ #category : #accessing }
CVGStudent >> description [
	^ description
]

{ #category : #accessing }
CVGStudent >> description: anObject [
	description := anObject
]

{ #category : #accessing }
CVGStudent >> duration [
	^ duration
]

{ #category : #accessing }
CVGStudent >> duration: anObject [
	duration := anObject
]

{ #category : #accessing }
CVGStudent >> funding [
	^ funding
]

{ #category : #accessing }
CVGStudent >> funding: anObject [
	funding := anObject
]

{ #category : #testing }
CVGStudent >> hasTag [
	
	^ #( 'MEM' 'ALT' 'PFE' ) includes: self tag
]

{ #category : #testing }
CVGStudent >> isEngineering [

	self isPhd ifTrue: [ ^ false ].
	^ self hasTag not or: [ self tag = 'ALT' ]
]

{ #category : #testing }
CVGStudent >> isMEM [

	^ self tag = 'MEM'
]

{ #category : #testing }
CVGStudent >> isPFE [

	^ self tag = 'PFE'
]

{ #category : #testing }
CVGStudent >> isPhd [

	^ self level = #phd
]

{ #category : #accessing }
CVGStudent >> level [
	^ level
]

{ #category : #accessing }
CVGStudent >> level: anObject [
	level := anObject
]

{ #category : #accessing }
CVGStudent >> name [
	^ name
]

{ #category : #accessing }
CVGStudent >> name: anObject [
	name := anObject
]

{ #category : #parsing }
CVGStudent >> parseDescription: aString [

	| rs tag |
	self hasTag ifFalse: [ ^ aString ].
	rs := aString readStream.
	tag := rs next: 3.

	(#( 'MEM' 'ALT' 'PFE' ) includes: tag) ifTrue: [ ^ rs upToEnd ].
	^ aString
]

{ #category : #accessing }
CVGStudent >> school [
	^ school
]

{ #category : #accessing }
CVGStudent >> school: anObject [
	school := anObject
]

{ #category : #accessing }
CVGStudent >> supervision [
	^ supervision
]

{ #category : #accessing }
CVGStudent >> supervision: anObject [
	supervision := anObject
]

{ #category : #accessing }
CVGStudent >> tag [
	self description ifEmpty: [ ^self title ].
	^self description first readStream upTo: $$.
	
]

{ #category : #accessing }
CVGStudent >> yearStart [
	^ yearStart
]

{ #category : #accessing }
CVGStudent >> yearStart: anObject [
	yearStart := anObject
]

{ #category : #accessing }
CVGStudent >> yearStop [
	^ yearStop
]

{ #category : #accessing }
CVGStudent >> yearStop: anObject [
	yearStop := anObject
]
