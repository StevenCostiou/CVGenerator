Class {
	#name : #CVGStudyType,
	#superclass : #CVGWorkStudyType,
	#category : #'CVGenerator-elements - types'
}

{ #category : #'accessing - defaults' }
CVGStudyType >> isStudy [
	^true
]

{ #category : #'accessing - defaults' }
CVGStudyType >> typeKey [
	^#studies
]

{ #category : #'accessing - defaults' }
CVGStudyType >> typeName [
	^'Studies'
]
