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

{ #category : #emphasis }
CVGAbstractWriter >> bold: aString [
	self subclassResponsibility 
]

{ #category : #lists }
CVGAbstractWriter >> closeItem [
	self subclassResponsibility 
]

{ #category : #initialization }
CVGAbstractWriter >> initialize [
	self flag: 'change String new by target on disk'.
	stream := WriteStream on: String new
]

{ #category : #emphasis }
CVGAbstractWriter >> italic: aString [
	self subclassResponsibility 
]

{ #category : #lists }
CVGAbstractWriter >> openItem [
	self subclassResponsibility 
]

{ #category : #urls }
CVGAbstractWriter >> url: aString labeled: aName [
	self subclassResponsibility 
]

{ #category : #writing }
CVGAbstractWriter >> writeAuthors: authors [
	authors
		do: [ :author | 
			| formattedAuthor |
			formattedAuthor := author isSelf
				ifTrue: [ self bold: author fullName ]
				ifFalse: [ author fullName ].
			author = authors last
				ifTrue: [ self writeDotSpace: formattedAuthor ]
				ifFalse: [ self writeCommaSpace: formattedAuthor ] ]
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

{ #category : #writing }
CVGAbstractWriter >> writePublication: aPublication [
	self openItem.
	stream << (self bold: aPublication title).
	self writeDotSpace.
	self writeAuthors: aPublication authors.
	self writeDotSpace: aPublication publisher.
	self writeDotSpace: aPublication year printString.
	self writeURL: aPublication link.
	self closeItem
]

{ #category : #helpers }
CVGAbstractWriter >> writeSpace [
	stream space
]

{ #category : #writing }
CVGAbstractWriter >> writeURL: aPublicationURL [
	(#(nil '') includes: aPublicationURL) ifTrue:[^self].
	stream << (self url: aPublicationURL labeled: '(pdf)')
]
