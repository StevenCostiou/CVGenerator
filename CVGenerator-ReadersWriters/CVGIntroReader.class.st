Class {
	#name : #CVGIntroReader,
	#superclass : #CVGReader,
	#category : #'CVGenerator-ReadersWriters-Readers'
}

{ #category : #reading }
CVGIntroReader class >> readFromDictionary: dic [

	|intro|
	intro := CVGIntro new.
	intro type: (CVGIntroType type: (self readSymbolProperty: #type in: dic)).
	intro title: (dic at: #title).
	intro text: (dic at: #text).
	intro keywords:(dic at: #keywords).
	intro fundings: (self readFundings: (dic at: #funding)).
	^intro
]

{ #category : #reading }
CVGIntroReader class >> readFundings: array [

	^ array collect: [ :dic | 
		  | fun |
		  fun := CVGFunding new.
		  fun type: CVGFundingType.
		  fun name: (self readStringProperty: #name in: dic).
		  fun url: (self readStringProperty: #url in: dic).
		  fun money: (self readStringProperty: #money in: dic).
		  fun title: (self readStringProperty: #title in: dic).
		 fun description: (self readStringProperty: #description in: dic).
		  fun years: (self readStringProperty: #years in: dic) ]
]
