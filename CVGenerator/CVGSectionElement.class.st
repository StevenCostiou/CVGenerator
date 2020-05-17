"
I represent a section element or sub-elements.
"
Class {
	#name : #CVGSectionElement,
	#superclass : #Object,
	#category : #'CVGenerator-publications'
}

{ #category : #accessing }
CVGSectionElement class >> readerClass [
	^ self subclassResponsibility
]
