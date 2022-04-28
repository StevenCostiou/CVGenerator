Class {
	#name : #CVGMissionType,
	#superclass : #CVGAdminType,
	#category : #'CVGenerator-elements - types'
}

{ #category : #visiting }
CVGMissionType >> acceptGenerator: aCVGGenerator for: aCVGAdmin [
	aCVGGenerator generateMandate: aCVGAdmin
]

{ #category : #'as yet unclassified' }
CVGMissionType >> isMission [ ^true
]

{ #category : #'as yet unclassified' }
CVGMissionType >> typeKey [ ^#mission
]

{ #category : #'as yet unclassified' }
CVGMissionType >> typeName [ ^#('Missions' 'Missions')
]
