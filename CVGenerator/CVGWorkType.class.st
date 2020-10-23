Class {
	#name : #CVGWorkType,
	#superclass : #CVGWorkStudyType,
	#category : #'CVGenerator-elements - types'
}

{ #category : #testing }
CVGWorkType >> isWorkExperience [
	^true
]

{ #category : #'accessing - defaults' }
CVGWorkType >> typeKey [
	^#work
]

{ #category : #'accessing - defaults' }
CVGWorkType >> typeName [
	^'Work experience'
]
