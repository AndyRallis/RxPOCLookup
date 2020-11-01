Class {
	#name : #BaselineOfRxPOCLookup,
	#superclass : #BaselineOf,
	#category : #BaselineOfRxPOCLookup
}

{ #category : #baselines }
BaselineOfRxPOCLookup >> baseline: spec [ 
	<baseline>
	spec
		for: #common
		do: [ 
			"Dependencies"
			self neoJSON: spec.
			self neoCSV: spec.
			self teapot: spec.
			
			"Packages"
			spec 
				package: 'RxPOCLookup';
				package: 'RxPOCLookup-Tests' with: [ spec requires: #('RxPOCLookup') ] ]
]

{ #category : #'external-dependencies' }
BaselineOfRxPOCLookup >> neoCSV: spec [
	spec 
		baseline: 'NeoCSV' 
		with: [ spec repository: 'github://svenvc/NeoCSV/repository' ]
]

{ #category : #'external-dependencies' }
BaselineOfRxPOCLookup >> neoJSON: spec [
	spec 
		baseline: 'NeoJSON' 
		with: [ spec repository: 'github://svenvc/NeoJSON/repository' ]
]

{ #category : #'external-dependencies' }
BaselineOfRxPOCLookup >> teapot: spec [
	spec
		baseline: 'Teapot'
			with: [ spec
				repository: 'github://zeroflag/Teapot:v2.6.0/source';
				loads: #('Deployment') ]
]
