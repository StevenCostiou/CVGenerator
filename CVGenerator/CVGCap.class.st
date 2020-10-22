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
