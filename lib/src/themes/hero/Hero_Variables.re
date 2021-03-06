[@bs.module "../../helpers/normalizeText.js"]
external normalizeText: float => float = "default";

let isWeb = ReactNative.(Platform.os == Platform.web);

let _BLUE = "#1dbeee";
let _FOCUS_BLUE_1 = "#003580";
let _FOCUS_BLUE_2 = "#40679f";
let _FOCUS_BLUE_3 = "#5d7ead";
let _BACKGROUND_BLUE_1 = "#347ab7";
let _BACKGROUND_BLUE_2 = "#b5eeff";
let _BACKGROUND_BLUE_3 = "#e6f7ff";
let _RED = "#de350b";
let _ORANGE = "#ffa234";
let _MAGENTA = "#ee1d84";
let _PINK = "#fe56aa";
let _YELLOW = "#fadb14";
let _GREEN = "#01b39c";

let _DARK_RED = "#a92200";
let _SOFT_RED = "#ffe3db";
let _DARK_GREEN = "#006e60";
let _SOFT_GREEN = "#cefff9";
let _DARK_ORANGE = "#e36e00";
let _SOFT_ORANGE = "#fff6eb";
let _DARK_PINK = "#b83f79";
let _SOFT_PINK = "#fff3f9";
let _DARK_YELLOW = "#ceb200";
let _SOFT_YELLOW = "#ffffdf";

let _BLACK = "#000000";
let _GREY_1 = "#2b2b2b";
let _GREY_2 = "#71767c";
let _GREY_3 = "#a3a6ac";
let _GREY_4 = "#d9dbdf";
let _GREY_5 = "#f5f6f8";
let _WHITE = "#fcfcfc";

let _BASE_SIZE = isWeb ? 16.0 : normalizeText(13.0);
let _FONT_SIZE = isWeb ? 16.0 : normalizeText(13.0);

/* Edit these 👇 */

let _FONT_FAMILY = isWeb ? None : Some("Proxima Nova");

let _PRIMARY_COLOR = _BLUE;
let _DARK_PRIMARY_COLOR = _FOCUS_BLUE_1;
let _LIGHT_PRIMARY_COLOR = _BACKGROUND_BLUE_2;
let _DANGER_COLOR = _PINK; /* DEPRECATED */
let _ERROR_COLOR = _PINK;
let _WARNING_COLOR = _ORANGE;
let _SUCCESS_COLOR = _GREEN;
let _INFO_COLOR = _BLUE;

let _TEXT_COLOR = _BLACK;
let _INVERTED_TEXT_COLOR = _WHITE;
let _DISABLED_TEXT_COLOR = _GREY_3;
let _MUTED_TEXT_COLOR = _GREY_3;
let _LINK_TEXT_COLOR = _BLUE;

let _BORDER_COLOR = _GREY_4;
let _BACKGROUND_COLOR = _WHITE;
let _DISABLED_BACKGROUND_COLOR = _GREY_4;

let _SMALL_SIZE = _BASE_SIZE *. 0.5;
let _MEDIUM_SIZE = _BASE_SIZE *. 1.0;
let _LARGE_SIZE = _BASE_SIZE *. 1.5;

let _HEADER_5 = _FONT_SIZE *. 0.83;
let _HEADER_4 = _FONT_SIZE *. 1.0;
let _HEADER_3 = _FONT_SIZE *. 1.17;
let _HEADER_2 = _FONT_SIZE *. 1.5;
let _HEADER_1 = _FONT_SIZE *. 2.0;

let default = {
  "BLUE": _BLUE,
  "FOCUS_BLUE_1": _FOCUS_BLUE_1,
  "FOCUS_BLUE_2": _FOCUS_BLUE_2,
  "FOCUS_BLUE_3": _FOCUS_BLUE_3,
  "BACKGROUND_BLUE_1": _BACKGROUND_BLUE_1,
  "BACKGROUND_BLUE_2": _BACKGROUND_BLUE_2,
  "BACKGROUND_BLUE_3": _BACKGROUND_BLUE_3,
  "RED": _RED,
  "ORANGE": _ORANGE,
  "MAGENTA": _MAGENTA,
  "PINK": _PINK,
  "YELLOW": _YELLOW,
  "GREEN": _GREEN,

  "DARK_RED": _DARK_RED,
  "SOFT_RED": _SOFT_RED,
  "DARK_GREEN": _DARK_GREEN,
  "SOFT_GREEN": _SOFT_GREEN,
  "DARK_ORANGE": _DARK_ORANGE,
  "SOFT_ORANGE": _SOFT_ORANGE,
  "DARK_PINK": _DARK_PINK,
  "SOFT_PINK": _SOFT_PINK,
  "DARK_YELLOW": _DARK_YELLOW,
  "SOFT_YELLOW": _SOFT_YELLOW,

  "BLACK": _BLACK,
  "GREY_1": _GREY_1,
  "GREY_2": _GREY_2,
  "GREY_3": _GREY_3,
  "GREY_4": _GREY_4,
  "GREY_5": _GREY_5,
  "WHITE": _WHITE,

  "BASE_SIZE": _BASE_SIZE,
  "FONT_SIZE": _FONT_SIZE,

  "FONT_FAMILY": _FONT_FAMILY,

  "PRIMARY_COLOR": _PRIMARY_COLOR,
  "DARK_PRIMARY_COLOR": _DARK_PRIMARY_COLOR,
  "LIGHT_PRIMARY_COLOR": _LIGHT_PRIMARY_COLOR,
  "DANGER_COLOR": _DANGER_COLOR,
  "ERROR_COLOR": _ERROR_COLOR,
  "WARNING_COLOR": _WARNING_COLOR,
  "SUCCESS_COLOR": _SUCCESS_COLOR,
  "INFO_COLOR": _INFO_COLOR,

  "TEXT_COLOR": _TEXT_COLOR,
  "INVERTED_TEXT_COLOR": _INVERTED_TEXT_COLOR,
  "DISABLED_TEXT_COLOR": _DISABLED_TEXT_COLOR,
  "MUTED_TEXT_COLOR": _MUTED_TEXT_COLOR,
  "LINK_TEXT_COLOR": _LINK_TEXT_COLOR,

  "BORDER_COLOR": _BORDER_COLOR,
  "BACKGROUND_COLOR": _BACKGROUND_COLOR,
  "DISABLED_BACKGROUND_COLOR": _DISABLED_BACKGROUND_COLOR,

  "SMALL_SIZE": _SMALL_SIZE,
  "MEDIUM_SIZE": _MEDIUM_SIZE,
  "LARGE_SIZE": _LARGE_SIZE,

  "HEADER_5": _HEADER_5,
  "HEADER_4": _HEADER_4,
  "HEADER_3": _HEADER_3,
  "HEADER_2": _HEADER_2,
  "HEADER_1": _HEADER_1,
};
