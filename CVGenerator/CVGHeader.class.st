Class {
	#name : #CVGHeader,
	#superclass : #CVGSectionElement,
	#instVars : [
		'rank',
		'team',
		'lab',
		'institution',
		'photo'
	],
	#category : #'CVGenerator-elements'
}

{ #category : #accessing }
CVGHeader class >> readerClass [
	^ CVGHeaderReader
]

{ #category : #accessing }
CVGHeader >> institution [
	^ institution
]

{ #category : #accessing }
CVGHeader >> institution: anObject [
	institution := anObject
]

{ #category : #accessing }
CVGHeader >> lab [
	^ lab
]

{ #category : #accessing }
CVGHeader >> lab: anObject [
	lab := anObject
]

{ #category : #accessing }
CVGHeader >> labName [
	^lab first
]

{ #category : #accessing }
CVGHeader >> labURL [
	^lab second
]

{ #category : #accessing }
CVGHeader >> photo [
	^ photo
]

{ #category : #accessing }
CVGHeader >> photo: anObject [
	photo := anObject
]

{ #category : #accessing }
CVGHeader >> rank [
	^ rank first
]

{ #category : #accessing }
CVGHeader >> rank: anObject [
	rank := anObject
]

{ #category : #accessing }
CVGHeader >> rankEnglish [
	^ rank second
]

{ #category : #accessing }
CVGHeader >> team [
	^ team
]

{ #category : #accessing }
CVGHeader >> team: anObject [
	team := anObject
]

{ #category : #accessing }
CVGHeader >> teamName [
	^ team first
]

{ #category : #accessing }
CVGHeader >> teamURL [
	^ team second
]

{ #category : #accessing }
CVGHeader >> title [ 
	 ^title first
]

{ #category : #accessing }
CVGHeader >> titleEnglish [
	 ^title second
]
