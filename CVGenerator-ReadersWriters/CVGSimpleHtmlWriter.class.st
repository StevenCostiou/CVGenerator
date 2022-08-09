"
I'm a simple html exporter for CVG documents models.
I use a stack to push and pop markup and a stream to write on it.
"
Class {
	#name : #CVGSimpleHtmlWriter,
	#superclass : #CVGMarkupWriter,
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
CVGSimpleHtmlWriter >> closeMarkup [
	self writeMarkup: '/' , markupStack pop
]

{ #category : #markup }
CVGSimpleHtmlWriter >> div: aString [ 
	self openMarkup: 'div' class: aString
]

{ #category : #public }
CVGSimpleHtmlWriter >> highlight: aString [
	
	stream << '<i class="material-icons md-18">military_tech</i>'.
	self bold: aString.
	stream << '<i class="material-icons md-18">military_tech</i>'.
	
	
	
]

{ #category : #markup }
CVGSimpleHtmlWriter >> image: aString [ 
	stream << '<img src="'.
	stream << aString.
	stream << '" alt="">'
	
]

{ #category : #markup }
CVGSimpleHtmlWriter >> image: aString class: cssClass border: border alt: url [
	stream << '<img '.
	stream << 'class="'.
	stream << cssClass.
	stream << '" '.
	stream << 'src="'.
	stream << aString.
	stream << '" border="'.
	stream << border printString.
	stream << '" alt="">'
	
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

{ #category : #'html - tables' }
CVGSimpleHtmlWriter >> newTable [
	self openMarkup: self table class: 'table'.
	self openMarkup: self tableBody
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

{ #category : #sections }
CVGSimpleHtmlWriter >> subSection: aString [
	self title: aString h: 'h5' class: 'blue-title'
]

{ #category : #sections }
CVGSimpleHtmlWriter >> subsubSection: aString [
	self title: aString h: 'h6' class: 'blue-title'
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
CVGSimpleHtmlWriter >> url: url image: imageUrl [
	|str|
	str := WriteStream on: String new.
	str << '<a href="'.
	str << url.
	str << '" target=_blank>'.
	str << '<img src="'.
	str << imageUrl.
	str << '" alt="">'.
	str << '</a>'.
	^str contents
	
	
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

{ #category : #export }
CVGSimpleHtmlWriter >> writeAndExport: aGenerator [

	aGenerator generateAndExportHtml
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

{ #category : #helpers }
CVGSimpleHtmlWriter >> writeSpace [
	 stream << ' '
]
