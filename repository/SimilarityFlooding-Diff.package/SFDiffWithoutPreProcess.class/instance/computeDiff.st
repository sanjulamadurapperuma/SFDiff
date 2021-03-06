diffing
computeDiff
	| baseGraph targetGraph pairwise inducedPropagation |
	baseGraph := SFGenericGraphBuilder graphBuiltFromModel: self baseModel. self halt.
	targetGraph := SFGenericGraphBuilder graphBuiltFromModel: self targetModel graphClass: SFEdgeNamedGraphWithLabelCache.
	preprocessTime := 0 second.
	pairwiseTime := [ pairwise := baseGraph pairwiseConnectivityGraphWith: targetGraph ] timeToRun.
	inducedPropagationTime := [ inducedPropagation := pairwise asInducedPropagationGraph ] timeToRun.
	inducedPropagation
		initialSigmaValues: (inducedPropagation nodes collect: [ :node | node -> 1 ]) asDictionary.
	
	sfTime := [ inducedPropagation similarityFlooding ] timeToRun.
	changeBuildingTime := [ self buildChangesFrom: inducedPropagation matchCandidates withKnownMatches: #() ] timeToRun