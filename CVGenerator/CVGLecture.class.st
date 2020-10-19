Class {
	#name : #CVGLecture,
	#superclass : #CVGTeachingType,
	#category : #'CVGenerator-elements - types'
}

{ #category : #testing }
CVGLecture >> isLecture [
	^true
]

{ #category : #'accessing - defaults' }
CVGLecture >> typeKey [
	^#lecture
]

{ #category : #'accessing - defaults' }
CVGLecture >> typeName [
	^'Lecture'
]
