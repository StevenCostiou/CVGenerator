Class {
	#name : #CVGLatexWriter,
	#superclass : #CVGMarkupWriter,
	#instVars : [
		'columnCounter',
		'tableSize'
	],
	#category : #'CVGenerator-ReadersWriters-Writers'
}

{ #category : #'instance creation' }
CVGLatexWriter class >> for: aCVGElement [ 
	^aCVGElement latexWriterClass 
]

{ #category : #emphasis }
CVGLatexWriter >> bold: aString [
	self writeText: aString inMarkup: CVGLatexMarkupElement bold
]

{ #category : #markup }
CVGLatexWriter >> closeMarkup [ 
	self writeMarkup: markupStack pop closingMarkup 
]

{ #category : #tables }
CVGLatexWriter >> closeRow [
	columnCounter := 0.
	stream << '\\'.
	stream cr
]

{ #category : #tables }
CVGLatexWriter >> closeSummaryTable [
	self closeMarkup.
	self cr.
	self closeMarkup 
]

{ #category : #emphasis }
CVGLatexWriter >> closeTable [
	self closeMarkup 
]

{ #category : #writing }
CVGLatexWriter >> cr [
	stream cr
]

{ #category : #markup }
CVGLatexWriter >> div: aString [
	self openMarkup: CVGLatexMarkupElement emptyMarkup
]

{ #category : #emphasis }
CVGLatexWriter >> image: aString [ 
]

{ #category : #emphasis }
CVGLatexWriter >> italic: aString [
	self writeText: aString inMarkup: CVGLatexMarkupElement italic
]

{ #category : #lists }
CVGLatexWriter >> listItem [
	^CVGLatexMarkupElement item 
]

{ #category : #tables }
CVGLatexWriter >> newSummaryTable [
	self openMarkup: CVGLatexMarkupElement summaryTable.
	self cr.
	self openMarkup: CVGLatexMarkupElement summaryTabular
]

{ #category : #tables }
CVGLatexWriter >> newTable [
	self openMarkup: self tabular
]

{ #category : #tables }
CVGLatexWriter >> newTableOfSize: anInteger [
	tableSize := anInteger.
	super newTableOfSize: anInteger
]

{ #category : #markup }
CVGLatexWriter >> openMarkup: aMarkup [
	self writeMarkup: aMarkup openingMarkup.
	markupStack push: aMarkup
]

{ #category : #lists }
CVGLatexWriter >> orderedList [
	^CVGLatexMarkupElement enumerate
]

{ #category : #sections }
CVGLatexWriter >> paragraph: aString [

	self
		writeSection: aString
		markup: CVGLatexMarkupElement paragraph
]

{ #category : #emphasis }
CVGLatexWriter >> red: aString [
	self writeText: aString inMarkup: CVGLatexMarkupElement red
]

{ #category : #sections }
CVGLatexWriter >> section: aString [
	stream cr.
	self writeSection: aString markup: CVGLatexMarkupElement section
]

{ #category : #sections }
CVGLatexWriter >> subSection: aString [

	stream cr.
	self writeSection: aString markup: CVGLatexMarkupElement subsection
]

{ #category : #sections }
CVGLatexWriter >> subSectionX: aString [

	stream cr.
	self writeSection: aString markup: CVGLatexMarkupElement subsectionX 
]

{ #category : #sections }
CVGLatexWriter >> subsubSection: aString [

	stream cr.
	self
		writeSection: aString
		markup: CVGLatexMarkupElement subsubsection
]

{ #category : #sections }
CVGLatexWriter >> subsubSectionX: aString [

	stream cr.
	self writeSection: aString markup: CVGLatexMarkupElement subsubsectionX 
]

{ #category : #tables }
CVGLatexWriter >> table [
	^CVGLatexMarkupElement table 
]

{ #category : #emphasis }
CVGLatexWriter >> tableBody [
	^CVGLatexMarkupElement tabular
]

{ #category : #tables }
CVGLatexWriter >> tableColumn: aString [

	columnCounter := columnCounter + 1.
	stream << aString.
	stream space.
	columnCounter < tableSize ifTrue: [ stream << '&' ].
	stream space
]

{ #category : #tables }
CVGLatexWriter >> tableHeader: aString [

	columnCounter := columnCounter + 1.
	self bold: aString.
	stream space.
	columnCounter < tableSize ifTrue: [ stream << '&' ].
	stream space
]

{ #category : #tables }
CVGLatexWriter >> tableRow [
	columnCounter := 0
]

{ #category : #accessing }
CVGLatexWriter >> tableSize: anObject [

	tableSize := anObject
]

{ #category : #tables }
CVGLatexWriter >> tabular [
	^CVGLatexMarkupElement tabular: tableSize 
]

{ #category : #accessing }
CVGLatexWriter >> text: aString [

	| text |
	(aString includesSubstring: '<i class="material-icons"') ifTrue:[^self].
	text := aString asString.
	[text includesSubstring: '<a href'] whileTrue: [ 
		| str wstr |
		str := text readStream.
		wstr := WriteStream on: String new.
		wstr << (str upToAll: '<a href="').
		wstr space.
		wstr << '\url{'.
		wstr << (str upTo: $").
		wstr << '}'.
		wstr space.
		str upToAll: 'a>'.
		wstr << str upToEnd.
		text := wstr contents.
	
 ].
	stream << text
]

{ #category : #emphasis }
CVGLatexWriter >> title: title h: level [
	self bold: title.
	self writeNewLine.
]

{ #category : #lists }
CVGLatexWriter >> unorderedList [ 
	^CVGLatexMarkupElement itemize
]

{ #category : #urls }
CVGLatexWriter >> url: url image: imageUrl [

	self writeText: url inMarkup: CVGLatexMarkupElement url
]

{ #category : #urls }
CVGLatexWriter >> url: aString labeled: aName [
	self writeText: aString inMarkup: CVGLatexMarkupElement url
]

{ #category : #writing }
CVGLatexWriter >> write: aString [
	self text: aString
]

{ #category : #export }
CVGLatexWriter >> writeAndExport: aGenerator [

	aGenerator generateAndExportLatex
]

{ #category : #markup }
CVGLatexWriter >> writeMarkup: aMarkupString [

	stream << aMarkupString
]

{ #category : #writing }
CVGLatexWriter >> writeNewLine [
	stream << CVGLatexMarkupElement newLine openingMarkup .
	stream cr
]

{ #category : #sections }
CVGLatexWriter >> writeSection: aString markup: aMarkup [

	stream cr.
	self writeText: aString inMarkup: aMarkup.
	stream cr
]

{ #category : #writing }
CVGLatexWriter >> writeSpace [
	stream << CVGLatexMarkupElement space openingMarkup 
]

{ #category : #markup }
CVGLatexWriter >> writeText: aString inMarkup: aMarkup [
	self openMarkup: aMarkup.
	self text: aString.
	self closeMarkup
]

{ #category : #writing }
CVGLatexWriter >> writeUrl: aString labeled: aName [

	self url: aString labeled: aName
]
