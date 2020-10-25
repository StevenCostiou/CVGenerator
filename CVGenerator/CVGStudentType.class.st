Class {
	#name : #CVGStudentType,
	#superclass : #CVGElementType,
	#category : #'CVGenerator-elements - types'
}

{ #category : #'as yet unclassified' }
CVGStudentType class >> student [ 
	^self new
]

{ #category : #'accessing - defaults' }
CVGStudentType >> typeKey [
	^#student
]

{ #category : #'accessing - defaults' }
CVGStudentType >> typeName [
	^'Student'
]
