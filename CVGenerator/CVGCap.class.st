Class {
	#name : #CVGCap,
	#superclass : #CVGTextTranslatedSectionElement,
	#instVars : [
		'sectionType'
	],
	#category : #'CVGenerator-elements'
}

{ #category : #visiting }
CVGCap >> acceptGenerator: aCVGGenerator [
	aCVGGenerator generateCap: self
]

{ #category : #accessing }
CVGCap >> sectionType [
	^ sectionType
]

{ #category : #accessing }
CVGCap >> sectionType: anObject [
	sectionType := anObject
]
