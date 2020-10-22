Class {
	#name : #CVGAtelier,
	#superclass : #CVGTextTranslatedSectionElement,
	#instVars : [
		'dateString'
	],
	#category : #'CVGenerator-elements'
}

{ #category : #visiting }
CVGAtelier >> acceptGenerator: aCVGGenerator [
	aCVGGenerator generateAtelier: self
]

{ #category : #accessing }
CVGAtelier >> dateString [
	^ dateString first
]

{ #category : #accessing }
CVGAtelier >> dateString: anObject [
	dateString := anObject
]

{ #category : #accessing }
CVGAtelier >> dateStringEnglish [
	^ dateString second
]
