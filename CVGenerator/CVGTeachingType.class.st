Class {
	#name : #CVGTeachingType,
	#superclass : #CVGElementType,
	#category : #'CVGenerator-elements - types'
}

{ #category : #'as yet unclassified' }
CVGTeachingType class >> lecture [
	^CVGLecture new
]

{ #category : #testing }
CVGTeachingType >> isLecture [
	^self subclassResponsibility 
]
