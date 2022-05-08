Class {
	#name : #CVGLatexPreambleGenerator,
	#superclass : #Object,
	#instVars : [
		'preambles',
		'model'
	],
	#category : #'CVGenerator-ReadersWriters-Generators'
}

{ #category : #'generation - summaries' }
CVGLatexPreambleGenerator >> generatePreambleNamed: title size: colSize rows: rows [

	| writer |
	writer := CVGLatexWriter new.
	writer subsubSectionX: title. 
	writer cr.
	writer text: '\hrule'.
	writer cr.
	writer text: '\vspace{-1em}'.
	writer cr.
	writer newSummaryTable.
	writer tableSize: colSize.

	rows do: [ :row | 
		writer cr.
		writer tableRow.		
		1 to: colSize do: [ :i | 
			writer text: (row at: i).
			writer tableColumn: ' ' ].
		writer closeRow ].
	
	writer closeSummaryTable.
	^ writer contents
]

{ #category : #'generation - summaries' }
CVGLatexPreambleGenerator >> generateResearchSummary [

	| writer title rows cols animations collaborations service pcs|
	title := '2. Activités de recherche'.
	rows := OrderedCollection new.

	rows add: { 
			(CVGLatexWriter new
				 red: '2.1 Recherche';
				 contents).
			(CVGLatexWriter new
				 text:
					 'Langages dynamiques et leurs infrastructures pour le debugging, équipe ';
				 red: 'RMoD';
				 contents) }.
	rows add: { 
			(CVGLatexWriter new
				 red: ' ';
				 contents).
			(CVGLatexWriter new				
				text:
					 'ANR JCJC ';
				 red: 'OCRE';
				text: ': Object-Centric debugging REloaded (173k euros, 2022 - 2024)';
				 contents) }.
				
	animations := ((model sections detect:[:s| s type = CVGResearch]) data select:[:d| d type class = CVGResearchType ]) asOrderedCollection.
	cols := OrderedCollection new.
	cols add: (CVGLatexWriter new
				 red: '2.2 Animation de la recherche';
				 contents).
	cols add: animations first title first.
	rows add: cols.
	animations removeFirst.
	
	animations do:[:a|
		cols := OrderedCollection new.
	cols add: ' '.
	cols add: a title first.
	rows add: cols].

	collaborations := (model sections detect:[:s| s type = CVGResearch]) data select:[:d| d type class = CVGCollaborationType ].
	cols := OrderedCollection new.
	cols add: (CVGLatexWriter new
				 red: '2.3 Collaborations';
				 contents).
	cols add: (CVGLatexWriter new
				 red: (collaborations size printString);			
				 text: ' collaborations externes (dont 1 industrielle)';
				 contents).
	rows add: cols.
	
	service := (model sections detect:[:s| s type = CVGService]) data.
	cols := OrderedCollection new.
	cols add: (CVGLatexWriter new
				 red: '2.4 Service';
				 contents).
	writer := CVGLatexWriter new.
	
	writer text: 'Comités de programmes ('.
	pcs := service select:[:s| s type class = CVGPCType].
	pcs do:[:pc|
		writer red: (pc acronym = 'CNRS' ifTrue:[pc title] ifFalse:[pc acronym]).		
		pc years do:[:y| writer red: ''''; red: (y copyFrom: 3 to: 4)].
		pc = pcs last ifFalse:[writer text: ', ']].
	writer text: '), '.
	
	writer text: 'relectures ('.
	pcs := service select:[:s| s type class = CVGReviewerType].
	pcs do:[:pc|
		writer red: pc acronym.		
		pc years do:[:y| writer red: ''''; red: (y copyFrom: 3 to: 4)].
		pc = pcs last ifFalse:[writer text: ', ']].	
	writer text: '), '.
	
	writer text: 'session chair ('.
	pcs := service select:[:s| s type class = CVGSessionChairType].
	pcs do:[:pc|
		writer red: (pc acronym ifEmpty:[pc title]).		
		pc years do:[:y| writer red: ''''; red: (y copyFrom: 3 to: 4)].
		pc = pcs last ifFalse:[writer text: ', '. ]].	
	writer text: '), '.
	
	writer text: 'organisation locale de conférences ('.
	pcs := service select:[:s| s type class = CVGLCType or:[s type class = CVGVolunteerType]].
	pcs do:[:pc|
		writer red: pc acronym.		
		pc years do:[:y| writer red: ''''; red: (y copyFrom: 3 to: 4)].
		pc = pcs last ifFalse:[writer text: ', ']].	
	writer text: ')'.
	
	cols add: writer contents.
	rows add: cols.
	
	^self generatePreambleNamed: title size: 2 rows: rows  	
			
	
]

{ #category : #initialization }
CVGLatexPreambleGenerator >> initialize [ 
	preambles := Dictionary new
]

{ #category : #accessing }
CVGLatexPreambleGenerator >> model: anObject [

	model := anObject
]

{ #category : #accessing }
CVGLatexPreambleGenerator >> preambles [

	^ preambles
]
