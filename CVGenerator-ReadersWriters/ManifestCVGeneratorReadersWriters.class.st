"
I store metadata for this package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestCVGeneratorReadersWriters,
	#superclass : #PackageManifest,
	#category : #'CVGenerator-ReadersWriters-Manifest'
}

{ #category : #'code-critics' }
ManifestCVGeneratorReadersWriters class >> ruleReModifiesCollectionRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#CVGHtmlWriter #writePublication: #false)) #'2020-03-29T19:30:56.352861+02:00') #(#(#RGClassDefinition #(#CVGAbstractWriter)) #'2020-03-29T19:35:53.63034+02:00') )
]
