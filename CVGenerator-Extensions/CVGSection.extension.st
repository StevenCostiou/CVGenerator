Extension { #name : #CVGSection }

{ #category : #'*CVGenerator-Extensions' }
CVGSection >> acceptGenerator: aCVGGenerator [
	aCVGGenerator generateSection: self
]
