"
I'm an html exporter for CVG documents
"
Class {
	#name : #CVGHtmlWriter,
	#superclass : #CVGAbstractWriter,
	#category : #'CVGenerator-ReadersWriters-Writers'
}

{ #category : #'instance creation' }
CVGHtmlWriter class >> for: aCVGElement [
	^aCVGElement htmlWriterClass 
]

{ #category : #emphasis }
CVGHtmlWriter >> bold: aString [
	|str|
	str := WriteStream on: String new.
	str << '<b>'.
	str << aString.
	str << '</b>'.
	stream << str contents
]

{ #category : #emphasis }
CVGHtmlWriter >> boldBlue: aString [
	|str|
	str := WriteStream on: String new.
	str << '<i class="blue-font">'.
	str << aString.
	str << '</i>'.
	stream << str contents
]

{ #category : #lists }
CVGHtmlWriter >> closeItem [
	stream << '</li>'
	
]

{ #category : #lists }
CVGHtmlWriter >> closeItemList [
	stream << '</'.
	stream << self itemListMark.
	stream <<'>'.
	stream cr
]

{ #category : #emphasis }
CVGHtmlWriter >> italic: aString [
	stream << '<i>'.
	stream << aString.
	stream << '</i>'
]

{ #category : #lists }
CVGHtmlWriter >> itemListMark [
	^'ul'
]

{ #category : #lists }
CVGHtmlWriter >> openItem [
	stream << '<li>'
	
]

{ #category : #lists }
CVGHtmlWriter >> openItemList [
	stream << '<'.
	stream << self itemListMark.
	stream <<'>'.
	stream cr
]

{ #category : #sections }
CVGHtmlWriter >> section: aString [
	self title: aString h: 4 class: nil
]

{ #category : #beacons }
CVGHtmlWriter >> span: aString class: aClass [
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
CVGHtmlWriter >> subSection: aString [
	self title: aString h: 5 class: nil
]

{ #category : #'html - titles' }
CVGHtmlWriter >> title: aString h: level class: class [
	stream << '<h'.
	stream << level printString.
	class
		ifNotNil: [ stream space.
			stream << 'class="'.
			stream << class.
			stream << '"' ].
	stream << '>'.
	stream << aString.
	stream << '</h'.
	stream << level printString.
	stream << '>'
]

{ #category : #links }
CVGHtmlWriter >> url: aString labeled: aName [
	|str|
	str := WriteStream on: String new.
	str << '<a href="'.
	str << aString.
	str << '">'.
	str << (aName ifNil:[aString]).
	str << '</a>'.
	^str contents
	
	
]

{ #category : #helpers }
CVGHtmlWriter >> writeNewLine [
	 stream << '<br>'
]
