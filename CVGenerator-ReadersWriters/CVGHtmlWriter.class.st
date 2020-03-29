"
I'm an html exporter for CVG documents
"
Class {
	#name : #CVGHtmlWriter,
	#superclass : #CVGAbstractWriter,
	#category : #'CVGenerator-ReadersWriters-Writers'
}

{ #category : #emphasis }
CVGHtmlWriter >> bold: aString [
	|str|
	str := WriteStream on: String new.
	str << '<b>'.
	str << aString.
	str << '</b>'.
	^str contents
]

{ #category : #lists }
CVGHtmlWriter >> closeItem [
	stream << '</ul>'
	
]

{ #category : #emphasis }
CVGHtmlWriter >> italic: aString [
	|str|
	str := WriteStream on: String new.
	str << '<i>'.
	str << aString.
	str << '</i>'.
	^str contents
]

{ #category : #lists }
CVGHtmlWriter >> openItem [
	stream << '<ul>'
	
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
