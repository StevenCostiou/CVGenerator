Class {
	#name : #CVGMandateType,
	#superclass : #CVGAdminType,
	#category : #'CVGenerator-elements - types'
}

{ #category : #visiting }
CVGMandateType >> acceptGenerator: aCVGGenerator for: aCVGAdmin [
	aCVGGenerator generateMandate: aCVGAdmin
]

{ #category : #'as yet unclassified' }
CVGMandateType >> isMandate [ ^true
]

{ #category : #'as yet unclassified' }
CVGMandateType >> typeKey [ ^#mandate
]

{ #category : #'as yet unclassified' }
CVGMandateType >> typeName [ ^#('Mandats électifs' 'Elective mandates')
]
