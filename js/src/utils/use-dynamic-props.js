import React from 'react';

export const useDynamicProps = (inputId, initProps) => {
  const [props, setProps] = React.useState(initProps);

  React.useEffect(() => {
    const handlePropsChange = (e) => {
      setProps({
        ...props,
        ...e.detail
      });
    }
    window.addEventListener(inputId, handlePropsChange);
    return () => {
      window.removeEventListener(inputId, handlePropsChange);
    };
  }, []);

  return props;
}