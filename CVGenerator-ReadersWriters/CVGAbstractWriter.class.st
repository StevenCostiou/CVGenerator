"
I am the abstract CVG exporter.
I define the API my subclasses must implement to export CVG elements.
"
Class {
	#name : #CVGAbstractWriter,
	#superclass : #Object,
	#instVars : [
		'stream'
	],
	#category : #'CVGenerator-ReadersWriters-Writers'
}

{ #category : #testing }
CVGAbstractWriter class >> isHTML [
	^false
]

{ #category : #'instance creation' }
CVGAbstractWriter class >> on: aStream [
	^self new on: aStream
]

{ #category : #emphasis }
CVGAbstractWriter >> bold: aString [
	self subclassResponsibility 
]

{ #category : #lists }
CVGAbstractWriter >> closeItem [
	self subclassResponsibility 
]

{ #category : #lists }
CVGAbstractWriter >> closeItemList [
	self subclassResponsibility 
]

{ #category : #accessing }
CVGAbstractWriter >> contents [
	^stream contents
]

{ #category : #initialization }
CVGAbstractWriter >> initialize [
	super initialize.
	stream := WriteStream on: String new
]

{ #category : #emphasis }
CVGAbstractWriter >> italic: aString [
	self subclassResponsibility 
]

{ #category : #'instance creation' }
CVGAbstractWriter >> on: aStream [
	stream := aStream
]

{ #category : #lists }
CVGAbstractWriter >> openItem [
	self subclassResponsibility 
]

{ #category : #lists }
CVGAbstractWriter >> openItemList [
	self startUnorderedList  
]

{ #category : #sections }
CVGAbstractWriter >> section: aString [
	self subclassResponsibility 
]

{ #category : #sections }
CVGAbstractWriter >> subSection: aString [
	self subclassResponsibility 
]

{ #category : #sections }
CVGAbstractWriter >> subsubSection: aString [
	self subclassResponsibility 
]

{ #category : #urls }
CVGAbstractWriter >> url: url image: imageUrl [
	self subclassResponsibility 
]

{ #category : #urls }
CVGAbstractWriter >> url: aString labeled: aName [
	self subclassResponsibility 
]

{ #category : #writing }
CVGAbstractWriter >> write: aString [
	stream << aString
]

{ #category : #export }
CVGAbstractWriter >> writeAndExport: aGenerator [
	self subclassResponsibility 
]

{ #category : #helpers }
CVGAbstractWriter >> writeComma [
	stream << $,
]

{ #category : #helpers }
CVGAbstractWriter >> writeCommaSpace [
	self writeComma.
	self writeSpace
]

{ #category : #helpers }
CVGAbstractWriter >> writeCommaSpace: aString [
	aString isEmpty ifTrue:[^self].
	stream << aString.
	self writeCommaSpace
]

{ #category : #helpers }
CVGAbstractWriter >> writeDot [
	stream << $.
]

{ #category : #helpers }
CVGAbstractWriter >> writeDotSpace [
	self writeDot.
	self writeSpace
]

{ #category : #helpers }
CVGAbstractWriter >> writeDotSpace: aString [
	aString isEmpty ifTrue:[^self].
	stream << aString.
	self writeDotSpace
]

{ #category : #helpers }
CVGAbstractWriter >> writeNewLine [
	self subclassResponsibility 
]

{ #category : #helpers }
CVGAbstractWriter >> writeSpace [
	stream space
]

{ #category : #writing }
CVGAbstractWriter >> writeURL: aString [
	(#(nil '') includes: aString)
		ifTrue: [ ^ self ].
	self url: aString labeled: '(pdf)'
]
