"
I represent other publication type
"
Class {
	#name : #CVGOther,
	#superclass : #CVGPublicationType,
	#category : #'CVGenerator-elements - types'
}

{ #category : #testing }
CVGOther >> isOther [
	^ true
]

{ #category : #'accessing - defaults' }
CVGOther >> typeKey [
	^#other
]

{ #category : #'accessing - defaults' }
CVGOther >> typeName [
	^'Other'
]
