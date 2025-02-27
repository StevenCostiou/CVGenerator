Class {
	#name : #CVGLatexContributionWriter,
	#superclass : #CVGLatexWriter,
	#category : #'CVGenerator-ReadersWriters-Writers'
}

{ #category : #formatting }
CVGLatexContributionWriter >> bold: aString [
	self writeText: aString inMarkup: CVGLatexMarkupElement red
]

{ #category : #lists }
CVGLatexContributionWriter >> openItemList [
	self startOrderedList 
]

{ #category : #writing }
CVGLatexContributionWriter >> writeContributionNumbers: anInteger [
"	self text: anInteger printString.
	self text: Character space asString.
	self text: 'contributions.'"
]

{ #category : #writing }
CVGLatexContributionWriter >> writeContributionTitle: aCVGSection [

	self subSection: aCVGSection title 
]
