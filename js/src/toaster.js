import { Toaster } from '@blueprintjs/core';
import { addBlueprintPrefix } from './utils/add-blueprint-prefix.js';

const toasters = {};

export const useToaster = (props) => {
	const { toasterId, ...propsRest } = props;
	toasters[toasterId] = Toaster.create({ ...propsRest });
	Shiny.addCustomMessageHandler(addBlueprintPrefix(`show${toasterId}`), (toast) => {
		toasters[toasterId].show(toast.props, toast.key ? toast.key : undefined);
	});
	Shiny.addCustomMessageHandler(addBlueprintPrefix(`clear${toasterId}`), (empty) => {
		toasters[toasterId].clear();
	});
	Shiny.addCustomMessageHandler(addBlueprintPrefix(`dismiss${toasterId}`), (key) => {
		toasters[toasterId].dismiss(key);
	});
};

Shiny.addCustomMessageHandler(addBlueprintPrefix('createToaster'), (toasterProps) => {
	useToaster(toasterProps);
});
