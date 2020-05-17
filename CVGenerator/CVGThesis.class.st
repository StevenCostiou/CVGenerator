"
I represent thesis publication type
"
Class {
	#name : #CVGThesis,
	#superclass : #CVGPublicationType,
	#category : #'CVGenerator-publications'
}

{ #category : #testing }
CVGThesis >> isThesis [
	^true
]

{ #category : #'accessing - defaults' }
CVGThesis >> publicationTypeKey [
	^#thesis
]

{ #category : #'accessing - defaults' }
CVGThesis >> publicationTypeName [
	^'Theses'
]
