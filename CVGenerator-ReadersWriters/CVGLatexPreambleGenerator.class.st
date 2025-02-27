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
CVGLatexPreambleGenerator >> countYearsForService: services [

	^ services inject: 0 into: [ :sum :next | sum + next years size ]
]

{ #category : #'generation - summaries' }
CVGLatexPreambleGenerator >> generateAdminSummary [

	| title |
	title := '4. Responsabilités administratives'.
	^ self generatePreambleNamed: title size: 2 rows: #(  )
]

{ #category : #'generation - summaries' }
CVGLatexPreambleGenerator >> generateCVSummary [

	| title rows |
	title := '1. Parcours et formation'.
	rows := OrderedCollection new.

	rows add: { 
			(CVGLatexWriter new
				 red: 'Expérience professionnelle';
				 contents).
			(CVGLatexWriter new
				 red: 'Industrie ';
				 text: '6 ans --- ';
				 red: 'Recherche ';
				 text: ' 10 ans (y compris thèse)';
				 contents) }.

	rows add: { 
			(CVGLatexWriter new
				 red: 'Formation';
				 contents).
			(CVGLatexWriter new
				 red: 'Licence/Master ';
				 text: '2004 - 2009, ';
				 red: 'Doctorat ';
				 text: '2015 - 2018';
				 contents) }.
	^ self generatePreambleNamed: title size: 2 rows: rows
]

{ #category : #'generation - summaries' }
CVGLatexPreambleGenerator >> generateContributionsSummary [

	| writer title rows cols publications pubs|
	title := '3. Liste complète des contributions'.
	rows := OrderedCollection new.

	publications := (model sections detect:[:s| s type = CVGPublication]) data.
	cols := OrderedCollection new.
	cols add: (CVGLatexWriter new red: '3.1 Publications (', (publications reject:[:p| p type class = CVGBook]) size printString, ')'; contents).
	pubs := publications select:[:p| p type class = CVGJournal].				
	writer := CVGLatexWriter new.
	writer red: pubs size printString.
	writer text: ' articles de journaux, '.
	pubs := publications select:[:p| p type class = CVGConference].
	writer red: pubs size printString.
	writer text: ' conférences internationales, '.
	pubs := publications select:[:p| p type class = CVGWorkshop].		
	writer red: pubs size printString.
	writer text: ' workshops à comité de lecture, '.
	pubs := publications select:[:p| p type class = CVGThesis].
	writer red: pubs size printString.
	writer text: ' thèse de doctorat (soutenue en 2018), '.
	pubs := publications select:[:p| p type class = CVGOther].	
	writer red: pubs size printString.
	writer text: ' articles de blog (\url{thepharo.dev})'.
	cols add: writer contents.
	rows add: cols.
	
	"cols := OrderedCollection new.
	cols add: ' '.
	pubs := publications select:[:p| p type class = CVGConference].				
	writer := CVGLatexWriter new.
	writer red: pubs size printString.
	writer text: ' conférences internationales'.
	cols add: writer contents.
	rows add: cols."
	"
	cols := OrderedCollection new.
	cols add: ' '.
	pubs := publications select:[:p| p type class = CVGWorkshop].				
	writer := CVGLatexWriter new.
	writer red: pubs size printString.
	writer text: ' workshops internationaux à comité de lecture'.
	cols add: writer contents.
	rows add: cols."
	
"	cols := OrderedCollection new.
	cols add: ' '.
	pubs := publications select:[:p| p type class = CVGOther].				
	writer := CVGLatexWriter new.
	writer red: pubs size printString.
	writer text: ' articles de blog (\url{thepharo.dev})'.
	cols add: writer contents.
	rows add: cols."
	
	cols := OrderedCollection new.
	cols add: ' '.
	pubs := publications select:[:p| p type class = CVGThesis].				
	writer := CVGLatexWriter new.
	writer red: pubs size printString.
	writer text: ' thèse de doctorat (soutenue en 2018)'.
	cols add: writer contents.
	rows add: cols.
	
	publications := (model sections detect:[:s| s type = CVGTalk]) data.
	cols := OrderedCollection new.
	cols add: (CVGLatexWriter new red: '3.2 Présentations (', publications size printString, ')'; contents).
	pubs := publications select:[:p| p type class = CVGTalkKeynote or:[p type class = CVGTalkConference] ].				
	writer := CVGLatexWriter new.
	writer red: pubs size printString.
	writer text: ' présentations à des conférences internationales, '.
	pubs := publications select:[:p| p type class = CVGTalkTool].
	writer red: pubs size printString.
	writer text: ' démonstrations d''outils (conférences et industriels), '.
	pubs := publications select:[:p| p type class = CVGTalkVulgarization].
	writer red: pubs size printString.
	writer text: ' vulgarisation, '.
	pubs := publications select:[:p| p type class = CVGTalkSeminar].
	writer red: pubs size printString.
	writer text: ' séminaires nationaux/internationaux'.
	cols add: writer contents.
	rows add: cols.
	
	publications := (model sections detect:[:s| s type = CVGSoftware]) data.
	cols := OrderedCollection new.
	cols add: (CVGLatexWriter new red: '3.3 Développement technologiques'; contents).			
	writer := CVGLatexWriter new.
	writer red: publications size printString.
	writer text: ' logiciels et bibliothèques open-source'.
	cols add: writer contents.
	rows add: cols.
	
	
	^self generatePreambleNamed: title size: 2 rows: rows  	
			
	
]

{ #category : #'generation - summaries' }
CVGLatexPreambleGenerator >> generatePreambleNamed: title size: colSize rows: rows [

	| writer |
	writer := CVGLatexWriter new.
	writer subsubSectionX: title. 
	rows ifEmpty: [ ^ writer contents ].
"	writer cr.
	writer text: '\hrule'.
	writer cr."
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
		writer text: '\vspace{-1em}'.
		writer cr.
	writer text: '\hrule'.
	writer cr.
	^ writer contents
]

{ #category : #'generation - summaries' }
CVGLatexPreambleGenerator >> generateResearchSummary [

	| writer title rows cols animations collaborations service pcs students|
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
	pcs := service select:[:s| s type class = CVGPCType].
	writer red: (self countYearsForService: pcs) printString.
	writer text: ' comités de programmes, '.
	
	pcs := service select:[:s| s type class = CVGReviewerType].
	writer red: (self countYearsForService: pcs) printString.
	writer text: ' relectures, '.
	
	
	pcs := service select:[:s| s type class = CVGSessionChairType].
	writer red: (self countYearsForService: pcs) printString.
	writer text: ' session chair, '.
	
	
	pcs := service select:[:s| s type class = CVGLCType or:[s type class = CVGVolunteerType]].
	writer red: (self countYearsForService: pcs) printString.
	writer text: ' org. locales de conférences'.
	
	
	
	cols add: writer contents.
	rows add: cols.
	
	cols := OrderedCollection new.	
	cols add: (CVGLatexWriter new
				 red: '2.5 Encadrement';
				 contents).
				
	writer := CVGLatexWriter new.
	students := (model sections detect:[:s| s type = CVGStudent]) data.
	writer red: (students select:[:s| s level = 'phd']) size printString.
	writer text: ' doctorants, '.
	writer red: (students select:[:s| s level = 'M2']) size printString.
	writer text: ' M2, '.
	writer red: (students select:[:s| s level = 'M1']) size printString.
	writer text: ' M1, '.
	writer red: (students select:[:s| s level = 'Licence']) size printString.
	writer text: ' L3'.
	cols add: writer contents.
	rows add: cols.
	
	^self generatePreambleNamed: title size: 2 rows: rows  	
			
	
]

{ #category : #'generation - summaries' }
CVGLatexPreambleGenerator >> generateTeachingSummary [

	| writer title rows cols teachings total cm td tp L2 L3 M1 M2 |
	title := '5. Enseignement'.
	rows := OrderedCollection new.

	teachings := (model sections detect:[:s| s type = CVGCourse]) data.
	total := teachings inject: 0 into:[:sum :next| sum + next totalEquivalentTD].
	L2 := (teachings select:[:c| c level first = 'L2']).
	L3 := (teachings select:[:c| c level first = 'L3']).
	M1 := (teachings select:[:c| c level first = 'M1']).
	M2 := (teachings select:[:c| c level first = 'M2']).
	
	
	cols := OrderedCollection new.
	cols add: (CVGLatexWriter new red: ('5.1 Service effectué ', total printString, 'h'); text: 'éq. TD';contents).	
	cols add: (self latexTeachingCount: L2 named: 'Licence 2 $\rightarrow$ ').	
	rows add: cols.
	
	cols := OrderedCollection new.
	cm := teachings inject: 0 into:[:sum :next| sum + next cm].
	td  := teachings inject: 0 into:[:sum :next| sum + next td].
	tp := teachings inject: 0 into:[:sum :next| sum + next tp].
	writer := CVGLatexWriter new.
	writer red: cm printString, 'h'.
	writer text: 'CM '.
	writer red: td printString, 'h'.
	writer text: 'TD '.
	writer red: tp printString, 'h'.
	writer text: 'TP'.
	cols add: writer contents.
	cols add: (self latexTeachingCount: L3 named: 'Licence 3 $\rightarrow$ ').	
	rows add: cols.
	
	cols := OrderedCollection new.
	cols add: ' '.
	cols add: (self latexTeachingCount: M1 named: 'Master 1 $\rightarrow$ ').	
	rows add: cols.
	cols := OrderedCollection new.
	cols add: ' '.
	cols add: (self latexTeachingCount: M2 named: 'Master 2 $\rightarrow$ ').	
	rows add: cols.
	
	cols := OrderedCollection new.	
	cols add: '\textcolor{red}{5.2 Ateliers scientifiques pour enfants}'.
	cols add: '\textcolor{red}{6} ateliers de vulgarisation pour enfants (\textcolor{red}{6h}), collégiens (\textcolor{red}{5h}), lycéens (\textcolor{red}{1h})'.
	rows add: cols.
	
	cols := OrderedCollection new.	
	cols add: '\textcolor{red}{5.3 Vulgarisation scientifique }'.
	cols add: 'Missions de vulgarisation \& animations scientifique'.
	rows add: cols.
	
	cols := OrderedCollection new.	
	cols add: '\textcolor{red}{5.4 Les cordées de la réussite}'.
	cols add: '\textcolor{red}{100} heures d''encadrement d''élèves en première scientifique (3 prix de concours)                                                                       '.
	rows add: cols.
	
	^self generatePreambleNamed: title size: 2 rows: rows  	
			
	
]

{ #category : #'generation - summaries' }
CVGLatexPreambleGenerator >> generateTitle [

	^'\begin{table}[t]
    \begin{tabularx}{\textwidth}{lr}
    \LARGE \textbf{STEVEN COSTIOU} &   \url{https://kloum.io/costiou}  \\
    \large Chargé de recherche Inria, équipe EVREF -- CRIStAL, UMR CNRS 9189  &  steven.costiou@inria.fr \vspace{-2.5em}
    \end{tabularx}
\end{table}
\hrule'
]

{ #category : #initialization }
CVGLatexPreambleGenerator >> initialize [ 
	preambles := Dictionary new
]

{ #category : #'generation - summaries' }
CVGLatexPreambleGenerator >> latexTeachingCount: teachings named: aString [

	|writer cm td tp|
	cm := teachings inject: 0 into:[:sum :t| sum + t cm].
	td  := teachings inject: 0 into:[:sum :t| sum + t td ].
	tp := teachings inject: 0 into:[:sum :t| sum + t tp].
	
	writer := CVGLatexWriter new.
	writer text: aString.
	
	cm > 0 ifTrue:[
	writer red: cm printString.
	writer red: 'h'.
	writer text: 'CM '
	].

	td > 0 ifTrue:[
	writer red: td printString.
	writer red: 'h'.
	writer text: 'TD '
	].
	tp > 0 ifTrue:[
	writer red: tp printString.
	writer red: 'h'.
	writer text: 'TP'
	].

	 ^ writer contents.
	
				
	
]

{ #category : #accessing }
CVGLatexPreambleGenerator >> model: anObject [

	model := anObject
]

{ #category : #accessing }
CVGLatexPreambleGenerator >> preambles [

	^ preambles
]
