"
I'm a simple html exporter for CVG documents models.
I use a stack to push and pop markup and a stream to write on it.
"
Class {
	#name : #CVGSimpleHtmlWriter,
	#superclass : #CVGAbstractWriter,
	#instVars : [
		'markupStack'
	],
	#category : #'CVGenerator-ReadersWriters-Writers'
}

{ #category : #'instance creation' }
CVGSimpleHtmlWriter class >> for: aCVGElement [
	^aCVGElement htmlWriterClass 
]

{ #category : #'html - emphasis' }
CVGSimpleHtmlWriter >> bold: aString [
	|str|
	str := WriteStream on: String new.
	str << '<b>'.
	str << aString.
	str << '</b>'.
	stream << str contents
]

{ #category : #'html - emphasis' }
CVGSimpleHtmlWriter >> boldBlue: aString [
	|str|
	str := WriteStream on: String new.
	str << '<i class="blue-font">'.
	str << aString.
	str << '</i>'.
	stream << str contents
]

{ #category : #markup }
CVGSimpleHtmlWriter >> closeDiv [
	self closeMarkup
]

{ #category : #lists }
CVGSimpleHtmlWriter >> closeItem [
	self closeMarkup 
]

{ #category : #lists }
CVGSimpleHtmlWriter >> closeItemList [
	self stopUnorderedList 
]

{ #category : #markup }
CVGSimpleHtmlWriter >> closeMarkup [
	self writeMarkup: '/' , markupStack pop
]

{ #category : #'html - tables' }
CVGSimpleHtmlWriter >> closeRow [
	self closeMarkup 
]

{ #category : #'html - tables' }
CVGSimpleHtmlWriter >> closeTable [
	self closeMarkup.
	self closeMarkup
]

{ #category : #markup }
CVGSimpleHtmlWriter >> div: aString [ 
	self openMarkup: 'div' class: aString
]

{ #category : #markup }
CVGSimpleHtmlWriter >> h1 [
	^'h1'
]

{ #category : #'html - titles' }
CVGSimpleHtmlWriter >> h1: title [
	self title: title h: self h1
]

{ #category : #markup }
CVGSimpleHtmlWriter >> h2 [
	^'h2'
]

{ #category : #'html - titles' }
CVGSimpleHtmlWriter >> h2: title [
	self title: title h: self h2
]

{ #category : #markup }
CVGSimpleHtmlWriter >> h3 [
	^'h3'
]

{ #category : #'html - titles' }
CVGSimpleHtmlWriter >> h3: title [
	self title: title h: self h3
]

{ #category : #markup }
CVGSimpleHtmlWriter >> h4 [
	^'h4'
]

{ #category : #'html - titles' }
CVGSimpleHtmlWriter >> h4: title [
	self title: title h: self h4
]

{ #category : #markup }
CVGSimpleHtmlWriter >> h5 [
	^'h5'
]

{ #category : #'html - titles' }
CVGSimpleHtmlWriter >> h5: title [
	self title: title h: self h5
]

{ #category : #markup }
CVGSimpleHtmlWriter >> h6 [
	^'h6'
]

{ #category : #'html - titles' }
CVGSimpleHtmlWriter >> h6: title [
	self title: title h: self h6
]

{ #category : #markup }
CVGSimpleHtmlWriter >> image: aString [ 
	stream << '<img src="'.
	stream << aString.
	stream << '">'
	
]

{ #category : #initialization }
CVGSimpleHtmlWriter >> initialize [
	super initialize.
	markupStack := Stack new
]

{ #category : #'html - emphasis' }
CVGSimpleHtmlWriter >> italic: aString [
	stream << '<i>'.
	stream << aString.
	stream << '</i>'
]

{ #category : #markup }
CVGSimpleHtmlWriter >> listItem [
	^'li'
]

{ #category : #'html - lists' }
CVGSimpleHtmlWriter >> listItem: aString [
	self openMarkup: self listItem.
	stream << aString.
	self closeMarkup 
	
]

{ #category : #'html - tables' }
CVGSimpleHtmlWriter >> newTable [
	self openMarkup: self table class: 'table'.
	self openMarkup: self tableBody
]

{ #category : #lists }
CVGSimpleHtmlWriter >> openItem [
	self openMarkup: self listItem
]

{ #category : #lists }
CVGSimpleHtmlWriter >> openItemList [
	self startUnorderedList 
]

{ #category : #markup }
CVGSimpleHtmlWriter >> openMarkup: aMarkup [
	self writeMarkup: aMarkup.
	markupStack push: aMarkup
]

{ #category : #markup }
CVGSimpleHtmlWriter >> openMarkup: aMarkup class: aClass [
	self writeMarkup: aMarkup class: aClass.
	markupStack push: aMarkup
]

{ #category : #markup }
CVGSimpleHtmlWriter >> orderedList [
	^'ol'
]

{ #category : #sections }
CVGSimpleHtmlWriter >> section: aString [
	self title: aString h: 'h4' class: nil
]

{ #category : #'html - emphasis' }
CVGSimpleHtmlWriter >> simpleBlue: aString [
	|str|
	str := WriteStream on: String new.
	str << '<span class="blue-font-2">'.
	str << aString.
	str << '</span>'.
	stream << str contents
]

{ #category : #'html - emphasis' }
CVGSimpleHtmlWriter >> simpleRed: aString [
	|str|
	str := WriteStream on: String new.
	str << '<span class="red-font">'.
	str << aString.
	str << '</span>'.
	stream << str contents
]

{ #category : #beacons }
CVGSimpleHtmlWriter >> span: aString class: aClass [
	stream << '<span'.
	aClass
		ifNotNil: [ stream space.
			stream << 'class="'.
			stream << aClass.
			stream << '"' ].
	stream << '>'.
	stream << aString.
	stream << '</span>'
]

{ #category : #'html - lists' }
CVGSimpleHtmlWriter >> startOrderedList [
	self openMarkup: self orderedList 
	
]

{ #category : #'html - lists' }
CVGSimpleHtmlWriter >> startUnorderedList [
	self openMarkup: self unorderedList 
	
]

{ #category : #'html - lists' }
CVGSimpleHtmlWriter >> stopOrderedList [
	self closeMarkup
]

{ #category : #'html - lists' }
CVGSimpleHtmlWriter >> stopUnorderedList [
	self closeMarkup
	
]

{ #category : #sections }
CVGSimpleHtmlWriter >> subSection: aString [
	self title: aString h: 'h5' class: 'blue-title'
]

{ #category : #markup }
CVGSimpleHtmlWriter >> table [
	^'table'
]

{ #category : #markup }
CVGSimpleHtmlWriter >> tableBody [
	^'tbody'
]

{ #category : #'html - tables' }
CVGSimpleHtmlWriter >> tableColumn: contents [
	self openMarkup: self td.
	stream << contents.
	self closeMarkup 
]

{ #category : #'html - tables' }
CVGSimpleHtmlWriter >> tableColumn: contents class: aStyle [
	self openMarkup: self td class: aStyle.
	stream << contents.
	self closeMarkup 
]

{ #category : #'html - tables' }
CVGSimpleHtmlWriter >> tableHeader: contents [
	self openMarkup: self th.
	stream << contents.
	self closeMarkup 
]

{ #category : #'html - tables' }
CVGSimpleHtmlWriter >> tableRow [
	self openMarkup: self tr
]

{ #category : #markup }
CVGSimpleHtmlWriter >> td [
	^'td'
]

{ #category : #helpers }
CVGSimpleHtmlWriter >> text: aString [
	 stream << aString
]

{ #category : #markup }
CVGSimpleHtmlWriter >> th [
	^'th'
]

{ #category : #'html - titles' }
CVGSimpleHtmlWriter >> title: title h: level [
	self openMarkup: level.
	self write: title.
	self closeMarkup
]

{ #category : #'html - titles' }
CVGSimpleHtmlWriter >> title: aString h: level class: class [
	class
		ifNil: [ self openMarkup: level ]
		ifNotNil: [ self openMarkup: level class: class ].
	self write: aString.
	self closeMarkup
]

{ #category : #markup }
CVGSimpleHtmlWriter >> tr [
	^'tr'
]

{ #category : #markup }
CVGSimpleHtmlWriter >> unorderedList [
	^'ul'
]

{ #category : #links }
CVGSimpleHtmlWriter >> url: aString labeled: aName [
	|str|
	str := WriteStream on: String new.
	str << '<a href="'.
	str << aString.
	str << '">'.
	str << (aName ifNil:[aString]).
	str << '</a>'.
	^str contents
	
	
]

{ #category : #sections }
CVGSimpleHtmlWriter >> writeContributionNumbers: anInteger [
]

{ #category : #markup }
CVGSimpleHtmlWriter >> writeMarkup: aMarkup [
	stream << '<'.
	stream << aMarkup.
	stream << '>'
]

{ #category : #markup }
CVGSimpleHtmlWriter >> writeMarkup: aMarkup class: aClass [
	stream << '<'.
	stream << aMarkup.
	stream << ' class="'.
	stream << aClass.
	stream << '">'
]

{ #category : #helpers }
CVGSimpleHtmlWriter >> writeNewLine [
	 stream << '</br>'
]

{ #category : #links }
CVGSimpleHtmlWriter >> writeUrl: aString labeled: aName [
	stream << (self url: aString labeled: aName )
	
	
]
