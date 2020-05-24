"
I represent thesis publication type
"
Class {
	#name : #CVGThesis,
	#superclass : #CVGPublicationType,
	#category : #'CVGenerator-elements - types'
}

{ #category : #testing }
CVGThesis >> isThesis [
	^true
]

{ #category : #'accessing - defaults' }
CVGThesis >> typeKey [
	^#thesis
]

{ #category : #'accessing - defaults' }
CVGThesis >> typeName [
	^'Theses'
]
