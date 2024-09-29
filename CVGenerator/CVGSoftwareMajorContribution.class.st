Class {
	#name : #CVGSoftwareMajorContribution,
	#superclass : #CVGSoftwareType,
	#category : #'CVGenerator-elements - types'
}

{ #category : #testing }
CVGSoftwareMajorContribution >> isMajorSoftwareContribution [
	^true
]

{ #category : #'accessing - defaults' }
CVGSoftwareMajorContribution >> typeKey [
	^#majorContribution
]

{ #category : #'accessing - defaults' }
CVGSoftwareMajorContribution >> typeName [ 	
	^#('Contributions majeures' 'Major contributions')
]
