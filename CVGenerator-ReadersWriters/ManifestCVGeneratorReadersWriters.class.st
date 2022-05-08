"
I store metadata for this package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestCVGeneratorReadersWriters,
	#superclass : #PackageManifest,
	#category : #'CVGenerator-ReadersWriters-Manifest'
}

{ #category : #'code-critics' }
ManifestCVGeneratorReadersWriters class >> ruleCollectionProtocolRuleV1FalsePositive [
	^ #(#(#(#RGClassDefinition #(#CVGLatexPreambleGenerator)) #'2022-05-08T15:42:56.98284+02:00') )
]

{ #category : #'code-critics' }
ManifestCVGeneratorReadersWriters class >> ruleLongMethodsRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#CVGGenerator #buildPagesDescriptions #false)) #'2020-12-14T11:07:49.321077+01:00') #(#(#RGMethodDefinition #(#CVGGenerator #generateStudent: #false)) #'2020-12-14T12:36:21.280158+01:00') #(#(#RGClassDefinition #(#CVGLatexPreambleGenerator)) #'2022-05-08T16:06:49.736695+02:00') )
]

{ #category : #'code-critics' }
ManifestCVGeneratorReadersWriters class >> ruleModifiesCollectionRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#CVGGenerator #generateIntro: #false)) #'2020-12-16T10:02:17.494983+01:00') #(#(#RGClassDefinition #(#CVGLatexPreambleGenerator)) #'2022-05-08T16:06:47.534005+02:00') )
]

{ #category : #'code-critics' }
ManifestCVGeneratorReadersWriters class >> ruleReModifiesCollectionRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#CVGHtmlWriter #writePublication: #false)) #'2020-03-29T19:30:56.352861+02:00') #(#(#RGClassDefinition #(#CVGAbstractWriter)) #'2020-03-29T19:35:53.63034+02:00') )
]

{ #category : #'code-critics' }
ManifestCVGeneratorReadersWriters class >> ruleStringConcatenationRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#CVGGenerator #generateCordeesFrom:with: #false)) #'2020-12-12T12:40:22.104893+01:00') )
]
