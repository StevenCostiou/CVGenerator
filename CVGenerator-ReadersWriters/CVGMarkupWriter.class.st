Class {
	#name : #CVGMarkupWriter,
	#superclass : #CVGAbstractWriter,
	#instVars : [
		'markupStack'
	],
	#category : #'CVGenerator-ReadersWriters-Writers'
}

{ #category : #lists }
CVGMarkupWriter >> closeItem [
	self closeMarkup 
]

{ #category : #lists }
CVGMarkupWriter >> closeItemList [
	self stopUnorderedList 
]

{ #category : #lists }
CVGMarkupWriter >> closeListItem [
	self closeMarkup
]

{ #category : #markup }
CVGMarkupWriter >> closeMarkup [
	self subclassResponsibility 
]

{ #category : #tables }
CVGMarkupWriter >> closeRow [
	self closeMarkup 
]

{ #category : #tables }
CVGMarkupWriter >> closeTable [
	self closeMarkup.
	self closeMarkup
]

{ #category : #markup }
CVGMarkupWriter >> div: aString [ 
]

{ #category : #emphasis }
CVGMarkupWriter >> image: aString [ 
	self subclassResponsibility 
]

{ #category : #markup }
CVGMarkupWriter >> image: aString class: cssClass border: border alt: url [

	self image: aString
]

{ #category : #initialization }
CVGMarkupWriter >> initialize [
	super initialize.
	markupStack := Stack new
]

{ #category : #emphasis }
CVGMarkupWriter >> listItem [
	self subclassResponsibility 
]

{ #category : #lists }
CVGMarkupWriter >> listItem: aString [
	self openMarkup: self listItem.
	stream << aString.
	self closeMarkup 
	
]

{ #category : #tables }
CVGMarkupWriter >> newTable [
	self subclassResponsibility 
]

{ #category : #tables }
CVGMarkupWriter >> newTableOfSize: anInteger [
	self newTable
]

{ #category : #lists }
CVGMarkupWriter >> openItem [
	self openMarkup: self listItem
]

{ #category : #lists }
CVGMarkupWriter >> openListItem [
	self openMarkup: self listItem
	
]

{ #category : #markup }
CVGMarkupWriter >> openMarkup: aMarkup [
	self writeMarkup: aMarkup.
	markupStack push: aMarkup
]

{ #category : #emphasis }
CVGMarkupWriter >> openMarkup: aMarkup class: aClass [

	self openMarkup: aMarkup
]

{ #category : #emphasis }
CVGMarkupWriter >> orderedList [
	self subclassResponsibility 
]

{ #category : #writing }
CVGMarkupWriter >> simpleBlue: aString [
	^self subclassResponsibility 
]

{ #category : #writing }
CVGMarkupWriter >> simpleRed: aString [
	^self subclassResponsibility 
]

{ #category : #lists }
CVGMarkupWriter >> startOrderedList [
	self openMarkup: self orderedList 
	
]

{ #category : #lists }
CVGMarkupWriter >> startUnorderedList [
	self openMarkup: self unorderedList 
	
]

{ #category : #lists }
CVGMarkupWriter >> stopOrderedList [
	self closeMarkup
]

{ #category : #lists }
CVGMarkupWriter >> stopUnorderedList [
	self closeMarkup
	
]

{ #category : #emphasis }
CVGMarkupWriter >> table [
	self subclassResponsibility 
]

{ #category : #emphasis }
CVGMarkupWriter >> tableBody [
	self subclassResponsibility 
]

{ #category : #emphasis }
CVGMarkupWriter >> tableColumn: contents [
	self subclassResponsibility 
]

{ #category : #emphasis }
CVGMarkupWriter >> tableColumn: contents class: aStyle [
	self tableColumn: '\textcolor{ceruleanblue}{', contents, '}'
]

{ #category : #emphasis }
CVGMarkupWriter >> tableHeader: contents [
	self subclassResponsibility 
]

{ #category : #emphasis }
CVGMarkupWriter >> tableRow [
	self subclassResponsibility 
]

{ #category : #emphasis }
CVGMarkupWriter >> td [
	self subclassResponsibility 
]

{ #category : #helpers }
CVGMarkupWriter >> text: aString [
	 stream << aString
]

{ #category : #emphasis }
CVGMarkupWriter >> th [
	self subclassResponsibility 
]

{ #category : #emphasis }
CVGMarkupWriter >> title: title h: level [
	self subclassResponsibility 
]

{ #category : #emphasis }
CVGMarkupWriter >> tr [
	self subclassResponsibility 
]

{ #category : #emphasis }
CVGMarkupWriter >> unorderedList [
	self subclassResponsibility 
]

{ #category : #emphasis }
CVGMarkupWriter >> writeContributionNumbers: anInteger [
	
]

{ #category : #markup }
CVGMarkupWriter >> writeMarkup: aMarkup [
	self subclassResponsibility 
]

{ #category : #markup }
CVGMarkupWriter >> writeMarkup: aMarkup class: aClass [
	self writeMarkup: aMarkup  
]

{ #category : #writing }
CVGMarkupWriter >> writeNewLine [
	^self subclassResponsibility 
]

{ #category : #writing }
CVGMarkupWriter >> writeSpace [
	^self subclassResponsibility 
]

{ #category : #links }
CVGMarkupWriter >> writeUrl: url image: imageUrl [
	stream << (self url: url image: imageUrl)
	
	
]

{ #category : #links }
CVGMarkupWriter >> writeUrl: aString labeled: aName [
	stream << (self url: aString labeled: aName )
	
	
]
