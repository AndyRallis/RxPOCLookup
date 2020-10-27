"
I'm a list of perscription drugs. I contain Rx classes.
"
Class {
	#name : #RxInfo,
	#superclass : #Object,
	#instVars : [
		'rxList',
		'currentList'
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

{ #category : #accessing }
RxInfo >> drugMatchResults: aDrugName [
	| matchList isMatch |
	matchList := self findExactDrug: aDrugName.
	isMatch := matchList isNotEmpty.
	^ RxResult matchList: matchList match: isMatch
]

{ #category : #'rx-matcher' }
RxInfo >> findDrug: aDrugName [ 
	"Fuzzy drug match to return top drugs"
	^ FuzzyMatcher 
		allSortedByScoreMatching: aDrugName 
		in: rxList
		by: [ :each | each prodnme ]
]

{ #category : #'rx-matcher' }
RxInfo >> findExactDrug: aDrugName [ 
	"When user selects from the list, we then pull all drugs with exact match"
	^ rxList select: [ :rx | rx prodnme = aDrugName ]
]

{ #category : #'rx-matcher' }
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
