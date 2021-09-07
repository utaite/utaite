import React from "react";

const sizes = {
  default: 14,
  small: 12,
};

const colors = {
  default: "#212121",
  grey: "#9e9e9e",
  "blue-grey": "#607d8b",
  "blue-grey-light": "#90a4ae",
};

const families = {
  default:
    "-apple-system,BlinkMacSystemFont,Segoe UI,Helvetica,Arial,sans-serif,Apple Color Emoji,Segoe UI Emoji",
  mono: "SFMono-Regular,Consolas,Liberation Mono,Menlo,monospace",
};

const weights = {
  default: 400,
  bold: 600,
};

const Text: React.FC<any> = ({
  children = "",
  weight = "default",
  family = "default",
  color = "default",
  size = "default",
  ...props
}) => {
  return (
    <p
      style={{
        whiteSpace: "pre",
        fontSize: `${sizes[size]}px`,
        lineHeight: 1.5,
        fontFamily: families[family],
        color: colors[color],
        fontWeight: weights[weight],
      }}
      {...props}
    >
      {children}
    </p>
  );
};

export default Text;
