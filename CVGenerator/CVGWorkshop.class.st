"
I represent workshops publication type
"
Class {
	#name : #CVGWorkshop,
	#superclass : #CVGPublicationType,
	#category : #'CVGenerator-elements - types'
}

{ #category : #testing }
CVGWorkshop >> isWorkshop [
	^true
]

{ #category : #'accessing - defaults' }
CVGWorkshop >> typeKey [
	^#workshop
]

{ #category : #'accessing - defaults' }
CVGWorkshop >> typeName [
	^#('Workshops' 'Workshops')
]
