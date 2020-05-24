"
I represent the abstract type of a software artefact.
"
Class {
	#name : #CVGSoftwareType,
	#superclass : #CVGElementType,
	#category : #'CVGenerator-elements - types'
}

{ #category : #'as yet unclassified' }
CVGSoftwareType class >> contributor [
	^CVGSoftwareContributor new
]

{ #category : #'as yet unclassified' }
CVGSoftwareType class >> developer [
	^CVGSoftwareDeveloper new
]

{ #category : #testing }
CVGSoftwareType >> isContributor [
	^false
]

{ #category : #testing }
CVGSoftwareType >> isDeveloper [
	^false
]
