Class {
	#name : #CVGHeaderType,
	#superclass : #CVGElementType,
	#category : #'CVGenerator-elements - types'
}

{ #category : #'grammar - Header' }
CVGHeaderType class >> header [
	^self new
]

{ #category : #'accessing - defaults' }
CVGHeaderType >> typeKey [
	^#header
]

{ #category : #'accessing - defaults' }
CVGHeaderType >> typeName [
	^'Header'
]
