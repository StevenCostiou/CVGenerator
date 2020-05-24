"
I represent journals publication type
"
Class {
	#name : #CVGJournal,
	#superclass : #CVGPublicationType,
	#category : #'CVGenerator-elements - types'
}

{ #category : #testing }
CVGJournal >> isJournal [
	^ true
]

{ #category : #'accessing - defaults' }
CVGJournal >> typeKey [
	^#journal
]

{ #category : #'accessing - defaults' }
CVGJournal >> typeName [
	^'Journals'
]
