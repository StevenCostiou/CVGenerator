Class {
	#name : #CVGWorkStudyType,
	#superclass : #CVGElementType,
	#category : #'CVGenerator-elements - types'
}

{ #category : #'as yet unclassified' }
CVGWorkStudyType class >> studies [
	^ CVGStudyType new
]

{ #category : #'as yet unclassified' }
CVGWorkStudyType class >> work [
	^ CVGWorkType new
]

{ #category : #testing }
CVGWorkStudyType >> isStudy [
	^false
]

{ #category : #testing }
CVGWorkStudyType >> isWorkExperience [
	^false
]
