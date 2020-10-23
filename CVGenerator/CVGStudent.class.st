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
		'academic'
	],
	#category : #'CVGenerator-elements'
}

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

{ #category : #accessing }
CVGStudent >> school [
	^ school
]

{ #category : #accessing }
CVGStudent >> school: anObject [
	school := anObject
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
