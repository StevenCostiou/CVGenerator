Class {
	#name : #CVGContributionType,
	#superclass : #CVGAdminType,
	#category : #'CVGenerator-elements - types'
}

{ #category : #visiting }
CVGContributionType >> acceptGenerator: aCVGGenerator for: aCVGAdmin [
	aCVGGenerator generateContribution: aCVGAdmin
]

{ #category : #'as yet unclassified' }
CVGContributionType >> isContribution [ ^true
]

{ #category : #'as yet unclassified' }
CVGContributionType >> typeKey [ ^#contribution
]

{ #category : #'as yet unclassified' }
CVGContributionType >> typeName [ ^#('Contributions' 'Contributions')
]
