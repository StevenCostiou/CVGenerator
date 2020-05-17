"
I represent books and booklets publication types
"
Class {
	#name : #CVGBook,
	#superclass : #CVGPublicationType,
	#category : #'CVGenerator-publications'
}

{ #category : #testing }
CVGBook >> isBook [
	^true
]

{ #category : #'accessing - defaults' }
CVGBook >> publicationTypeKey [
	^#book
]

{ #category : #'accessing - defaults' }
CVGBook >> publicationTypeName [
	^'Books'
]
