Class {
	#name : #CVGTextTranslatedSectionElement,
	#superclass : #CVGSectionElement,
	#instVars : [
		'text'
	],
	#category : #'CVGenerator-elements'
}

{ #category : #'as yet unclassified' }
CVGTextTranslatedSectionElement class >> generate: section with: aGenerator using: writer [
	^aGenerator generatePastTeachingsSection: section with: writer
]

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
