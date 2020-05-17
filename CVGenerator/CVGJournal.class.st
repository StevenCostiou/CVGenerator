"
I represent journals publication type
"
Class {
	#name : #CVGJournal,
	#superclass : #CVGPublicationType,
	#category : #'CVGenerator-publications'
}

{ #category : #testing }
CVGJournal >> isJournal [
	^ true
]

{ #category : #'accessing - defaults' }
CVGJournal >> publicationTypeKey [
	^#journal
]

{ #category : #'accessing - defaults' }
CVGJournal >> publicationTypeName [
	^'Journals'
]
