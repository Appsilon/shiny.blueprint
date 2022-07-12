{
	const React = jsmodule["react"];
	const Blueprint = jsmodule["@blueprintjs/core"];
	const BlueprintSelect = jsmodule["@blueprintjs/select"];

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

	SelectExample = (componentVersion) => (props) => {
		const { onSelect, items, ...propsRest } = props;

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
				popoverProps: {
					usePortal: false,
				},
			},
			React.createElement(Blueprint.Button, {
				text: film.title,
				rightIcon: "caret-down",
			})
		);
	};

	jsmodule.exampleApp.SelectExample = SelectExample(BlueprintSelect.Select);
	jsmodule.exampleApp.Select2Example = SelectExample(BlueprintSelect.Select2);
}
