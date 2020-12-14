Class {
	#name : #CVGWorkStudy,
	#superclass : #CVGSectionElement,
	#instVars : [
		'institution',
		'stop',
		'start',
		'duration'
	],
	#category : #'CVGenerator-elements'
}

{ #category : #'as yet unclassified' }
CVGWorkStudy class >> generate: section with: aGenerator using: writer [
	^aGenerator generateCVSection: section with: writer
]

{ #category : #accessing }
CVGWorkStudy class >> readerClass [
	^ CVGWorkAndStudiesReader
]

{ #category : #accessing }
CVGWorkStudy >> duration [
	^ duration
]

{ #category : #accessing }
CVGWorkStudy >> duration: anObject [
	duration := anObject
]

{ #category : #accessing }
CVGWorkStudy >> institution [
	^ institution
]

{ #category : #accessing }
CVGWorkStudy >> institution: anObject [
	institution := anObject
]

{ #category : #accessing }
CVGWorkStudy >> start [
	^ start
]

{ #category : #accessing }
CVGWorkStudy >> start: anObject [
	start := anObject
]

{ #category : #accessing }
CVGWorkStudy >> stop [
	^ stop
]

{ #category : #accessing }
CVGWorkStudy >> stop: anObject [
	stop := anObject
]
