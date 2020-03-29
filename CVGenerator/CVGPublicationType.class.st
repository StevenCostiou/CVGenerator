"
I represent the abstract type of a publication.
"
Class {
	#name : #CVGPublicationType,
	#superclass : #Object,
	#category : #CVGenerator
}

{ #category : #'instance creation' }
CVGPublicationType class >> book [
	^CVGBook new
]

{ #category : #'instance creation' }
CVGPublicationType class >> conference [
	^CVGConference new
]

{ #category : #'instance creation' }
CVGPublicationType class >> journal [
	^CVGJournal new
]

{ #category : #'instance creation' }
CVGPublicationType class >> other [
	^CVGOther new
]

{ #category : #'instance creation' }
CVGPublicationType class >> thesis [
	^CVGThesis new
]

{ #category : #'instance creation' }
CVGPublicationType class >> workshop [
	^CVGWorkshop new
]
