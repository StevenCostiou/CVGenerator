"
I represent workshops publication type
"
Class {
	#name : #CVGWorkshop,
	#superclass : #CVGPublicationType,
	#category : #'CVGenerator-publications'
}

{ #category : #testing }
CVGWorkshop >> isWorkshop [
	^true
]

{ #category : #'accessing - defaults' }
CVGWorkshop >> publicationTypeKey [
	^#workshop
]

{ #category : #'accessing - defaults' }
CVGWorkshop >> publicationTypeName [
	^'Workshops'
]
