Class {
	#name : #CVGIntroType,
	#superclass : #CVGElementType,
	#category : #'CVGenerator-elements - types'
}

{ #category : #pages }
CVGIntroType class >> intro [
	^self new
]

{ #category : #'accessing - defaults' }
CVGIntroType >> typeKey [
	^#intro
]

{ #category : #'accessing - defaults' }
CVGIntroType >> typeName [
	^'Introduction'
]
