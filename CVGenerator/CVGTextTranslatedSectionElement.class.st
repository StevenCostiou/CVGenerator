Class {
	#name : #CVGTextTranslatedSectionElement,
	#superclass : #CVGSectionElement,
	#instVars : [
		'text'
	],
	#category : #'CVGenerator-elements'
}

{ #category : #accessing }
CVGTextTranslatedSectionElement >> text [
	^ text first
]

{ #category : #accessing }
CVGTextTranslatedSectionElement >> text: anObject [
	text := anObject
]

{ #category : #accessing }
CVGTextTranslatedSectionElement >> textEnglish [
	^ text second
]

{ #category : #accessing }
CVGTextTranslatedSectionElement >> title [ 
	^title first 
]

{ #category : #accessing }
CVGTextTranslatedSectionElement >> titleEnglish [ 
	^title second 
]
