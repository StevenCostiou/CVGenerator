Class {
	#name : #CVGAdditionalTeachingType,
	#superclass : #CVGElementType,
	#category : #'CVGenerator-elements - types'
}

{ #category : #'as yet unclassified' }
CVGAdditionalTeachingType class >> ateliers [
	^CVGAtelierType new
]

{ #category : #'as yet unclassified' }
CVGAdditionalTeachingType class >> cap [
	^CVGCapType new
]

{ #category : #'as yet unclassified' }
CVGAdditionalTeachingType class >> cordees [
	^CVGCordeeType new
]

{ #category : #'as yet unclassified' }
CVGAdditionalTeachingType class >> vulga [
	^CVGAtelierType new
]

{ #category : #testing }
CVGAdditionalTeachingType >> isAtelier [
	^false
]

{ #category : #testing }
CVGAdditionalTeachingType >> isCap [
	^false
]

{ #category : #testing }
CVGAdditionalTeachingType >> isCordee [
	^false
]

{ #category : #testing }
CVGAdditionalTeachingType >> isVulga [
	^false
]
