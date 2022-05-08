Class {
	#name : #CVGLatexMarkupElement,
	#superclass : #Object,
	#instVars : [
		'openingMarkup',
		'closingMarkup',
		'markup'
	],
	#category : #'CVGenerator-ReadersWriters-Writers'
}

{ #category : #API }
CVGLatexMarkupElement class >> bold [
	^self markup: 'textbf'
]

{ #category : #'as yet unclassified' }
CVGLatexMarkupElement class >> emptyMarkup [
	^(self markup: '') closingMarkup: Character cr
]

{ #category : #API }
CVGLatexMarkupElement class >> enumerate [
	^(self markup: 'enumerate') beginEndMarkup 
]

{ #category : #API }
CVGLatexMarkupElement class >> italic [

	^ self markup: 'textit'
]

{ #category : #API }
CVGLatexMarkupElement class >> item [
	^(self markup: 'item') openingMarkup: '\item~'; closingMarkup: Character cr
]

{ #category : #API }
CVGLatexMarkupElement class >> itemize [
	^(self markup: 'itemize') beginEndMarkup
]

{ #category : #API }
CVGLatexMarkupElement class >> markup: aString [

	^ self basicNew
		  markup: aString;
		  initialize;
		  yourself
]

{ #category : #API }
CVGLatexMarkupElement class >> newLine [
	^self basicNew openingMarkup: '\\'
]

{ #category : #API }
CVGLatexMarkupElement class >> red [
	^self markup: 'textcolor{red}'
]

{ #category : #API }
CVGLatexMarkupElement class >> space [

	^ (self markup: '~')
		  openingMarkup: '~';
		  closingMarkup: ''
]

{ #category : #API }
CVGLatexMarkupElement class >> subsection [

	^ self markup: 'subsection'
]

{ #category : #API }
CVGLatexMarkupElement class >> subsectionX [

	^ self markup: 'subsection*'
]

{ #category : #'as yet unclassified' }
CVGLatexMarkupElement class >> subsubsection [
	^ self markup: 'subsubsection'
]

{ #category : #API }
CVGLatexMarkupElement class >> summaryTable [

	| markup |
	markup := (self markup: 'table') beginEndMarkup.
	markup openingMarkup: (markup openingMarkup), '[h]'.	
	^ markup
]

{ #category : #API }
CVGLatexMarkupElement class >> summaryTabular [

	| markup |
	markup := (self markup: 'tabularx') beginEndMarkup.
	markup openingMarkup: (markup openingMarkup), '{\textwidth}{lX}'.	
	^ markup
]

{ #category : #API }
CVGLatexMarkupElement class >> tabular [
	self shouldBeImplemented.
]

{ #category : #API }
CVGLatexMarkupElement class >> tabular: size [

	| markup str |
	markup := (self markup: 'tabular') beginEndMarkup.
	str := WriteStream on: String new.
	str << '\hbox to\textwidth{\sf\hfil'.
	str cr.
	str << markup openingMarkup.
	str<<'{'.
	1 to: size do: [ :i | 
		str << 'l'.
		i = size ifFalse: [ str << '|' ] ].
	str<<'}'.
	markup openingMarkup: str contents.
	markup closingMarkup: markup closingMarkup , ' \hfil}'.
	^ markup
]

{ #category : #API }
CVGLatexMarkupElement class >> url [
	^self markup: 'url'
]

{ #category : #api }
CVGLatexMarkupElement >> beginEndMarkup [
	self beginMarkup.
	self endMarkup 
]

{ #category : #private }
CVGLatexMarkupElement >> beginMarkup [
	openingMarkup := '\begin{', markup, '}'
]

{ #category : #accessing }
CVGLatexMarkupElement >> closingMarkup [

	^ closingMarkup ifNil: [ closingMarkup := self defaultClosingMarkup ]
]

{ #category : #accessing }
CVGLatexMarkupElement >> closingMarkup: aString [

	closingMarkup := aString
]

{ #category : #private }
CVGLatexMarkupElement >> defaultClosingMarkup [
	^'}'
]

{ #category : #private }
CVGLatexMarkupElement >> defaultOpeningMarkup [
	openingMarkup := '\', markup, '{'
]

{ #category : #private }
CVGLatexMarkupElement >> endMarkup [
	self flag: 'possible bug for user xp: leave openingMarkup'.
	closingMarkup := '\end{', markup, '}'
]

{ #category : #initialize }
CVGLatexMarkupElement >> initialize [ 	
	super initialize.
	self defaultOpeningMarkup
]

{ #category : #api }
CVGLatexMarkupElement >> markup: aString [
	markup := aString
]

{ #category : #accessing }
CVGLatexMarkupElement >> openingMarkup [

	^ openingMarkup
]

{ #category : #accessing }
CVGLatexMarkupElement >> openingMarkup: aString [

	openingMarkup := aString
]
