"
I'm an abstract generator. I generate a set of CV documents using writers (html, latex, pillar...).
16/05/2020: only html.
"
Class {
	#name : #CVGGenerator,
	#superclass : #Object,
	#instVars : [
		'writerClass',
		'model',
		'outputDic',
		'stream',
		'generatorWriter',
		'translated',
		'generatedPages'
	],
	#category : #'CVGenerator-ReadersWriters-Generators'
}

{ #category : #'instance creation' }
CVGGenerator class >> generateHTML: aCVGModel [
	^self new html; model: aCVGModel; generate
]

{ #category : #'instance creation' }
CVGGenerator class >> generateLatex: aCVGModel [
	^self new latex; model: aCVGModel; generate
]

{ #category : #pages }
CVGGenerator >> buildPagesDescriptions [

	|pages description|
	pages := Dictionary new.
	
	"Publications"
	description := OrderedCollection new.
	description add: (self generatedSection: 'Intro').
	description add: (self generatedSection: 'Research').
	pages at: self pageTitles first put: description.
	
	"Publications"
	description := OrderedCollection new.
	description add: (self generatedSection: 'Students').
	pages at: self pageTitles third put: description.
	
	
	"Publications"
	description := OrderedCollection new.
	description add: (self generatedSection: 'Service').	
	pages at: (self pageTitles eighth) put: description.
	
	"Publications"
	description := OrderedCollection new.
	description add: (self generatedSection: 'Publications').
	pages at: self pageTitles fourth put: description.
	
	"Software"
	description := OrderedCollection new.
	description add: (self generatedSection: 'Software').
	writerClass isHTML ifTrue:[description addAll: (self staticAppendicesFor: 'Software')].
	pages at: self pageTitles fifth put: description.
	
	"Talks"
	description := OrderedCollection new.
	description add: (self generatedSection: 'Talks').
	pages at: self pageTitles sixth put: description.

	"Teaching"
	description := OrderedCollection new.
	description add: (self generatedSection: 'Teachings').
	description add: (self generatedSection: 'Past teaching activities').
	pages at: self pageTitles seventh put: description.
	
	"Administration"
	description := OrderedCollection new.
	description add: (self generatedSection: 'Administration').
	pages at: self pageTitles ninth put: description.
	
	"CV"
	description := OrderedCollection new.
	description add: (self generatedSection: 'Experience').
	pages at: (self pageTitles at: 10) put: description.
	
	^pages	
	
]

{ #category : #export }
CVGGenerator >> exportDirectory [

	|dir|
	dir := self pageDirectory asFileReference.
	dir ensureCreateDirectory.
	dir deleteAllChildren.
	^dir 
]

{ #category : #generation }
CVGGenerator >> generate [
	| oldHeaderKey |
	outputDic := Dictionary new.
	generatorWriter := writerClass on: self stream.	
	
	translated := false.
	self generateCV.
"	outputDic inspect.
	self halt."
	generatorWriter writeAndExport: self.
	
	translated := true. 
	oldHeaderKey := outputDic keys detect:[:k| k title = 'Header-formatted'] ifNone:[nil].
	oldHeaderKey ifNotNil: [ outputDic removeKey: oldHeaderKey ].
	self generateCV.
	generatorWriter writeAndExport: self
]

{ #category : #generation }
CVGGenerator >> generateAdmin: aCVGAdmin [
	| writer |
	writer := self newWriterFor: aCVGAdmin.
	writer bold: (self translated: aCVGAdmin title).
	writer openItemList.
	aCVGAdmin items
		do: [ :c | 
			writer openItem.
			writer text: (self translated: c).
			writer text: '. '.
			writer closeItem ].
	writer closeItemList
]

{ #category : #'generation - sections' }
CVGGenerator >> generateAdminSection: section with: writer [
	| missions mandats membres contributions service |
	missions := section data
		select: [ :e | e type class == CVGMissionType ].
	writer
		subSection: (self translated: CVGMissionType new typeName).
	
	writer openItemList.
	missions do:[:m| m acceptGenerator: self].
	writer closeItemList.
	
	mandats := section data
		select: [ :e | e type class == CVGMandateType ].
	writer
		subSection: (self translated: CVGMandateType new typeName).

	writer openItemList.
	mandats do:[:m| m acceptGenerator: self].
	writer closeItemList.
	
	membres := section data
		select: [ :e | e type class == CVGMemberType ].
	writer
		subSection: (self translated: CVGMemberType new typeName).

	writer openItemList.
	membres do:[:m| m acceptGenerator: self].
	writer closeItemList.
		
	contributions := section data
		detect: [ :e | e type class == CVGContributionType ].
	writer
		subSection: (self translated: contributions title).
	
	contributions acceptGenerator: self.
		
	service := section data
		select: [ :e | e type class == CVGAdminServiceType ].
	writer
		subSection: (self translated: #('Service académique' 'Academic service')).
	
	service do:[:s| s acceptGenerator: self].

	outputDic at: section put: stream contents
	
]

{ #category : #export }
CVGGenerator >> generateAndExportHtml [
	self regenerateHeader.
	self generateHTMLPages.
	self writePages
]

{ #category : #export }
CVGGenerator >> generateAndExportLatex [
"	self regenerateLatexHeader."
	self generateLatexPages.
"	self writePages"
]

{ #category : #generation }
CVGGenerator >> generateAtelier: aCVGAtelier [ 
	
]

{ #category : #'generation - sections' }
CVGGenerator >> generateAteliersFrom: aSection with: writer [
	| ateliers cap |
	ateliers := aSection data
		select: [ :e | e type class = CVGAdditionalTeachingType ateliers class ].
	cap := aSection data
		detect: [ :e | 
			e type class = CVGAdditionalTeachingType cap class
				and: [ e sectionType class = CVGAdditionalTeachingType ateliers class ] ].

	"Cap generation"
	writer title: (self translated: cap title) h: 'h6'.
	writer text: (self translated: cap text).
	writer startUnorderedList.
	"atelier generation"
	ateliers
		do: [ :a | 
			writer openListItem.
			writer bold: (self translated: a title).
			writer text: ', '.
			writer text: (self translated: a dateString).
			writer text: '. '.
			writer text: (self translated: a text).
			writer closeListItem ].
	writer stopUnorderedList
]

{ #category : #generation }
CVGGenerator >> generateAuthor: author [
	| writer |
	writer := self newWriterFor: author.
	author isSelf
		ifTrue: [ writer italic: author fullName ]
		ifFalse: [ writer write: author fullName ]
]

{ #category : #generation }
CVGGenerator >> generateCV [
	(model sections reject:[:s| s title = 'Header']) do: [ :sec | sec acceptGenerator: self ]  
]

{ #category : #'generation - sections' }
CVGGenerator >> generateCVSection: aCVGSection with: aCVGSimpleHtmlWriter [ 
	|xp studies|
	xp := aCVGSection data select:[:e| e type isWorkExperience].
	aCVGSimpleHtmlWriter subSection: (self translated: #('Expérience professionnelle' 'Professional experience')).
"	aCVGSimpleHtmlWriter writeNewLine.
	aCVGSimpleHtmlWriter writeNewLine."
	aCVGSimpleHtmlWriter newTableOfSize: 3.
	xp do:[:e|
	self generateWorkStudy: e with: aCVGSimpleHtmlWriter
		].
	aCVGSimpleHtmlWriter closeTable.	
	xp := aCVGSection data select:[:e| e type isAdditionalWorkDetail].
	aCVGSimpleHtmlWriter bold: (self translated:  #('Quelques détails :' 'Some details:')).
	aCVGSimpleHtmlWriter writeNewLine.
	xp do:[:e|
		aCVGSimpleHtmlWriter bold: ((self translated: (e start)), ' - ', (self translated: (e stop))).
		aCVGSimpleHtmlWriter writeSpace.
		aCVGSimpleHtmlWriter text: (self translated: (e title)).
		aCVGSimpleHtmlWriter text: ', '.
		aCVGSimpleHtmlWriter text: (self translated: (e institution)).
		aCVGSimpleHtmlWriter text: '.'.
		aCVGSimpleHtmlWriter writeNewLine].
	aCVGSimpleHtmlWriter writeNewLine.
	
	studies := aCVGSection data select:[:e| e type isStudy].
	aCVGSimpleHtmlWriter subSection: (self translated: #('Études' 'Studies')).
"	aCVGSimpleHtmlWriter writeNewLine.
	aCVGSimpleHtmlWriter writeNewLine."
	aCVGSimpleHtmlWriter newTableOfSize: 2.
	studies do:[:e|
		self generateWorkStudy: e with: aCVGSimpleHtmlWriter
		].
	aCVGSimpleHtmlWriter closeTable.
	outputDic at: aCVGSection put: stream contents
]

{ #category : #generation }
CVGGenerator >> generateCap: aCVGCap [ 
	
]

{ #category : #generation }
CVGGenerator >> generateContribution: aCVGAdmin [
	| writer |
	writer := self newWriterFor: aCVGAdmin.
	writer openItemList.
	aCVGAdmin items
		do: [ :c | 
			writer openItem.
			writer text: (self translated: c).
			writer text: '. '.
			writer closeItem ].
	writer closeItemList
]

{ #category : #'generation - sections' }
CVGGenerator >> generateContributionSection: aSection with: writer [

	writer writeContributionNumbers: aSection data size.
	aSection sortedElements
		do: [ :typedElement | 
			| type elements |
			type := typedElement key.
			elements := typedElement value.
			elements isEmpty
				ifFalse: [ writer subSection: (self translated: type typeName).
					writer openItemList.
					elements do: [ :e | e acceptGenerator: self ].
					writer closeItemList ] ].
	outputDic at: aSection put: stream contents
]

{ #category : #generation }
CVGGenerator >> generateCordee: aCVGCordee [ 
	
]

{ #category : #'generation - sections' }
CVGGenerator >> generateCordeesFrom: aSection with: writer [
	| cordees cap |
	cordees := aSection data
		select: [ :e | e type class = CVGAdditionalTeachingType cordees class ].
	cordees := cordees sort: [ :a :b | a year < b year ].
	cap := aSection data
		detect: [ :e | 
			e type class = CVGAdditionalTeachingType cap class
				and: [ e sectionType class = CVGAdditionalTeachingType cordees class ] ].

	"Cap generation"
	writer title: (self translated: cap title) h: 'h6'.
	writer text: (self translated: cap text).

	"cordees generation"
	cordees
		do: [ :c | 
			writer div: 'row topmargin-10'.
			writer div: 'seven columns bottom-10px'.
			writer div: 'cordees-text'.
			c award > 0
				ifTrue: [ | award |
					award := c award = 1
						ifTrue: [ {('Premier prix du jury ' , c year printString).
							('First prize award, ' , c year printString)} ]
						ifFalse: [{('Second prix du jury ' , c year printString).
							('Second prize award, ' , c year printString)} ].
					writer div: 'first-prize'.
					writer div: 'award'.
					writer text: (self translated: award).
					writer closeMarkup.
					writer closeMarkup ].
			writer bold: c students.
			writer text: ', '.
			writer text: c school.
			c award = 0 ifTrue:[writer text: ' (', c year printString, ')' ].
			writer writeNewLine.
			writer bold: (self translated: c title).
			writer writeNewLine.
			writer text: (self translated: c text).
			writer text: '. '.
			c images do:[:img|
				writer writeUrl: ('../images/', img) labeled: 'Photo. '.
				].			
			writer writeUrl: ('../pdf/', c poster) labeled: 'Poster. '.					
			c press do:[:url|
				writer writeUrl: url labeled: 'Presse.'.
				].		
			writer closeMarkup.
			writer closeMarkup.
			writer div: 'four columns align-center bottom-10px'.
			c thumb isEmpty ifFalse:[
			writer image: ('../images/cordees/', c thumb) class: 'photo-cordees mdl-shadow--4dp' border: 0 alt: ''.	].
			writer closeMarkup.
			writer closeMarkup ]
]

{ #category : #generation }
CVGGenerator >> generateCourse: aCVGCourse [ 
	
]

{ #category : #'generation - pages' }
CVGGenerator >> generateHTMLPage: pageDescription [

	| str |
	str := self newStream.
	str << self htmlPagePreamble.	
	str << '<div class="row">'.
	str << '<div class="three columns">'.
	str << (self generateMenuFor: pageDescription key).
	str << '</div>'.
	str << '<div class="nine columns">'.
	str << '<div class="header">'.
"	str << self htmlHeader."
	str << '<br>'.
	str << '<h5>'.
	str << (self translated: pageDescription key).
	str << '</h5>'.
	str << '<hr>'.
	str << '</div>'.
	pageDescription value do: [ :html | str << html ].
	str << self htmlPagePostface.
	generatedPages at: pageDescription key fourth put: str contents
]

{ #category : #'generation - pages' }
CVGGenerator >> generateHTMLPages [
	generatedPages := Dictionary new.
	self buildPagesDescriptions
		associationsDo: [ :pageDescription | self generateHTMLPage: pageDescription ]
]

{ #category : #generation }
CVGGenerator >> generateHeader: aCVGHeader [ 
	| writer |
	writer := self newWriterFor: aCVGHeader.
	writer div: 'profile'.
	writer div: 'profile-picture'.
	writer image: (self imageDirectory, aCVGHeader photo).
	writer closeMarkup.
	writer div: 'profile-info'.
	writer title: (self translated: aCVGHeader title) h: 'h6' class: 'title-name'.
	writer writeNewLine.
	writer title: ((self translated: aCVGHeader rank), ' ', aCVGHeader institution) h: 'h6' class: 'title-name'.
	writer writeNewLine.
	writer writeUrl: aCVGHeader team second labeled: aCVGHeader team first. 
	writer writeNewLine.
	writer writeUrl: aCVGHeader lab second labeled: aCVGHeader lab first. 
	writer closeMarkup.
	writer closeMarkup

]

{ #category : #generation }
CVGGenerator >> generateIntro: aCVGIntro [
	| writer intro |
	intro := aCVGIntro.
	writer := self newWriterFor: intro.
	writer bold: (self translated: intro title).
	writer writeNewLine.
	writer bold: (self translated: #('Mots clés : ' 'Keywords: ')).
	intro keywords
		do: [ :k | 
			writer text: k.
			writer
				text:
					(k = intro keywords last
						ifTrue: [ '.' ]
						ifFalse: [ ', ' ]) ].
	writer writeNewLine.
	writer text: self generateSocialNetworks.
	writer writeNewLine.
	writer subSection: (self translated: #('Recherche' 'Research')).
	writer writeNewLine.
	writer text: (self translated: intro text).
	writer writeNewLine.
	writer writeNewLine.	

	intro fundings ifEmpty: [ ^self ]. 
	writer subSection: (self translated: #('Projets' 'Projects')).	
	writer startUnorderedList.	
	intro fundings do:[:fun|		
		writer openListItem.		
		writer writeUrl: fun url labeled: fun name.
		writer text: ':'.
		writer writeSpace.		
		writer bold: fun title.
		writer writeSpace.	
		writer text: '('.
		writer text: fun years.
		writer text: ').'.
		writer writeNewLine.
		writer text: (self translated: fun description).
		writer text: '.'.
		writer writeNewLine.
		writer text: (self translated: #('Financement :' 'Funding:')).
		writer writeSpace.
		writer text: fun money.
		writer text: ' euros.'.
		writer closeListItem.	
	].
	writer stopUnorderedList
]

{ #category : #'generation - sections' }
CVGGenerator >> generateIntroSection: section with: writer [
	section data first acceptGenerator: self.
	outputDic at: section put: stream contents
]

{ #category : #'as yet unclassified' }
CVGGenerator >> generateLatexPage: anAssociation [ 
	self shouldBeImplemented.
]

{ #category : #'as yet unclassified' }
CVGGenerator >> generateLatexPages [

	generatedPages := Dictionary new.
	self buildPagesDescriptions associationsDo: [ :pageDescription | 
		self generateLatexPage: pageDescription ]
]

{ #category : #generation }
CVGGenerator >> generateMandate: aCVGAdmin [
	| writer |
	writer := self newWriterFor: aCVGAdmin.
	writer openItem.	
	writer bold: (self translated: aCVGAdmin title).
	writer text: ', '.
	writer text: (aCVGAdmin institute).
	writer text: '. '.
	writer text: aCVGAdmin years first.
	writer text: '. '.
	writer closeItem
	
]

{ #category : #'generation - pages' }
CVGGenerator >> generateMenuFor: pageTitle [

	|sortedTitles writer|
	sortedTitles := SortedCollection new.
	sortedTitles sortBlock: [:a :b| a third < b third ].
	sortedTitles addAll: self pageTitles.
	writer := CVGSimpleHtmlWriter new.
	writer div: 'topmargin-10 menu'.
	"writer write: '<hr class=""blue-hr"">'."
	sortedTitles do:[:title|
		|titleTranslated pageTitleTranslated|
		titleTranslated := (self translated: title).
		pageTitleTranslated := (self translated: pageTitle).
		writer div: 'menu-item'.
		writer div: 'menu-item-logo'.	
		writer write: '<i class="material-icons" style="color:#1565c0">', title fifth, '</i>'.	
		writer closeMarkup.
		titleTranslated =  pageTitleTranslated ifTrue:[writer div: 'active-bg'].
		writer write: (writer url: title fourth labeled: titleTranslated).
		writer writeNewLine.
		titleTranslated =  pageTitleTranslated ifTrue:[writer closeMarkup].
		
		writer closeMarkup.
		].
	writer write: '<hr class="blue-hr">'.
	
	self generateTranslateURL: pageTitle fourth on: writer.
	writer closeMarkup.
	^writer contents

	
]

{ #category : #'generation - sections' }
CVGGenerator >> generatePastTeachingsSection: aSection with: writer [
	"select cordees, order, get cap then generates"
	writer
		subSection: (self translated: #('Activités passées' 'Past activities')).
	self generateCordeesFrom: aSection with: writer.
	self generateAteliersFrom: aSection with: writer.
	self generateVulgaFrom: aSection with: writer.
	outputDic at: aSection put: stream contents
	
]

{ #category : #generation }
CVGGenerator >> generateProject: aCVGProject [
	| writer intro |
	intro := aCVGProject.
	writer := self newWriterFor: intro.
	intro fundings ifEmpty: [ ^self ]. 
	writer subSection: (self translated: #('Projets' 'Projects')).	
	writer startUnorderedList.	
	intro fundings do:[:fun|		
		writer openListItem.		
		writer writeUrl: fun url labeled: fun name.
		writer text: ':'.
		writer writeSpace.		
		writer bold: fun title.
		writer writeSpace.	
		writer text: '('.
		writer text: fun years.
		writer text: ').'.
		writer writeNewLine.
		writer text: (self translated: fun description).
		writer text: '.'.
		writer writeNewLine.
		writer text: (self translated: #('Financement :' 'Funding:')).
		writer writeSpace.
		writer text: fun money.
		writer text: ' euros.'.
		writer closeListItem.	
	].
	writer stopUnorderedList
]

{ #category : #generation }
CVGGenerator >> generatePublication: pub [
	| writer |
	writer := self newWriterFor: pub.
	writer openItem.
	writer bold: pub title.
	writer writeDotSpace.
	pub authors
		do: [ :auth | 
			auth acceptGenerator: self.
			pub authors last == auth
				ifTrue: [ writer writeDotSpace ]
				ifFalse: [ writer writeCommaSpace ] ].
	writer writeDotSpace: pub publisher.
	writer writeDotSpace: pub year printString.
	writer writeURL: pub link.
	pub highlight ifNotEmpty:[:txt| writer highlight: txt].
	writer closeItem
]

{ #category : #generation }
CVGGenerator >> generateResearch: aCVGResearch [ 
	| writer |
	writer := self newWriterFor: aCVGResearch.
	writer openListItem.
	writer bold: (self translated: aCVGResearch title).
	writer writeSpace.
	writer text: '('.
	writer text: aCVGResearch dateString.
	writer text: ').'.
	writer writeSpace.
	writer text:(self translated: aCVGResearch text).
	writer text: '.'.	
	writer closeListItem
]

{ #category : #'generation - sections' }
CVGGenerator >> generateResearchSection: section with: writer [
	|research|
	writer subSection: (self translated: #('Groupes de travail' 'Working groups')).
	writer writeNewLine.
	
	"Working groups"
	research := section data
		select: [ :e | e type class = CVGResearchType ].
	writer startUnorderedList.
	research do:[:s| s acceptGenerator: self].
	writer stopUnorderedList.
	
	"Collaborations"
	writer subSection: (self translated: #('Collaborations' 'Collaborations')).
	writer writeNewLine.
	research := section data
		select: [ :e | e type class = CVGCollaborationType ].
	writer startUnorderedList.
	research do:[:s| s acceptGenerator: self].
	writer stopUnorderedList.
	
	outputDic at: section put: stream contents
]

{ #category : #'generation - sections' }
CVGGenerator >> generateSection: aSection [
	| writer |
	self resetStream.
	writer := self newWriterFor: aSection type.
	aSection generateWith: self using: writer
]

{ #category : #generation }
CVGGenerator >> generateService: aCVGService [
	| writer |
	writer := self newWriterFor: aCVGService.
	writer openListItem.
	writer bold: aCVGService title.
	writer text: ':'.
	writer writeSpace.
	"writer text: '('.
	writer text: aCVGService acronym.
	writer text: ').'."
	writer writeSpace.
	writer text: aCVGService acronym.
	writer writeSpace.
	aCVGService years
		do: [ :y | 
			writer text: y.
			y = aCVGService years last
				ifFalse: [ writer text: ','.
					writer writeSpace ] ].
	writer text: '.'.
	(#(nil '') includes: aCVGService url)
		ifFalse: [ writer writeNewLine.
			writer writeUrl: aCVGService url labeled: aCVGService url.
			writer text: '.' ].
	writer closeListItem
]

{ #category : #'generation - sections' }
CVGGenerator >> generateServiceSection: section with: writer [
	|services|
	
	"Program committees"
	services := section data
		select: [ :e | e type class = CVGPCType ].
	writer subsubSection:  (self translated: #('Comités de programmes' 'Program commitees')).
"	writer writeNewLine."
	writer startUnorderedList.
	services do:[:s| s acceptGenerator: self].
	writer stopUnorderedList.
	
	"Reviewing"
	services := section data
		select: [ :e | e type class = CVGReviewerType ].
	writer subsubSection:  (self translated: #('Comités de relecture' 'Reviewer')).
"	writer writeNewLine."
	writer startUnorderedList.
	services do:[:s| s acceptGenerator: self].
	writer stopUnorderedList.
	
	"Session Chair"
	services := section data
		select: [ :e | e type class = CVGSessionChairType ].
	writer subsubSection:  (self translated: #('Session chair' 'Session chair')).
	"writer writeNewLine."
	writer startUnorderedList.
	services do:[:s| s acceptGenerator: self].
	writer stopUnorderedList.
	
	"Local committees"
	services := section data
		select: [ :e | e type class = CVGLCType ].
	writer subsubSection:  (self translated: #('Comités d''organisation locale' 'Local organisation committee')).
	"writer writeNewLine."
	writer startUnorderedList.
	services do:[:s| s acceptGenerator: self].
	writer stopUnorderedList.
	
	"Student Volunteer"
	services := section data
		select: [ :e | e type class = CVGVolunteerType ].
	writer subsubSection:  (self translated: #('Étudiant volontaire' 'Student volunteer')).
	"writer writeNewLine."
	writer startUnorderedList.
	services do:[:s| s acceptGenerator: self].
	writer stopUnorderedList.
	
	
	
	outputDic at: section put: stream contents
]

{ #category : #'generation - pages' }
CVGGenerator >> generateSocialNetworks [

	|writer|
	writer := CVGSimpleHtmlWriter new.
	writer writeNewLine.
	writer div: 'brands-logos'.
	writer writeUrl: 'https://scholar.google.fr/citations?user=KLPmm0gAAAAJ&hl=fr' image: '../logos/google-scholar-logo.png'.
	writer writeUrl: 'https://github.com/StevenCostiou' image: '../logos/Octocat.jpg'.
	writer writeUrl: 'https://www.linkedin.com/in/steven-costiou-7bb633a9/' image: '../logos/In-Blue-128.png'.
	writer writeUrl: 'https://rmod.inria.fr' image: 'https://rmod.inria.fr/web/resources/logo'.
	writer writeUrl: 'https://www.researchgate.net/profile/Steven_Costiou?cp=shp' image: 'https://www.researchgate.net/images/public/profile_share_badge.png'.
	writer closeMarkup.
	^writer contents

	
]

{ #category : #generation }
CVGGenerator >> generateSoftware: s [
	| writer |
	writer := self newWriterFor: s.
	writer openItem.
	writer bold: s title.
	writer writeSpace.
	writer write: '(', s yearStart printString, ' - '.
	writer write: (s yearStop = 0 ifTrue:['...'] ifFalse:[s yearStop printString]), ')'.
	writer writeDotSpace.
	writer write: (self translated: s description).
	"self halt."
	writer writeDotSpace.
	writer writeURL: s link.
	writer closeItem
]

{ #category : #generation }
CVGGenerator >> generateStudent: aCVGStudent [
	| writer |
	writer := self newWriterFor: aCVGStudent.
	writer openListItem.
	writer bold: aCVGStudent name.
	aCVGStudent level = #phd
		ifTrue: [ writer text: ':'.
			writer writeSpace.
			writer text: (self translated: aCVGStudent title).
			writer text: '.'.
			writer writeSpace.
			writer text: (self translated: #('Financement: ' 'Funding: ')).
			writer text: aCVGStudent funding.
			writer text: '.'.
			writer writeSpace.
			writer text: (self translated: aCVGStudent supervision).
			writer text: ','.
			writer writeSpace.
			writer
				text:
					aCVGStudent yearStart printString , ' - '
						, aCVGStudent yearStop printString , '.' ]
		ifFalse: [ |description|
			writer writeSpace.
			writer
				text:
					(aCVGStudent academic
						ifTrue: [ self translated: #('(recherche)' '(research)') ]
						ifFalse: [ self translated: #('(industrie)' '(industry)') ]).
			writer text: '.'.
			writer writeSpace.
			description := self translated: aCVGStudent description.			
			writer text: description.
			description ifNotEmpty: [ 	writer text: '.'. ].
			writer writeSpace.
			"writer text: (self translated: #('Établissement: ' 'School: '))."
			writer text: aCVGStudent school.
			writer text: '.'.
			writer writeSpace.
			writer text: aCVGStudent yearStart printString.
			writer text: ','.
			writer writeSpace.
			writer text: aCVGStudent duration printString.
			writer writeSpace.
			writer text: (self translated: #('mois' 'months')).
			writer text: '.' ].
	writer closeListItem
]

{ #category : #'generation - sections' }
CVGGenerator >> generateStudentSection: section with: writer [
	|students|
	"writer subSection: (self translated: #('Étudiants' 'Students'))."
	
	
	"Phd"
	students := section data
		select: [ :e | e level = #phd ].
	writer subsubSection:  (self translated: #('Doctorants' 'PhD students')).
	
	writer startUnorderedList.
	students do:[:s| s acceptGenerator: self].
	writer stopUnorderedList.
	
	"M2"
	students := section data
		select: [ :e | e level = #M2 ].
	writer subsubSection:  (self translated: #('Master 2' 'Master 2')).

	writer startUnorderedList.
	students do:[:s| s acceptGenerator: self].
	writer stopUnorderedList.
	
	"M1"
	students := section data
		select: [ :e | e level = #M1 ].
	writer subsubSection:  (self translated: #('Master 1' 'Master 1')).

	writer startUnorderedList.
	students do:[:s| s acceptGenerator: self].
	writer stopUnorderedList.	
		
	"Licence"
	students := section data
		select: [ :e | e level = #Licence ].
	writer subsubSection:  (self translated: #('Licence' 'Bachelor')).
	
	writer startUnorderedList.
	students do:[:s| s acceptGenerator: self].
	writer stopUnorderedList.	
	
	outputDic at: section put: stream contents
]

{ #category : #generation }
CVGGenerator >> generateTalk: t [
	| writer |
	writer := self newWriterFor: t.
	writer openItem.
	writer bold: t title.
	writer writeDotSpace.
	writer write: t description.
	writer writeCommaSpace.
	t date ifNotNil:[:date|
			writer write: date ddmmyyyy.
			writer writeCommaSpace.].
	writer write: t location.
	writer writeDotSpace.
	writer writeURL: t link.
	writer closeItem
]

{ #category : #'generation - sections' }
CVGGenerator >> generateTeachingsSection: aSection with: writer [
	writer
		subSection: (self translated: #('Modules enseignés' 'Current courses')).
	
	writer
		text:
			(self
				translated:
					#('En bleu, les modules dont je suis ou ai été responsable.' 'In blue, the courses I am or was responsible for.')).
	writer writeNewLine.
	self writeTeachingHoursFrom: aSection with: writer.
	writer writeNewLine.
	writer newTableOfSize: 5.
	writer tableRow.
	writer tableHeader: (self translated: #('Période' 'Period')).
	writer tableHeader: (self translated: #('Cours' 'Title')).
	writer tableHeader: (self translated: #('Niveau' 'Level')).
	writer tableHeader: (self translated: #('Institution' 'Institution')).
	writer tableHeader: (self translated: #('Durée' 'Lab time')).
	writer closeRow.
	(aSection data asOrderedCollection
		sort: [ :e1 :e2 | e1 year > e2 year ])
		do: [ :teaching | 
			writer tableRow.
			writer tableColumn: teaching yearLabel.
			teaching responsible
				ifTrue: [ writer
						tableColumn: (self translated: teaching title)
						class: 'table-blue-column' ]
				ifFalse: [ writer tableColumn: (self translated: teaching title) ].
			writer tableColumn: (self translated: teaching level).
			writer tableColumn: (self translated: teaching institute).
			writer tableColumn: teaching totalHours printString , 'h'.
			writer closeRow ].
	writer closeTable.
	outputDic at: aSection put: stream contents
]

{ #category : #'generation - pages' }
CVGGenerator >> generateTranslateURL: translateUrl on: writer [
	writer div: 'menu-item'.
	self translated
		ifTrue: [ writer
				simpleBlue:
					(writer
						url: (self translated: #('../en/' '../fr/')) , translateUrl
						labeled: 'FR').
			writer write: '|'.
			writer simpleRed: (writer url: '#' labeled: 'EN').
			^ writer closeMarkup ].
	writer simpleRed: (writer url: '#' labeled: 'FR').
	writer write: '|'.
	writer
		simpleBlue:
			(writer
				url: (self translated: #('../en/' '../fr/')) , translateUrl
				labeled: 'EN').
	writer closeMarkup
]

{ #category : #'generation - sections' }
CVGGenerator >> generateVulgaFrom: aSection with: writer [
	| vulga cap |
	vulga := aSection data
		select: [ :e | e type class = CVGAdditionalTeachingType vulga class ].
	cap := aSection data
		detect: [ :e | 
			e type class = CVGAdditionalTeachingType cap class
				and: [ e sectionType class = CVGAdditionalTeachingType vulga class ] ].

	"Cap generation"
	writer title: (self translated: cap title)  h: 'h6'.

	"writer text: (self translated: cap text)."
	writer startUnorderedList.
	"atelier generation"
	vulga
		do: [ :a | 
			writer openListItem.
			writer bold: (self translated: a title).
			writer text: ', '.
			writer text: (self translated: a dateString).
			writer text: '. '.
			writer text: (self translated: a text).
			writer closeListItem ].
	writer stopUnorderedList
]

{ #category : #generation }
CVGGenerator >> generateWorkStudy: aCVGWorkStudy [ 
	| writer |
	writer := self newWriterFor: aCVGWorkStudy.
	writer tableRow.
	writer tableColumn: (self translated: aCVGWorkStudy start), ' - ', (self translated: aCVGWorkStudy stop).
	writer tableColumn: (self translated: aCVGWorkStudy institution).
	writer tableColumn: (self translated: aCVGWorkStudy title).
	writer closeRow 
]

{ #category : #generation }
CVGGenerator >> generateWorkStudy: aCVGWorkStudy with: writer [

	writer tableRow.
	writer tableColumn: (self translated: aCVGWorkStudy start), ' - ', (self translated: aCVGWorkStudy stop).
	writer tableColumn: (self translated: aCVGWorkStudy institution).
	writer tableColumn: (self translated: aCVGWorkStudy title).
	writer closeRow 
]

{ #category : #accessing }
CVGGenerator >> generatedSection: aSectionName [

	^outputDic at: (outputDic keys detect:[:key| key title = aSectionName])
]

{ #category : #initialization }
CVGGenerator >> html [
	writerClass := CVGSimpleHtmlWriter
]

{ #category : #pages }
CVGGenerator >> htmlHeader [
	^ self generatedSection: 'Header-formatted'
]

{ #category : #'generation - pages' }
CVGGenerator >> htmlPagePostface [
	^'</div></div></div></body></html>'
]

{ #category : #'generation - pages' }
CVGGenerator >> htmlPagePreamble [
	^'<!DOCTYPE html>
	<html>
	<head>
	<meta charset="utf-8">
	<title>Dr. Steven Costiou - CV</title>
	<meta name="description" content="">
	<meta name="author" content="">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="//fonts.googleapis.com/css?family=Raleway:400,300,600" rel="stylesheet" type="text/css">
	<link rel="stylesheet" href="../css/normalize.css"> <link rel="stylesheet" href="../css/skeleton.css"> 	<link rel="stylesheet" href="../styles/main-s.css">
	<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
	<link rel="icon" type="image/png" href="../images/favicon.png">
	</head>
	<body> 
	<div class="container">'
]

{ #category : #accessing }
CVGGenerator >> imageDirectory [
	^'../images/'
]

{ #category : #initialization }
CVGGenerator >> initialize [
	outputDic := Dictionary new
]

{ #category : #initialization }
CVGGenerator >> latex [
	writerClass := CVGLatexWriter
]

{ #category : #initialization }
CVGGenerator >> model: aCVGCurriculum [
	model := aCVGCurriculum 
]

{ #category : #streams }
CVGGenerator >> newStream [
	^ WriteStream on: String new
]

{ #category : #writers }
CVGGenerator >> newWriterFor: aCVGElement [
	^ (writerClass for: aCVGElement) on: self stream
]

{ #category : #export }
CVGGenerator >> pageDirectory [
	^ '/Users/steven/Documents/projets/website/site/'
		, (self translated: #('fr' 'en'))
]

{ #category : #pages }
CVGGenerator >> pageTitles [
	|titles i|
	titles := #(
	#('Recherche' 'Research' 'index.html' 'science')
	#('Projets' 'Projects' 'projects.html' 'dvr')  
	#('Étudiants' 'Students' 'students.html' 'book')
	#('Publications' 'Publications' 'publications.html' 'article') 
	#('Logiciels' 'Software' 'software.html' 'save') 
	#('Communications' 'Talks' 'talks.html' 'mic') 
	#('Enseignement' 'Teaching'  'teaching.html' 'school')
	#('Service' 'Service'  'service.html' 'history_edu')
	#('Administration' 'Administration'  'admin.html' 'account_balance')
	#('CV' 'CV'  'cv.html' 'work')
	
		).
	i := 2.
	^titles collect:[:array|
		|col |
		col := array asOrderedCollection.		
		col add: i afterIndex: 2.
		i := i+1.
		col

	]
]

{ #category : #generation }
CVGGenerator >> regenerateHeader [
	self resetStream. 
	self generateHeader: model header data first.
	outputDic at: (CVGSection new title:'Header-formatted') put: stream contents 
]

{ #category : #streams }
CVGGenerator >> resetStream [
	stream := self newStream
]

{ #category : #pages }
CVGGenerator >> staticAppendicesFor: sectionName [

	| data |
	data := OrderedCollection new.
	sectionName = 'Software' ifTrue: [ 
		| dataStream fr en |
		dataStream := '/Users/steven/Documents/projets/website/site/data/static/games'
			              asFileReference readStream.
		
		dataStream match: '::FR::'.
		fr := dataStream upToAll: '::EN::'.
		en := dataStream upToEnd.
		data add: (self translated
				 ifTrue: [ en ]
				 ifFalse: [ fr ]) ].
	^ data
]

{ #category : #streams }
CVGGenerator >> stream [
	^ stream ifNil: [ stream := self newStream ]
]

{ #category : #accessing }
CVGGenerator >> translated [
	^ translated ifNil:[translated := false]
]

{ #category : #generation }
CVGGenerator >> translated: anArray [
	| translatedString |
	translatedString := self translated
		ifTrue: [ anArray second ]
		ifFalse: [ anArray first ].
	^ (translatedString reject: [ :e | e = $$ ]) replaceAll: $` with: $'
]

{ #category : #export }
CVGGenerator >> writePages [
	| dir |
	dir := self exportDirectory.
	generatedPages
		keysAndValuesDo: [ :pageName :page | 
			| file |
			file := dir / pageName.
			file writeStream
				nextPutAll: page;
				close ]
]

{ #category : #'generation - sections' }
CVGGenerator >> writeTeachingHoursFrom: aSection with: writer [
	|str cm td tp totEqTD|
	
	writer bold: (self translated: {'Total : '.  'Total:'}).
	str := WriteStream on: String new.
	cm := aSection data inject: 0 into:[:sum :t|  sum + t cm].
	td := aSection data inject: 0 into:[:sum :t|  sum + t td].
	tp := aSection data inject: 0 into:[:sum :t|  sum + t tp].
	totEqTD := (cm * 1.5) + td + (tp * 2 / 3).
	str nextPutAll: cm printString.
	str nextPutAll: (self translated: {'h CM'. 'h lectures'}).
	str nextPutAll: ','.
	str space.
	str nextPutAll: td printString.
	str nextPutAll: (self translated: {'h TD'. 'h supervised work'}).
	str nextPutAll: ','.
	str space.
	str nextPutAll: tp printString.
	str nextPutAll: (self translated: {'h TP'. 'h practical work'}).
	writer text: str contents.
	writer italic: ' (', totEqTD rounded printString, 'h eq. TD)'
]
