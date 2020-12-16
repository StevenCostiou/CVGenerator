"
I represent a software artefact developer type
"
Class {
	#name : #CVGSoftwareContributor,
	#superclass : #CVGSoftwareType,
	#category : #'CVGenerator-elements - types'
}

{ #category : #testing }
CVGSoftwareContributor >> isContributor [ 
	^true
]

{ #category : #'accessing - defaults' }
CVGSoftwareContributor >> typeKey [
	^#contributor
]

{ #category : #'accessing - defaults' }
CVGSoftwareContributor >> typeName [ 	
	^#('Contributeur' 'Contributor')
]
