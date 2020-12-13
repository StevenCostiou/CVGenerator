Class {
	#name : #CVGAdminServiceType,
	#superclass : #CVGAdminType,
	#category : #'CVGenerator-elements - types'
}

{ #category : #visiting }
CVGAdminServiceType >> acceptGenerator: aCVGGenerator for: aCVGAdmin [
	aCVGGenerator generateAdmin: aCVGAdmin
]

{ #category : #'as yet unclassified' }
CVGAdminServiceType >> isAdminService [ ^true
]

{ #category : #'as yet unclassified' }
CVGAdminServiceType >> typeKey [ ^#service
]

{ #category : #'as yet unclassified' }
CVGAdminServiceType >> typeName [ ^#('Service' 'Service')
]
