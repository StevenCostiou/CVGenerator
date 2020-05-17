"
I represent conferences publication type
"
Class {
	#name : #CVGConference,
	#superclass : #CVGPublicationType,
	#category : #'CVGenerator-publications'
}

{ #category : #testing }
CVGConference >> isConference [
	^ true
]

{ #category : #'accessing - defaults' }
CVGConference >> publicationTypeKey [
	^#conference
]

{ #category : #'accessing - defaults' }
CVGConference >> publicationTypeName [
	^'Conferences'
]
