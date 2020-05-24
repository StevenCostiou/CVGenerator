"
I represent the abstract type of a publication.
"
Class {
	#name : #CVGPublicationType,
	#superclass : #CVGElementType,
	#category : #'CVGenerator-elements - types'
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

{ #category : #testing }
CVGPublicationType >> isBook [
	^false
]

{ #category : #testing }
CVGPublicationType >> isConference [
	^false
]

{ #category : #testing }
CVGPublicationType >> isJournal [
	^false
]

{ #category : #testing }
CVGPublicationType >> isOther [
	^false
]

{ #category : #testing }
CVGPublicationType >> isThesis [
	^false
]

{ #category : #testing }
CVGPublicationType >> isWorkshop [
	^false
]
