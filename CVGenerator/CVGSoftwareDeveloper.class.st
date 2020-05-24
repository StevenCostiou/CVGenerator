"
I represent a software artefact contributor type
"
Class {
	#name : #CVGSoftwareDeveloper,
	#superclass : #CVGSoftwareType,
	#category : #'CVGenerator-elements - types'
}

{ #category : #testing }
CVGSoftwareDeveloper >> isDeveloper [
	^true
]

{ #category : #'accessing - defaults' }
CVGSoftwareDeveloper >> typeKey [
	^#developer
]

{ #category : #'accessing - defaults' }
CVGSoftwareDeveloper >> typeName [ 	
	^'Developer'
]
