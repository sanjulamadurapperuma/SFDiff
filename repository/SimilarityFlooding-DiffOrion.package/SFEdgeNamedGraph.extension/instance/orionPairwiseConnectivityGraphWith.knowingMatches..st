*SimilarityFlooding-DiffOrion
orionPairwiseConnectivityGraphWith: anotherSFEdgeNamedGraph knowingMatches: matchesDict
	^ self pairwiseConnectivityGraphWith: anotherSFEdgeNamedGraph knowingMatches: matchesDict edgesAndNodesBuildingBlock: [ :baseGraph :targetGraph :pcgEdges :pcgNodes | self orionBuildPCGEdgesAndNodesFrom: baseGraph and: targetGraph andStoreResultingEdgesIn: pcgEdges andResultingNodesIn: pcgNodes ]