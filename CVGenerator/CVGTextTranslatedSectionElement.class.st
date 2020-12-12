Class {
	#name : #CVGTextTranslatedSectionElement,
	#superclass : #CVGSectionElement,
	#instVars : [
		'text'
	],
	#category : #'CVGenerator-elements'
}

{ #category : #accessing }
CVGTextTranslatedSectionElement class >> readerClass [
	^ CVGAdditionalTeachingReader 
]

{ #category : #accessing }
CVGTextTranslatedSectionElement >> text [
	^ text
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
	^title 
]

{ #category : #accessing }
CVGTextTranslatedSectionElement >> titleEnglish [ 
	^title second 
]
