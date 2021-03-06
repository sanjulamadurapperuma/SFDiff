building
recursiveBuildFromModelEntities: famixEntities
	famixEntities
		do: [ :entity |
			buildStack isEmpty
				ifFalse: [ | from to |
					from := self entity: buildStack top in: self model.
					to := self entity: entity in: self model.
					(from isNotNil and: [ to isNotNil ])
						ifTrue: [ graph
								addEdge:
									(SFEdge
										from: from
										to: to
										named: from className , to className
										forComposition: true) ] ].
			buildStack push: (self entity: entity in: self model).
			self recursiveBuildFromModelEntities: (self childrenEntitiesOf: (self entity: entity in: self model)).
			buildStack pop ]