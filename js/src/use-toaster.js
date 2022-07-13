import { Toaster } from '@blueprintjs/core';

export const useToaster = (props) => {
  const { toasterId, ...propsRest } = props;
	const AppToaster = Toaster.create({...propsRest});
	Shiny.addCustomMessageHandler(`show${toasterId}`, (toast) => {
		AppToaster.show(toast.toastConfig, toast.key);
	});
	Shiny.addCustomMessageHandler(`clear${toasterId}`, (empty) => {
		AppToaster.clear();
	});
	Shiny.addCustomMessageHandler(`dismiss${toasterId}`, (key) => {
		AppToaster.dismiss(key);
	});
};

Shiny.addCustomMessageHandler('useToaster', (toasterProps) => {
	useToaster(toasterProps);
});
