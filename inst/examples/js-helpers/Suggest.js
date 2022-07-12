{
	const React = window.jsmodule["react"];
	const Blueprint = window.jsmodule["@blueprintjs/core"];
	const BlueprintSelect = window.jsmodule["@blueprintjs/select"];

	const renderFilm = (film, { handleClick, modifiers, query }) => {
		if (!modifiers.matchesPredicate) {
			return null;
		}
		const text = `${film.rank}. ${film.title}`;
		return React.createElement(Blueprint.MenuItem, {
			active: modifiers.active,
			disabled: modifiers.disabled,
			label: film.year.toString(),
			key: film.rank,
			onClick: handleClick,
			text: highlightText(text, query),
		});
	};

	const filterFilm = (query, film) => {
		return (
			`${film.rank}. ${film.title.toLowerCase()} ${film.year}`.indexOf(
				query.toLowerCase()
			) >= 0
		);
	};

	const SuggestExample = (componentVersion) => (props) => {
		const { onSelect, items, placeholder, ...propsRest } = props;
		const [film, setFilm] = React.useState(items[0]);

		const handleItemSelect = (film) => {
			setFilm(film);
			onSelect(film);
		};

		return React.createElement(
			componentVersion,
			{
				items,
				...propsRest,
				itemPredicate: filterFilm,
				itemRenderer: renderFilm,
				noResults: React.createElement(Blueprint.MenuItem, {
					disabled: true,
					text: "No results.",
				}),
				onItemSelect: handleItemSelect,
				inputValueRenderer: (film) => film.title,
				popoverProps: {
					usePortal: false,
				},
				inputProps: {
					placeholder
				}
			},
			React.createElement(Blueprint.InputGroup, {
				value: film.title,
				rightIcon: "caret-down",
			})
		);
	};

	jsmodule.exampleApp.SuggestExample = SuggestExample(BlueprintSelect.Suggest);
	jsmodule.exampleApp.Suggest2Example = SuggestExample(
		BlueprintSelect.Suggest2
	);
}
