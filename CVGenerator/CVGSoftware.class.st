"
I represent a software artefact.

type = developer or contributor
"
Class {
	#name : #CVGSoftware,
	#superclass : #CVGSectionElement,
	#instVars : [
		'yearStart',
		'yearStop',
		'description',
		'image',
		'link'
	],
	#category : #'CVGenerator-elements'
}

{ #category : #accessing }
CVGSoftware >> description [
	^ description
]

{ #category : #accessing }
CVGSoftware >> description: anObject [
	description := anObject
]

{ #category : #accessing }
CVGSoftware >> image [
	^ image
]

{ #category : #accessing }
CVGSoftware >> image: anObject [
	image := anObject
]

{ #category : #accessing }
CVGSoftware >> link [
	^ link
]

{ #category : #accessing }
CVGSoftware >> link: anObject [
	link := anObject
]

{ #category : #accessing }
CVGSoftware >> yearStart [
	^ yearStart
]

{ #category : #accessing }
CVGSoftware >> yearStart: anObject [
	yearStart := anObject
]

{ #category : #accessing }
CVGSoftware >> yearStop [
	^ yearStop
]

{ #category : #accessing }
CVGSoftware >> yearStop: anObject [
	yearStop := anObject
]
