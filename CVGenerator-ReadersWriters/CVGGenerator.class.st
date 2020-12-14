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

{ #category : #pages }
CVGGenerator >> buildPagesDescriptions [

	|pages description|
	pages := Dictionary new.
	
	"Publications"
	description := OrderedCollection new.
	description add: (self generatedSection: 'Service').
	pages at: self pageTitles first put: description.
	
	"Publications"
	description := OrderedCollection new.
	description add: (self generatedSection: 'Publications').
	pages at: self pageTitles second put: description.
	
	"Software"
	description := OrderedCollection new.
	description add: (self generatedSection: 'Software').
	pages at: self pageTitles third put: description.
	
	"Talks"
	description := OrderedCollection new.
	description add: (self generatedSection: 'Talks').
	pages at: self pageTitles fourth put: description.

	"Teaching"
	description := OrderedCollection new.
	description add: (self generatedSection: 'Teachings').
	description add: (self generatedSection: 'Past teaching activities').
	pages at: self pageTitles fifth put: description.
	
	"Administration"
	description := OrderedCollection new.
	description add: (self generatedSection: 'Administration').
	pages at: self pageTitles sixth put: description.
	
	"CV"
	description := OrderedCollection new.
	description add: (self generatedSection: 'Experience').
	pages at: self pageTitles seventh put: description.
	
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
	self generateAndExportHtml.
	
	translated := true. 
	oldHeaderKey := outputDic keys detect:[:k| k title = 'Header-formatted'].
	oldHeaderKey ifNotNil: [ outputDic removeKey: oldHeaderKey ].
	self generateCV.
	self generateAndExportHtml.
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
	| mandats membres contributions service |
	mandats := section data
		select: [ :e | e type class == CVGMandateType ].
	writer
		subSection: (self translated: CVGMandateType new typeName).
	writer writeNewLine.
	writer openItemList.
	mandats do:[:m| m acceptGenerator: self].
	writer closeItemList.
	
	membres := section data
		select: [ :e | e type class == CVGMemberType ].
	writer
		subSection: (self translated: CVGMemberType new typeName).
	writer writeNewLine.
	writer openItemList.
	membres do:[:m| m acceptGenerator: self].
	writer closeItemList.
		
	contributions := section data
		detect: [ :e | e type class == CVGContributionType ].
	writer
		subSection: (self translated: contributions title).
	writer writeNewLine.
	contributions acceptGenerator: self.
		
	service := section data
		select: [ :e | e type class == CVGAdminServiceType ].
	writer
		subSection: (self translated: #('Service académique' 'Academic service')).
	writer writeNewLine.
	service do:[:s| s acceptGenerator: self].

	outputDic at: section put: stream contents
	
]

{ #category : #export }
CVGGenerator >> generateAndExportHtml [
	self regenerateHeader.
	self generateHTMLPages.
	self writePages
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
	writer h6: (self translated: cap title).
	writer writeNewLine.
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
	xp := aCVGSection data select:[:e| e type class == CVGWorkType].
	aCVGSimpleHtmlWriter subSection: (self translated: #('Expérience professionnelle' 'Professional experience')).
	aCVGSimpleHtmlWriter writeNewLine.
	aCVGSimpleHtmlWriter writeNewLine.
	aCVGSimpleHtmlWriter newTable.
	xp do:[:e|
		e acceptGenerator: self
		].
	aCVGSimpleHtmlWriter closeTable.	
	
	studies := aCVGSection data select:[:e| e type class == CVGStudyType].
	aCVGSimpleHtmlWriter subSection: (self translated: #('Études' 'Studies')).
	aCVGSimpleHtmlWriter writeNewLine.
	aCVGSimpleHtmlWriter writeNewLine.
	aCVGSimpleHtmlWriter newTable.
	studies do:[:e|
		e acceptGenerator: self
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
				ifFalse: [ writer subSection: type typeName.
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
	writer h6: (self translated: cap title).
	writer writeNewLine.
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
					writer closeDiv.
					writer closeDiv ].
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
			writer closeDiv.
			writer closeDiv.
			writer div: 'four columns align-center bottom-10px'.
			c thumb isEmpty ifFalse:[
			writer image: ('../images/cordees/', c thumb) class: 'photo-cordees mdl-shadow--4dp' border: 0 alt: ''.	].
			writer closeDiv.
			writer closeDiv ]
]

{ #category : #generation }
CVGGenerator >> generateCourse: aCVGCourse [ 
	
]

{ #category : #'generation - pages' }
CVGGenerator >> generateHTMLPage: pageDescription [
	| str |
	str := self newStream.
	str << self htmlPagePreamble.
	str << self htmlHeader.
	str << (self generateMenuFor: pageDescription key).
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
	writer closeDiv.
	writer div: 'profile-info'.
	writer title: (self translated: aCVGHeader title) h: 'h5' class: 'title-name'.
	writer writeNewLine.
	writer title: ((self translated: aCVGHeader rank), ' ', aCVGHeader institution) h: 'h5' class: 'title-name'.
	"writer writeNewLine.
	writer writeUrl: aCVGHeader team second labeled: aCVGHeader team first. 
	writer writeNewLine.
	writer writeUrl: aCVGHeader lab second labeled: aCVGHeader lab first. "
	writer closeDiv.
	writer closeDiv

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
	writer write: '<hr class="blue-hr">'.
	self generateTranslateURL: pageTitle fourth on: writer.
	sortedTitles do:[:title|
		|titleTranslated pageTitleTranslated|
		titleTranslated := (self translated: title).
		pageTitleTranslated := (self translated: pageTitle).
		writer div: 'menu-item'.
		writer div: 'menu-item-logo'.	
		writer write: '<i class="material-icons" style="color:#1565c0">', title fifth, '</i>'.	
		writer closeDiv.
		titleTranslated =  pageTitleTranslated ifTrue:[writer div: 'active-bg'].
		writer write: (writer url: title fourth labeled: titleTranslated).
		titleTranslated =  pageTitleTranslated ifTrue:[writer closeDiv].
		writer closeDiv.
		].
	writer write: '<hr class="blue-hr">'.
	writer closeDiv.
	^writer contents

	
]

{ #category : #'generation - sections' }
CVGGenerator >> generatePastTeachingsSection: aSection with: writer [
	"select cordees, order, get cap then generates"
	writer
		subSection: (self translated: #('Activités passées' 'Past activities')).
	writer writeNewLine.
	self generateCordeesFrom: aSection with: writer.
	self generateAteliersFrom: aSection with: writer.
	self generateVulgaFrom: aSection with: writer.
	outputDic at: aSection put: stream contents
	
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
	writer closeItem
]

{ #category : #generation }
CVGGenerator >> generateResearch: aCVGResearch [ 

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
	writer subSection: 'Service'.
	writer writeNewLine.
	
	"Program committees"
	services := section data
		select: [ :e | e type class = CVGPCType ].
	writer subsubSection:  (self translated: #('Comités de programmes' 'Program commitees')).
	writer writeNewLine.
	writer startUnorderedList.
	services do:[:s| s acceptGenerator: self].
	writer stopUnorderedList.
	
	"Reviewing"
	services := section data
		select: [ :e | e type class = CVGReviewerType ].
	writer subsubSection:  (self translated: #('Comités de relecture' 'Reviewer')).
	writer writeNewLine.
	writer startUnorderedList.
	services do:[:s| s acceptGenerator: self].
	writer stopUnorderedList.
	
	"Session Chair"
	services := section data
		select: [ :e | e type class = CVGSessionChairType ].
	writer subsubSection:  (self translated: #('Session chair' 'Session chair')).
	writer writeNewLine.
	writer startUnorderedList.
	services do:[:s| s acceptGenerator: self].
	writer stopUnorderedList.
	
	"Local committees"
	services := section data
		select: [ :e | e type class = CVGLCType ].
	writer subsubSection:  (self translated: #('Comités d''organisation locale' 'Local organisation committee')).
	writer writeNewLine.
	writer startUnorderedList.
	services do:[:s| s acceptGenerator: self].
	writer stopUnorderedList.
	
	"Student Volunteer"
	services := section data
		select: [ :e | e type class = CVGVolunteerType ].
	writer subsubSection:  (self translated: #('Étudiant volontaire' 'Student volunteer')).
	writer writeNewLine.
	writer startUnorderedList.
	services do:[:s| s acceptGenerator: self].
	writer stopUnorderedList.
	
	
	
	outputDic at: section put: stream contents
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
	writer writeNewLine.
	writer
		text:
			(self
				translated:
					#('En bleu, les modules dont je suis ou ai été responsable.' 'In blue, the courses I am or was responsible for.')).
	writer writeNewLine.
	writer newTable.
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
			^ writer closeDiv ].
	writer simpleRed: (writer url: '#' labeled: 'FR').
	writer write: '|'.
	writer
		simpleBlue:
			(writer
				url: (self translated: #('../en/' '../fr/')) , translateUrl
				labeled: 'EN').
	writer closeDiv
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
	writer h6: (self translated: cap title).
	writer writeNewLine.
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
	^'</div></body></html>'
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
	^ #(
	#('Recherche' 'Research' 2 'research.html' 'science') 
	#('Publications' 'Publications' 3 'publications.html' 'article') 
	#('Logiciels' 'Software' 4 'software.html' 'save') 
	#('Communications' 'Talks' 5 'talks.html' 'mic') 
	#('Enseignement' 'Teaching' 6 'teaching.html' 'school')
	#('Administration' 'Administration' 7 'admin.html' 'account_balance')
	#('CV' 'CV' 8 'cv.html' 'work') 
	
	
	)
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
