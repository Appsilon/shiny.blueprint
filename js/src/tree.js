import React, { useCallback, useEffect, useReducer } from "react";
import PropTypes from "prop-types";
import { cloneDeep } from "lodash";
import { Tree as BlueprintTree } from "@blueprintjs/core";

function forEachNode(nodes, callback) {
  if (nodes === undefined) {
    return;
  }
  for (const node of nodes) {
    callback(node);
    forEachNode(node.childNodes, callback);
  }
}

function getSelectedNodes(nodes) {
  if (nodes === undefined) {
    return [];
  }
  const selectedNodes = nodes
    .filter(({ isSelected }) => isSelected)
    .map(({ label }) => label);
  const selectedChildNodes = nodes.flatMap((node) =>
    getSelectedNodes(node.childNodes)
  );
  return [...selectedNodes, ...selectedChildNodes];
}

function forNodeAtPath(nodes, path, callback) {
  callback(BlueprintTree.nodeFromPath(path, nodes));
}

function treeReducer(state, action) {
  const newState = cloneDeep(state);
  switch (action.type) {
    case "DESELECT_ALL":
      forEachNode(newState, (node) => (node.isSelected = false));
      return newState;
    case "SET_IS_EXPANDED":
      forNodeAtPath(
        newState,
        action.payload.path,
        (node) => (node.isExpanded = action.payload.isExpanded)
      );
      return newState;
    case "SET_IS_SELECTED":
      forNodeAtPath(
        newState,
        action.payload.path,
        (node) => (node.isSelected = action.payload.isSelected)
      );
      return newState;
    default:
      return state;
  }
}

const propTypes = {
  inputId: PropTypes.string,
  data: PropTypes.object,
};

const Tree = ({ inputId, data }) => {
  const [nodes, dispatch] = useReducer(treeReducer, data);

  useEffect(() => {
    forEachNode(data, (node) => {
      if (node.id === undefined) {
        node.id = `${node.label}-${Math.random()}`;
      }
    })
  }, []);

  useEffect(() => {
    const selectedNodes = getSelectedNodes(nodes);
    Shiny.setInputValue(inputId, selectedNodes);
  }, [nodes]);

  const handleNodeClick = useCallback((node, nodePath, event) => {
    const originallySelected = node.isSelected;
    if (!event.shiftKey) {
      dispatch({ type: "DESELECT_ALL" });
    }
    dispatch({
      payload: {
        path: nodePath,
        isSelected: originallySelected == null ? true : !originallySelected,
      },
      type: "SET_IS_SELECTED",
    });
  }, []);

  const handleNodeCollapse = useCallback((_node, nodePath) => {
    dispatch({
      payload: { path: nodePath, isExpanded: false },
      type: "SET_IS_EXPANDED",
    });
  }, []);

  const handleNodeExpand = useCallback((_node, nodePath) => {
    dispatch({
      payload: { path: nodePath, isExpanded: true },
      type: "SET_IS_EXPANDED",
    });
  }, []);

  return React.createElement(BlueprintTree, {
    contents: nodes,
    onNodeClick: handleNodeClick,
    onNodeCollapse: handleNodeCollapse,
    onNodeExpand: handleNodeExpand,
  });
};

Tree.propTypes = propTypes;
export default Tree;
