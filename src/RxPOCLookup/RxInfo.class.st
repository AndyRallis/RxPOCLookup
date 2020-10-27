"
I'm a list of perscription drugs. I contain Rx classes.
"
Class {
	#name : #RxInfo,
	#superclass : #Object,
	#instVars : [
		'rxList'
	],
	#category : #RxPOCLookup
}

{ #category : #'read-in' }
RxInfo class >> createRxList: file [ 
 ^ self new rxList:
((NeoCSVReader on: (file asFileReference) readStream)
recordClass: Rx;
skipHeader; 
addField: #ndcnum:;
addIgnoredField;
addIgnoredField;
addIgnoredField;
addIgnoredField;
addIgnoredField;
addIgnoredField;
addIgnoredField;
addIgnoredField;
addIgnoredField;
addIgnoredField;
addIgnoredField;
addIgnoredField;
addIgnoredField;
addIgnoredField;
addField: #pksize:;
addIgnoredField;
addIgnoredField;
addIgnoredField;
addIgnoredField;
addField: #strngth:;
addIgnoredField;
addIgnoredField;
addIgnoredField;
addIgnoredField;
addField: #mstfmds:;
addIgnoredField;
addIgnoredField;
addIgnoredField;
addField: #prodnme:;
addIgnoredField;
addField: #gennme:;
addIgnoredField;
addIgnoredField;
addIgnoredField;
addIgnoredField;
addIgnoredField;
upToEnd)
]

{ #category : #'rx-matcher' }
RxInfo >> findDrug: aDrugName [ 
	^ FuzzyMatcher 
		allSortedByScoreMatching: aDrugName 
		in: rxList
		by: [ :each | each prodnme ]
]

{ #category : #'as yet unclassified' }
RxInfo >> findTopDrugMatch: anInteger key: aKey [
	^ (((self findDrug: aKey) do: 
			[ :rx | rx prodnme ])
			asSet) asOrderedCollection 
			copyFrom: 1
			to: anInteger 
]

{ #category : #accessing }
RxInfo >> rxList [
	^ rxList
]

{ #category : #accessing }
RxInfo >> rxList: aList [
	rxList := aList
]
