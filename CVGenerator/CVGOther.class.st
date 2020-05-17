"
I represent other publication type
"
Class {
	#name : #CVGOther,
	#superclass : #CVGPublicationType,
	#category : #'CVGenerator-publications'
}

{ #category : #testing }
CVGOther >> isOther [
	^ true
]

{ #category : #'accessing - defaults' }
CVGOther >> publicationTypeKey [
	^#other
]

{ #category : #'accessing - defaults' }
CVGOther >> publicationTypeName [
	^'Other'
]
