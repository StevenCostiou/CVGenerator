Class {
	#name : #CVGElementType,
	#superclass : #Object,
	#category : #'CVGenerator-elements - types'
}

{ #category : #'accessing structure variables' }
CVGElementType class >> type: aSymbol [
	^self perform: aSymbol
]

{ #category : #'accessing - defaults' }
CVGElementType >> typeKey [
	^self subclassResponsibility 
]

{ #category : #'accessing - defaults' }
CVGElementType >> typeName [
	self subclassResponsibility 
]
