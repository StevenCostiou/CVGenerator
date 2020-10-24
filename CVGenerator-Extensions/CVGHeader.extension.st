Extension { #name : #CVGHeader }

{ #category : #'*CVGenerator-Extensions' }
CVGHeader >> acceptGenerator: aCVGGenerator [
	aCVGGenerator generateHeader: self
]
