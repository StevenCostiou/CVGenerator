Class {
	#name : #CVGAdditionalWorkDetailType,
	#superclass : #CVGWorkStudyType,
	#category : #'CVGenerator-elements - types'
}

{ #category : #'accessing - defaults' }
CVGAdditionalWorkDetailType >> isAdditionalWorkDetail [
	^true
]

{ #category : #'accessing - defaults' }
CVGAdditionalWorkDetailType >> typeKey [
	^#additionalWork
]

{ #category : #'accessing - defaults' }
CVGAdditionalWorkDetailType >> typeName [
	^'Additional work details'
]
